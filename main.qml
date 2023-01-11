import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    width: 512
    minimumWidth: 512
    maximumWidth: 512
    height: 240
    minimumHeight: 240
    maximumHeight: 240
    visible: true
    title: qsTr("Colorato")

    color: Qt.rgba( redSlider.value/255.0,
                    greenSlider.value/255.0,
                    blueSlider.value/255.0 )


    Item {
        id: slidersBox
        width: parent.width
        height: 200

        function setHex() {
            try {
                var r = redSlider.value.toString(16)
                if (r == "0") r = "00"
                var g = greenSlider.value.toString(16)
                if (g == "0") g = "00"
                var b = blueSlider.value.toString(16)
                if (b == "0") b = "00"
                hexText.text = r+g+b
            } catch (e) {
                ;
            }
        }

        Item {
            id: redBox
            width: parent.width
            height: redSlider.height
            anchors.top: parent.top
            anchors.topMargin: 16

            Slider {
                id: redSlider
                width: 392
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 32
                from: 0
                to: 255
                stepSize: 1
                background:
                    Rectangle {
                         x: redSlider.leftPadding
                         y: redSlider.topPadding + redSlider.availableHeight/2 - height/2
                         width: redSlider.availableWidth
                         height: 2
                         radius: 4
                         color: "gray"
                         border.color: "darkgray"

                         Rectangle {
                             width: redSlider.visualPosition * parent.width
                             height: parent.height + 4
                             anchors.verticalCenter: parent.verticalCenter
                             color: "red"
                             border.color: "black"
                             radius: 4
                         }
                     }
                handle:
                    Rectangle {
                         x: redSlider.leftPadding + redSlider.visualPosition * (redSlider.availableWidth - width)
                         y: redSlider.topPadding + redSlider.availableHeight / 2 - height / 2
                         implicitWidth: 26
                         implicitHeight: 26
                         radius: 13
                         color: redSlider.pressed ? "white" : "pink"
                         border.color: redSlider.pressed ? "darkgray" : "black"
                     }
                onMoved: {
                    redText.text = redSlider.value
                    slidersBox.setHex()
                }
            }

            Rectangle {
                id: redRect
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                color: "pink"
                border {
                    width: 1
                    color: "red"
                }
                radius: 8
            }

            TextInput {
                id: redText
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLength: 3
                text: "0"
                onEditingFinished: {
                    try {
                        var r = parseInt( redText.text )
                        if (r > 255) {
                            r = 255
                        } else if (r < 0) {
                            r = 0
                        }
                        redText.text = r
                        redSlider.value = r
                        slidersBox.setHex()
                    } catch (e) {
                        ;
                    }
                }
            }
        }

        Item {
            id: greenBox
            width: parent.width
            height: greenSlider.height
            anchors.top: redBox.bottom
            anchors.topMargin: 8

            Slider {
                id: greenSlider
                width: 392
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 32
                from: 0
                to: 255
                stepSize: 1
                background:
                    Rectangle {
                         x: greenSlider.leftPadding
                         y: greenSlider.topPadding + greenSlider.availableHeight/2 - height/2
                         width: greenSlider.availableWidth
                         height: 2
                         radius: 4
                         color: "gray"
                         border.color: "darkgray"

                         Rectangle {
                             width: greenSlider.visualPosition * parent.width
                             height: parent.height + 4
                             anchors.verticalCenter: parent.verticalCenter
                             color: "green"
                             border.color: "black"
                             radius: 4
                         }
                     }
                handle:
                    Rectangle {
                         x: greenSlider.leftPadding + greenSlider.visualPosition * (greenSlider.availableWidth - width)
                         y: greenSlider.topPadding + greenSlider.availableHeight / 2 - height / 2
                         implicitWidth: 26
                         implicitHeight: 26
                         radius: 13
                         color: greenSlider.pressed ? "white" : "lightgreen"
                         border.color: greenSlider.pressed ? "darkgray" : "black"
                     }
                onMoved: {
                    greenText.text = greenSlider.value
                    slidersBox.setHex()
                }
            }

            Rectangle {
                id: greenRect
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                color: "lightgreen"
                border {
                    width: 1
                    color: "green"
                }
                radius: 8
            }

            TextInput {
                id: greenText
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLength: 3
                text: "0"
                onEditingFinished: {
                    try {
                        var g = parseInt( greenText.text )
                        if (g > 255) {
                            g = 255
                        } else if (g < 0) {
                            g = 0
                        }
                        greenText.text = g
                        greenSlider.value = g
                        slidersBox.setHex()
                    } catch (e) {
                        ;
                    }
                }
            }
        }

        Item {
            id: blueBox
            width: parent.width
            height: blueSlider.height
            anchors.top: greenBox.bottom
            anchors.topMargin: 8

            Slider {
                id: blueSlider
                width: 392
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 32
                from: 0
                to: 255
                stepSize: 1
                background:
                    Rectangle {
                         x: blueSlider.leftPadding
                         y: blueSlider.topPadding + blueSlider.availableHeight/2 - height/2
                         width: blueSlider.availableWidth
                         height: 2
                         radius: 4
                         color: "gray"
                         border.color: "darkgray"

                         Rectangle {
                             width: blueSlider.visualPosition * parent.width
                             height: parent.height + 4
                             anchors.verticalCenter: parent.verticalCenter
                             color: "blue"
                             border.color: "black"
                             radius: 4
                         }
                     }
                handle:
                    Rectangle {
                         x: blueSlider.leftPadding + blueSlider.visualPosition * (blueSlider.availableWidth - width)
                         y: blueSlider.topPadding + blueSlider.availableHeight / 2 - height / 2
                         implicitWidth: 26
                         implicitHeight: 26
                         radius: 13
                         color: blueSlider.pressed ? "white" : "lightblue"
                         border.color: blueSlider.pressed ? "darkgray" : "black"
                     }
                onMoved: {
                    blueText.text = blueSlider.value
                    slidersBox.setHex()
                }
            }

            Rectangle {
                id: blueRect
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                color: "lightblue"
                border {
                    width: 1
                    color: "blue"
                }
                radius: 8
            }

            TextInput {
                id: blueText
                width: 48
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLength: 3
                text: "0"
                onEditingFinished: {
                    try {
                        var b = parseInt( blueText.text )
                        if (b > 255) {
                            b = 255
                        } else if (b < 0) {
                            b = 0
                        }
                        blueText.text = b
                        blueSlider.value = b
                        slidersBox.setHex()
                    } catch (e) {
                        ;
                    }
                }
            }
        }

        Item {
            id: hexBox
            width: parent.width
            height: hexText.height
            anchors.top: blueBox.bottom
            anchors.topMargin: 16

            Rectangle {
                id: hexRect
                width: 64
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                color: "white"
                border {
                    width: 1
                    color: "gray"
                }
                radius: 8
            }

            TextInput {
                id: hexText
                width: 64
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLength: 6
                text: "000000"
                onEditingFinished: {
                    try {
                        var r = parseInt( hexText.text.slice(0,2), 16 )
                        var g = parseInt( hexText.text.slice(2,4), 16 )
                        var b = parseInt( hexText.text.slice(4), 16 )
                        if (!r) r = 0
                        redText.text = r
                        redSlider.value = r
                        if (!g) g = 0
                        greenText.text = g
                        greenSlider.value = g
                        if (!b) b = 0
                        blueText.text = b
                        blueSlider.value = b
                    } catch (e) {
                        ;
                    }
                }
            }
        }
    }
}
