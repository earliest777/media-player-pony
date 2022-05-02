//
// Created by ColorsWind on 2022/5/1.
//

#ifndef PONYPLAYER_AUDIOSINK_H
#define PONYPLAYER_AUDIOSINK_H

#include <portaudio.h>
#include <vector>
#include <QtMultimedia/QtMultimedia>
#include <QBuffer>
#include "pa_ringbuffer.h"

namespace PonyAudio {
    std::vector<int> getDeviceList() {

    }
}

enum class PlaybackState {
    PLAYING, ///< 正在播放
    STOPPED, ///< 停止状态
    IDLED,   ///< 空闲状态
};

/**
 * @brief 播放音频裸流, 用于代替QAudioSink.
 *
 * 这个类的RAII的.
 */
class PonyAudioSink : public QObject {
    Q_OBJECT
private:
    size_t m_bufsize;

    PaStream *m_stream;
    PaStreamParameters *param;

    PaTime timeBase;
    int m_sampleRate;
    size_t m_numSamples;
    size_t m_bytesPerSample;
    int m_channelCount;
    size_t m_numBytes;
    void *ringBufferData;

    static PaSampleFormat qSampleFormatToPortFormat(QAudioFormat::SampleFormat qFormat, size_t &numBytes);

    PlaybackState m_state;

    int m_paCallback(const void *inputBuffer, void *outputBuffer,
                     unsigned long framesPerBuffer,
                     const PaStreamCallbackTimeInfo *timeInfo,
                     PaStreamCallbackFlags statusFlags);

    static unsigned nextPowerOf2(unsigned val);

    PaUtilRingBuffer ringBuffer;


public:
    /**
     * 计算音频长度对应的数据大小
     * @param format 音频格式
     * @param duration 音频时长(单位: us)
     * @return 数据大小(单位: byte)
     */
    inline static int durationToSize(const QAudioFormat &format, int64_t duration) {
        return format.bytesForDuration(duration);
    }


    /**
     * 计算音频数据长度对应的数据大小
     * @param format 音频格式
     * @param bytes 数据大小(单位: byte)
     * @return 音频时长(单位: us)
     */
    inline static int64_t sizeToDuration(const QAudioFormat &format, int bytes) {
        return format.durationForBytes(bytes);
    }

    /**
     * 创建PonyAudioSink并attach到默认设备上
     * @param frameBufferSize 系统buffer大小
     * @param bufferSize PonyAudioSink的缓存大小
     * @param format 音频格式
     */
    PonyAudioSink(QAudioFormat format, size_t bufferSize = 0, size_t internalQueueSize = 200);

    /**
     * 析构即从deattach当前设备
     */
    ~PonyAudioSink();

    /**
     * 开始播放
     */
    void start();

    /**
     * 尽快停止播放
     */
    void stop();

    /**
     * 放弃缓冲区的内容, 立即停止播放
     */
    void abort();

    /**
     * 获取播放状态
     * @return
     */
    PlaybackState state() const;

    /**
     * 获取AudioBuffer剩余空间
     * @return 剩余空间(单位: byte)
     */
    size_t freeByte() const;

    /**
     * 写AudioBuffer, 要么写入完全成功, 要么失败. 这个操作保证在VideoThread上进行.
     * @param buf 数据源
     * @param len 长度(单位: byte)
     * @return 写入是否成功
     */
    bool write(const char *buf, qint64 len);

    /**
     * 清空AudioBuffer, 将所有空间标记为可用. 这个操作保证在VideoThread上进行.
     * @return 清空数据长度(单位: byte)
     */
    size_t clear();

//    /**
//     * 获取AudioBuffer数据.
//     * @return
//     */
//    const char* data();

    /**
     * 获取当前播放的时间
     * @return 当前已播放音频的长度(单位: 秒)
     */
    double getProcessSecs() const;

    /**
     * 设置当前播放的时间,
     * @param t 新的播放时间(单位: 秒)
     */
    void setProcessSecs(double t = 0.0);

    static int paCallback(const void *inputBuffer, void *outputBuffer,
                          unsigned long framesPerBuffer,
                          const PaStreamCallbackTimeInfo *timeInfo,
                          PaStreamCallbackFlags statusFlags,
                          void *userData);

    static void paStreamFinished(void *userData);
};


#endif //PONYPLAYER_AUDIOSINK_H