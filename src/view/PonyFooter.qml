import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import "interfacefunctions.js" as IF
import HurricanePlayer
import Thumbnail
Rectangle {
    id:footer
    height: mainWindow.isFooterVisable?80:0
    visible: mainWindow.isFooterVisable
    color: "#666666"
    Timer{
        id:timerForThumbnail
        interval:500
        repeat:false
        onTriggered:{
            if(Math.abs(previewDetector.mouseX-mainWindow.lastStep)>10){
                mainWindow.lastStep=previewDetector.mouseX
                preview.previewRequest((previewDetector.mouseX*mainWindow.endTime)/videoSlide.width)
            }
        }
    }
    Label{
        id:distanceStart
        anchors.left:parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5
        text:IF.videoSlideDistance(true)
        color: "white"
        font.bold: true
        lineHeight: 20
    }

    Connections{
        target:mainWindow
        onWakeSlide:videoSlide.value=0.0
    }
    Slider{
        id:videoSlide
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: distanceStart.right
        anchors.leftMargin: 10
        anchors.right: distanceEnd.left
        anchors.rightMargin: 10
        from: 0
        to: mainWindow.endTime
        value: mainWindow.currentTime
        hoverEnabled:true
        MouseArea{
            id:previewDetector
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
            onEntered: timerForThumbnail.start()
            onExited: timerForThumbnail.stop()
            onPositionChanged:{
                previewRect.visible=false
                timerForThumbnail.restart()
            }
        }
        onValueChanged: {
            mainWindow.currentTime=videoSlide.value
        }
        onPressedChanged: {
            console.log("lei fu kai use seek"+videoSlide.value)
            if(!videoSlide.pressed){
                videoArea.seek(mainWindow.currentTime)
//                preview.previewRequest(mainWindow.currentTime)
            }
        }
        Shortcut{
            sequence: "Up"
            onActivated: IF.forwardOneSecond()
        }
        Shortcut{
            sequence: "Down"
            onActivated: IF.backOneSecond()
        }
        Shortcut{
            sequence: "Left"
            onActivated: IF.backFiveSeconds()
        }
        Shortcut{
            sequence: "Right"
            onActivated: IF.forwardFiveSeconds()
        }
    }
    Rectangle {
        id: previewRect
        visible: false
        x:(videoSlide.x+previewDetector.mouseX-60)
        width:120
        height:80
        anchors.bottom: videoSlide.top
        anchors.bottomMargin: 5
        clip: true
        Thumbnail {
            id: preview
            player: "videoArea"
            onPreviewResponse: {
                previewRect.visible=true
            }
        }

    }





    Label{
        id:distanceEnd
        anchors.right:parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5
        text:IF.videoSlideDistance(false)
        color: "white"
        font.bold: true
        lineHeight: 20
    }





    Timer {
        id:timer
        interval: 1000/mainWindow.speed
        repeat: true
        running: mainWindow.isPlay
        onTriggered:IF.timerOnTriggered()
    }





    //打开文件列表
    AnimatedButton {
        id: fileList
        visible: screenSize.state==="normalScreen"
        width: 20
        height: 20
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        image_width: 20
        image_height: 20
        imageSource: "interfacepics/FileList"
        mouseArea.onClicked: IF.fileListOnClicked()
    }

    //倒放
    AnimatedButton {
        id: inverted
        width: 30
        height: 30
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.verticalCenter: playOrPause.verticalCenter
        anchors.right: last.left
        anchors.rightMargin: 5
        image_width: 30
        image_height: 30
        imageSource: "interfacepics/Inverted"
        mouseArea.onClicked: IF.invertedOnClicked()
    }



    //上一个视频
    AnimatedButton {
        id: last
        width: 30
        height: 30
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
       anchors.verticalCenter: playOrPause.verticalCenter
        anchors.right: playOrPause.left
        anchors.rightMargin: 5
        image_width: 30
        image_height: 30
        imageSource: "interfacepics/Next"
        mouseArea.onClicked: {
                if(mainWindow.playState === "ordered")
                    listview.currentIndex = (listview.currentIndex - 1 + listview.count)%listview.count

                else if(mainWindow.playState === "random")
                    listview.currentIndex = (listview.currentIndex - Math.floor(Math.random()*listview.count) + listview.count)%listview.count
                else;
                console.log("index:",listview.currentIndex)
                mainWindow.openFile(listModel.get(listview.currentIndex).filePath);
        }
    }


    //播放或是暂停
    AnimatedButton {
        id:playOrPause
        width: 40
        height: 40
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        image_width: 40
        image_height: 40
        state:  mainWindow.isPlay?"play":"pause"
        states: [
            State {
                name: "pause"
                PropertyChanges {
                    target: playOrPause
                    imageSource: "interfacepics/Play"
                }
            },
            State {
                name: "play"
                PropertyChanges {
                    target: playOrPause
                    imageSource: "interfacepics/Pause"
                }
            }
        ]
        mouseArea.onClicked: IF.playOrPauseFunction()
        Shortcut{
            sequence: "Space"
            onActivated: IF.playOrPauseFunction()
        }
    }

    //下一个视频
    AnimatedButton {
        id: next
        width: 30
        height: 30
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.verticalCenter: playOrPause.verticalCenter
        anchors.left: playOrPause.right
        anchors.leftMargin: 5
        image_width: 30
        image_height: 30
        imageSource: "interfacepics/Next"
        mouseArea.onClicked: IF.nextOnClicked()
    }

    //停止
    AnimatedButton {
        id: cease
        width: 30
        height: 30
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.verticalCenter: playOrPause.verticalCenter
        anchors.left: next.right
        anchors.leftMargin: 5
        image_width: 30
        image_height: 30
        imageSource: "interfacepics/cease"
        mouseArea.onClicked: IF.toPause()
    }
    //播放速度调整
    AnimatedButton {
        id: videoSpeed
        width: 30
        height: 12
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.right: playMode.left
        anchors.rightMargin: 10
        anchors.verticalCenter: playOrPause.verticalCenter
        image_width: 30
        image_height: 12
        state:  "speed1"
        states: [
            State {
                name: "speed1"
                PropertyChanges {
                    target: videoSpeed
                    imageSource: "interfacepics/Speed1"
                }
            },
            State {
                name: "speed2"
                PropertyChanges {
                    target: videoSpeed
                    imageSource: "interfacepics/Speed2"
                }
            },
            State {
                name: "speed4"
                PropertyChanges {
                    target: videoSpeed
                    imageSource: "interfacepics/Speed4"
                }
            },
            State {
                name: "speed8"
                PropertyChanges {
                    target: videoSpeed
                    imageSource: "interfacepics/Speed8"
                }
            }
        ]
        mouseArea.onClicked: IF.videoSpeedOnClicked()
    }
    
    //播放模式(顺序, 单曲循环, 随机)
    AnimatedButton {
        id: playMode
        width: 20
        height: 20
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.right: videoVolumn.left
        anchors.rightMargin: 10
        anchors.verticalCenter: playOrPause.verticalCenter
        image_width: 20
        image_height: 20
        state:  mainWindow.playState
        states: [
            State {
                name: "ordered"
                PropertyChanges {
                    target: playMode
                    imageSource: "interfacepics/Ordered"
                }
            },
            State {
                name: "single"
                PropertyChanges {
                    target: playMode
                    imageSource: "interfacepics/Single"
                }
            },
            State {
                name: "random"
                PropertyChanges {
                    target: playMode
                    imageSource: "interfacepics/Random"
                }
            }
        ]
        mouseArea.onClicked: IF.playModeOnClicked()
    }


    //播放音量调节
    Item{
        id:videoVolumn
        height: 20
        width: 170
        anchors.verticalCenter: playOrPause.verticalCenter
        anchors.right: screenSize.right
        anchors.rightMargin: 10
        //喇叭图标, 单击可静音
        AnimatedButton {
            id: speaker
            width: 20
            height: 20
            color: "transparent"
            normalColor: "transparent"
            hoverColor: "#10FFFFFF"
            anchors.left: parent.left
            anchors.top: parent.top
            image_width: 20
            image_height: 20
            states: [
                State {
                    name: "volumn0"
                    when: mainWindow.volumn<=0
                    PropertyChanges {
                        target: speaker
                        imageSource:"interfacepics/Volumn0"
                    }
                },
                State {
                    name: "volumn1"
                    when: mainWindow.volumn>0&&mainWindow.volumn<=0.33
                    PropertyChanges {
                        target: speaker
                        imageSource:"interfacepics/Volumn1"
                    }
                },
                State {
                    name: "volumn2"
                    when: mainWindow.volumn>0.33&&mainWindow.volumn<=0.66
                    PropertyChanges {
                        target: speaker
                        imageSource:"interfacepics/Volumn2"
                    }
                },
                State {
                    name: "volumn3"
                    when: mainWindow.volumn>0.66
                    PropertyChanges {
                        target: speaker
                        imageSource:"interfacepics/Volumn3"
                    }
                }
            ]
            mouseArea.onClicked: IF.speakerOnClicked()
        }
        //音量滑条, 可以调整音量
        Slider{
            id: volumnSlider
            height: 20
            width: 100
            anchors.left: speaker.right
            anchors.leftMargin: 5
            anchors.top: parent.top
            from: 0
            to: 100
            value: mainWindow.volumn*100
            onMoved: IF.volumeSliderOnMoved()
            Shortcut{
                sequence: "Ctrl+Down"
                onActivated: IF.volumnDown()
            }
            Shortcut{
                sequence: "Ctrl+Up"
                onActivated: IF.volumnUp()
            }
        }
    }
    //屏幕大小, 可调全屏或是退出全屏
    AnimatedButton {
        id: screenSize
        width: 30
        height: 20
        color: "transparent"
        normalColor: "transparent"
        hoverColor: "#10FFFFFF"
        anchors.verticalCenter: playOrPause.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        image_width: 30
        image_height: 20
        state:  mainWindow.isFullScreen?"fullScreen":"normalScreen"
        states: [
            State {
                name: "fullScreen"
                PropertyChanges {
                    target: screenSize
                    imageSource: "interfacepics/NormalScreen"
                }
            },
            State {
                name: "normalScreen"
                PropertyChanges {
                    target: screenSize
                    imageSource: "interfacepics/FullScreen"
                }
            }
        ]
        Shortcut{
            sequence: "Ctrl+F"
            onActivated: IF.screenSizeFunction()
        }
        mouseArea.onClicked: IF.screenSizeFunction()
    }

}
