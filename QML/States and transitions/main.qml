import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

Window {
    width: 480
    height: 640
    visible: true

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Rect {
            id: header
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            compColor: "PaleVioletRed"
            compText: "Header"

            Text {
                id: back
                text: "Back"
                font.pixelSize: 30
                font.bold: true
                opacity:0;
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rowBtns.state = ""
                    }
                }
            }
        }

        Rect {
            id: body
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.9
            Layout.preferredHeight: parent.height
            anchors.centerIn: parent
            compColor: "white"
            compText: "Some content"
        }

        RowLayout {
            id: rowBtns
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            spacing: 5

            states: [
                State {
                    name: "start"
                    PropertyChanges {target: body; compText: "Some content"}
                    PropertyChanges { target: btn1; color: "Pink"; opacity: 1 }
                    PropertyChanges { target: btn2; color: "LightPink"; opacity: 1 }
                    PropertyChanges { target: btn3; color: "LightPink"; opacity: 1 }
                },
                State {
                    name: "btn1"
                    PropertyChanges { target: header; compText: "Header 1" }
                    PropertyChanges { target: body; compText: "Item 1 content" }
                    PropertyChanges { target: btn1; color: "Pink"; opacity: 1 }
                    PropertyChanges { target: btn2; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: btn3; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: back; opacity: 0 }
                },
                State {
                    name: "btn2"
                    PropertyChanges { target: header; compText: "Header 2" }
                    PropertyChanges { target: body; compText: "Item 2 content" }
                    PropertyChanges { target: btn1; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: btn2; color: "Pink"; opacity: 1 }
                    PropertyChanges { target: btn3; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: back; opacity: 1}
                },
                State {
                    name: "btn3"
                    PropertyChanges { target: header; compText: "Header 3" }
                    PropertyChanges { target: body; compText: "Item 3 content" }
                    PropertyChanges { target: btn1; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: btn2; color: "LightPink"; opacity: 0.5 }
                    PropertyChanges { target: btn3; color: "Pink"; opacity: 1 }
                    PropertyChanges { target: back; opacity: 1}
                }]
            state: "start"
            transitions: [
                Transition {
                    from: "start"
                    to: "btn1"
                    PropertyAnimation {
                        target: btn2
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn3
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn1"
                    to: "btn2"
                    PropertyAnimation {
                        target: btn1
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn3
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn2"
                    to: "btn3"
                    PropertyAnimation {
                        target: btn1
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn2
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn3"
                    to: "start"
                    PropertyAnimation {
                        target: btn1
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn2
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn3
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn3"
                    to: "btn2"
                    PropertyAnimation {
                        target: btn2
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn1
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn2"
                    to: "btn1"
                    PropertyAnimation {
                        target: btn3
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn1
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "btn3"
                    to: "btn1"
                    PropertyAnimation {
                        target: btn3
                        property: "opacity"
                        duration: 500
                    }
                    PropertyAnimation {
                        target: btn2
                        property: "opacity"
                        duration: 500
                    }
                }
            ]

            Rect {
                id: btn1
                opacity: 0.8
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "1"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rowBtns.state !== "btn1")
                            rowBtns.state = "btn1";
                        else
                            rowBtns.state = "";
                    }
                }
            }

            Rect {
                id: btn2
                opacity: 0.8
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "2"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rowBtns.state !== "btn2")
                            rowBtns.state = "btn2";
                        else
                            rowBtns.state = "";
                    }
                }
            }

            Rect {
                id: btn3
                opacity: 0.8
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "3"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (rowBtns.state !== "btn3")
                            rowBtns.state = "btn3";
                        else
                            rowBtns.state = "";
                    }
                }
            }
        }
    }
}
