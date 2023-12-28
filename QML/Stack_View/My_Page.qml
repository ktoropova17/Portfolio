import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Page {
    id: root
    property alias backgroundColor: back_fon.color
    property alias buttonText1: buttonText1.text
    property alias buttonText2: buttonText2.text

    signal button1Clicked()
    signal button2Clicked()
    signal backButtonClicked()

    Rectangle {
        id: back_fon
        anchors.fill: parent
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 250

        Button {
            id: buttonText1
            onClicked: button1Clicked()
        }

        Button {
            id: buttonText2
            onClicked: button2Clicked()
        }
    }

    Button {
        id: back_button
        visible: stack_view.currentItem != page1
        text: "Back"
        onClicked: {
            backButtonClicked()
            back_button.visible = true
        }
    }
}
