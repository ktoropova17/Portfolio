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
            Layout.preferredHeight: 50
            Layout.fillWidth: true

            Rect {
                id: btn1
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "1"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        header.compText = "Header 1"
                        body.compText = "Item 1 content"
                        btn1.color = "Pink"
                        btn2.color = "LightPink"
                        btn3.color = "LightPink"
                        btn1.opacity = 1
                        btn2.opacity = 0.5
                        btn3.opacity = 0.5
                    }
                }
            }

            Rect {
                id: btn2
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "2"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        header.compText = "Header 2"
                        body.compText = "Item 2 content"
                        btn1.color = "LightPink"
                        btn2.color = "Pink"
                        btn3.color = "LightPink"
                        btn1.opacity = 0.5
                        btn2.opacity = 1
                        btn3.opacity = 0.5
                    }
                }
            }

            Rect {
                id: btn3
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignBottom
                compColor: "PaleVioletRed"
                compText: "3"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        header.compText = "Header 3"
                        body.compText = "Item 3 content"
                        btn1.color = "LightPink"
                        btn2.color = "LightPink"
                        btn3.color = "Pink"
                        btn1.opacity = 0.5
                        btn2.opacity = 0.5
                        btn3.opacity = 1
                    }
                }
            }
        }
    }
}
