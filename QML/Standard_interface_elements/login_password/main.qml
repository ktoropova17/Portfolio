import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        width: parent.width
        height: parent.height
        color : "#F5F5F5"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            TextField {
                id: usernameField
                placeholderText: "Username"
                implicitWidth: 200
                width: 200
                implicitHeight: 37
                height: 40
                font.pixelSize: 16
                leftPadding: 10
                topPadding: 5
            }

            TextField {
                id: passwordTextField
                placeholderText: "Password"
                implicitWidth: 200
                width: 200
                implicitHeight: 37
                height: 40
                font.pixelSize: 16
                echoMode: TextInput.Password
                leftPadding: 10
                topPadding: 5
            }

            Row {
                Button {
                    text: "Log In"
                    width: 100
                    height: 40
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "#DCDCDC"
                    }
                }

                Button {
                    text: "Clear"
                    width: 100
                    height: 40
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "#F5F5F5"
                    }
                    onClicked: {
                        usernameField.text = ""
                        passwordTextField.text = ""
                    }
                }
            }

        }
    }
}
