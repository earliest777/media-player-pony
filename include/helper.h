//
// Created by ColorsWind on 2022/4/16.
//
#pragma once

#if defined(WIN32) || defined(linux)
#define INCLUDE_FFMPEG_BEGIN \
extern "C" {       \
_Pragma("GCC diagnostic push") \
_Pragma("GCC diagnostic ignored \"-Wold-style-cast\"") \
_Pragma("GCC diagnostic ignored \"-Wsign-conversion\"") \
_Pragma("GCC diagnostic ignored \"-Wconversion\"")
#elif defined(__APPLE__)
#define INCLUDE_FFMPEG_BEGIN \
extern "C" {       \
_Pragma("GCC diagnostic push") \
_Pragma("GCC diagnostic ignored \"-Wold-style-cast\"") \
_Pragma("GCC diagnostic ignored \"-Wsign-conversion\"") \
_Pragma("GCC diagnostic ignored \"-Wimplicit-int-conversion\"")
#endif

#define INCLUDE_FFMPEG_END \
_Pragma("GCC diagnostic pop") \
}


#pragma GCC diagnostic push
extern "C" {
#include <libavutil/error.h>
}
#pragma GCC diagnostic ignored "-Wold-style-cast"
const int ERROR_EOF = AVERROR_EOF;
const int MAX_AUDIO_FRAME_SIZE = 192000;
const int AUDIO_DATA_INFO_QUEUE_INITIAL = 100;
#pragma GCC diagnostic pop

unsigned nextPowerOf2(unsigned val);