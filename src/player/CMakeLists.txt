project(player)


qt_add_qml_module(${PROJECT_NAME}
        URI player
        VERSION 1.0
        STATIC
        PLUGIN_TARGET player
        SOURCES
            fireworks.hpp
            playback.hpp
            framecontroller.hpp
            hurricane.hpp
            players.cpp
            renderer.hpp
            preview.hpp
            thumbnail.hpp
            updatevalue.hpp
        RESOURCES
            shader/vertex.vsh
            shader/fragment.fsh
        )

include_directories(include)
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR})


target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt::Core
        Qt::Gui
        Qt::Qml
        Qt::Widgets
        Qt::Quick
        decoder
        audiosink
        )