//
// Created by ColorsWind on 2022/5/5.
//

#pragma once
#include <QObject>
#include "playback.hpp"

/**
 * @brief 将解码拿到的帧传递给输出.
 *
 *
 */
class FrameController: public QObject {
    Q_OBJECT
private:
    QThread *m_affinityThread;
    Demuxer *m_demuxer;
    Playback *m_playback;
public:
    FrameController(QObject *parent): QObject(nullptr) {
        m_affinityThread = new QThread;
        m_affinityThread->setObjectName("FrameControllerThread");
        this->moveToThread(m_affinityThread);
        connect(m_affinityThread, &QThread::started, [this]{
            this->m_demuxer = new Demuxer{this};
            this->m_playback = new Playback{m_demuxer, this};
            connect(m_playback, &Playback::setPicture, this, &FrameController::setPicture, Qt::DirectConnection);
            connect(m_playback, &Playback::stateChanged, this, &FrameController::playbackStateChanged, Qt::DirectConnection);
            connect(this, &FrameController::signalDecoderOpenFile, m_demuxer, &Demuxer::openFile);
            // WARNING: BLOCKING_QUEUED_CONNECTION!!!
            connect(this, &FrameController::signalDecoderSeek, m_demuxer, &Demuxer::seek, Qt::BlockingQueuedConnection);
            connect(m_demuxer, &Demuxer::openFileResult, this, [this](bool success){
                if (success) {
                    m_demuxer->start();
                    m_playback->showFrame();
                }
                emit openFileResult(success);
            });
            connect(m_playback, &Playback::resourcesEnd, this, &FrameController::resourcesEnd, Qt::DirectConnection);
            connect(this, &FrameController::signalSetTrack, this, [this](int i){
                qreal pos = m_playback->getAudioPos(m_demuxer->isBackward());
                m_playback->stop();
                m_demuxer->pause();
                m_demuxer->setTrack(i);
                seek(pos);
            });
            connect(this, &FrameController::signalBackward, this, [this]{
                qreal pos = m_playback->getAudioPos(m_demuxer->isBackward());
                m_playback->stop();
                m_demuxer->pause();
                m_demuxer->backward();
                seek(pos);
                m_demuxer->start();
            });
            connect(this, &FrameController::signalForward, this, [this]{
                qreal pos = m_playback->getAudioPos(m_demuxer->isBackward());
                m_playback->stop();
                m_demuxer->pause();
                m_demuxer->forward();
                seek(pos);
                m_demuxer->start();
            });
            connect(m_playback, &Playback::requestResynchronization, this, [this](bool enableAudio){
                bool isPlay = m_playback->isPlaying();
                qreal pos = m_playback->getPreferablePos();
                m_playback->stop();
                m_demuxer->pause();
                seek(pos);
                m_demuxer->setEnableAudio(enableAudio);
                m_demuxer->start();
                if (isPlay) {m_playback->start(); }
            }, Qt::QueuedConnection);
        });
        m_affinityThread->start();
    }

    virtual ~FrameController() {
        m_affinityThread->quit();
    }

    void setTrack(int i) {
        emit signalSetTrack(i);
    }

    PONY_THREAD_SAFE void backward() {
        emit signalBackward();
    }

    PONY_THREAD_SAFE void forward() {
        emit signalForward();
    }

    PONY_THREAD_SAFE qreal getPreferablePos() {
        return m_playback->getPreferablePos();
    }

    /**
     * 这个方法是线程安全的
     * @return
     */
    qreal getAudioDuration() { return m_demuxer->audioDuration(); }

    /**
     * 这个方法是线程安全的
     * @return
     */
    qreal getVideoDuration() { return m_demuxer->videoDuration(); }

    /**
     * 这个方法是线程安全的
     * @return
     */
    QStringList getTracks() { return m_demuxer->getTracks(); }

    bool hasVideo() { return m_demuxer->hasVideo(); }

    void setVolume(qreal volume) {m_playback->setVolume(volume); }
    void setSpeed(qreal speed) {m_playback->setSpeed(speed); }

public slots:
    void openFile(const QString &path) {
        QUrl url(path);
        QString localPath = url.toLocalFile();
        qDebug() << "Open file" << localPath;
        emit signalDecoderOpenFile(localPath.toStdString());
    }


    void pause() {
        qDebug() << "Pausing";
        m_playback->pause();
    }

    void stop() {
        qDebug() << "Stopping";
        m_demuxer->close();
        m_demuxer->flush();
        m_playback->stop();
    }

    void close() {
        qDebug() << "Closing";
        m_demuxer->close();
        m_playback->stop();
    }

    void start() {
        qDebug() << "Starting";
        m_demuxer->start();
        m_playback->start();
    }

    void seek(qreal seekPos) {
        qDebug() << "Start seek for" << seekPos;
        m_playback->stop();

        m_demuxer->pause();  // blocking, make sure pic and sample request can be blocked
        // WARNING: must make sure everything (especially PTS) has been properly updated
        // otherwise, the video thread will be BLOCKING for a long time.
        emit signalDecoderSeek(seekPos); // blocking connection
        m_demuxer->flush();
        m_demuxer->start();

        bool backward = m_demuxer->isBackward();
        // time-consuming job
        // use audio frame pts may be more accurate, but it is not available in rewinding.
        qreal startPoint;
        if (backward) {
            // if rewinding, there is no need to skip frame. (dispatcher guarantee)
            startPoint = m_demuxer->frontPicture();
        } else {
            if (m_demuxer->hasVideo()) {
                m_demuxer->skipPicture([seekPos](qreal framePos) { return framePos < seekPos; });
            }
            m_demuxer->skipSample([seekPos, &startPoint](qreal framePos) { return startPoint = framePos, framePos < seekPos;});

        }

        emit signalPositionChangedBySeek(); // block
        m_playback->setStartPoint(startPoint);
        m_playback->showFrame();

        qDebug() << "start point" << startPoint;
        qDebug() << "End seek for" << seekPos;
    }

signals:
    void signalDecoderOpenFile(std::string path);
    void signalDecoderSeek(qreal pos);
    void signalPositionChangedBySeek();
    void signalSetTrack(int i);
    void signalBackward();
    void signalForward();

    void openFileResult(bool success);
    void playbackStateChanged(bool isPlaying);
    void resourcesEnd();
    void setPicture(VideoFrame pic);


};

