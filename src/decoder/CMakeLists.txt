project(decoder)

set(CPP_SOURCES
    private/forward.hpp
    private/backward.hpp
    private/dispatcher.hpp
    private/previewer.hpp
    private/decoders.hpp
    private/virtual.hpp
)

qt_add_library(${PROJECT_NAME} STATIC ${CPP_SOURCES})
target_sources(${PROJECT_NAME} PRIVATE demuxer.hpp frame.hpp helper.hpp)
target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}")
target_link_libraries(${PROJECT_NAME} PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Quick
    utils
    audiosink
    concurrentqueue
    ${FFmpeg}
)

