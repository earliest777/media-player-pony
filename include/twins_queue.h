//
// Created by ColorsWind on 2022/5/4.
//
#pragma once
#ifndef PONYPLAYER_TWINS_QUEUE_H
#define PONYPLAYER_TWINS_QUEUE_H
#include <queue>
#include <string>
#include <utility>

//#define DEBUG_PRINT_FUNCTION_CALL
/**
 * @brief 联动队列. 用于单生产者多队列, 单消费者通信.
 * @tparam T
 */
template<typename T>
class TwinsBlockQueue {
    std::queue<T> m_data;
    const std::string m_name;
    const size_t m_prefer;


    TwinsBlockQueue<T> *m_twins = nullptr;
    std::mutex *m_mutex = nullptr;
    std::condition_variable *m_cond = nullptr;
    bool *m_open  = nullptr;
private:
    TwinsBlockQueue(
        std::string name,
        size_t prefer,
        TwinsBlockQueue<T> *twins
    ) : m_name(std::move(name)), m_prefer(prefer), m_twins(twins){
        if (prefer < 2) { throw std::runtime_error("PreferSize must not less than 2."); }
        this->m_mutex = twins->m_mutex;
        this->m_cond = twins->m_cond;
        this->m_open = twins->m_open;
    }

    inline bool isOpen() { return *m_open; }

public:
    TwinsBlockQueue(std::string name, size_t prefer) : m_name(std::move(name)), m_prefer(prefer) {
        if (prefer < 2) { throw std::runtime_error("PreferSize must not less than 2."); }
        this->m_mutex = new std::mutex;
        this->m_cond = new std::condition_variable;
        this->m_open = new bool{true};
        this->m_twins = nullptr;

    }

    TwinsBlockQueue<T> *twins(const std::string &name, size_t prefer) {
        std::unique_lock lock(*m_mutex);
        if (m_twins) { throw std::runtime_error("Already generate twins."); }
        m_twins = new TwinsBlockQueue<T>{name, prefer, this};
        return m_twins;
    }

    void close() {
        std::unique_lock lock(*m_mutex);
        *m_open = false;
        m_cond->notify_all();
#ifdef DEBUG_PRINT_FUNCTION_CALL
        qDebug() << m_name.c_str() << "Close" << m_data.size();
#endif
    }

    void clear(std::function<void(T)> freeFunc) {
        std::unique_lock lock(*m_mutex);
        while(!m_data.empty()) {
            freeFunc(m_data.front());
            m_data.pop();
        }
        m_cond->notify_all();
#ifdef DEBUG_PRINT_FUNCTION_CALL
        qDebug() << m_name.c_str() << "Clear" << m_data.size();
#endif
    }

    void open() {
        std::unique_lock lock(*m_mutex);
        *m_open = true;
    }


    bool push(const T item) {
        std::unique_lock lock(*m_mutex);
        m_cond->wait(lock, [this]{ return this->m_data.size() < m_prefer || m_twins->m_data.size() < m_twins->m_prefer || !isOpen();});
        m_data.push(item);
        if (m_data.size() == 1) { m_cond->notify_all(); }
#ifdef DEBUG_PRINT_FUNCTION_CALL
        qDebug() << m_name.c_str() << "Push" << m_data.size();
#endif
        return m_data.size() <= m_prefer;
    }

    /**
     * 取出队首元素, 若缺少元素, 则阻塞直到有元素.
     * @return
     */
    const T& front() {
        const static T defaultValue = {};
        std::unique_lock lock(*m_mutex);
        m_cond->wait(lock, [this]{ return !this->m_data.empty() || !isOpen();});
#ifdef DEBUG_PRINT_FUNCTION_CALL
        qDebug() << m_name.c_str() << "IsEmpty" << m_data.empty() << "isOpen" << isOpen();
#endif
        if (m_data.empty()) {
            return defaultValue;
        } else {
            return m_data.front();
        }
    }

//    /**
//     * 删除队首元素并返回, 需要保证 size >= 1.
//     */
//    T remove() {
//        std::unique_lock lock(mutex);
//        if (this->data.empty()) {
//            cond.wait(lock);
//        }
//        auto ret = data.front();
//        data.pop();
//
//        return ret;
//    }

    /**
     * 删除队首元素, 需要保证 size >= 1.
     */
    bool pop() {
        std::unique_lock lock(*m_mutex);
        if (m_data.empty()) { return false; }
        m_data.pop();
        // avoid bumpy
        if (m_data.size() < m_prefer / 2) { this->m_cond->notify_all(); }
#ifdef DEBUG_PRINT_FUNCTION_CALL
        qDebug() << m_name.c_str() << "Pop" << m_data.size();
#endif
        return *m_open;
    }


};

template class TwinsBlockQueue<AVFrame *>;

#endif //PONYPLAYER_TWINS_QUEUE_H
