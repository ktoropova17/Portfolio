import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("StackView_test")

    property int defMargin: 10

    StackView {
        id: stack_view
        anchors.fill: parent
        initialItem: page1
    }

    My_Page {
        id: page1
        backgroundColor: "red"
        buttonText1: "To_Green"
        buttonText2: "To_Yellow"
        onButton1Clicked: {
            stack_view.push(page2)
        }
        onButton2Clicked: {
            stack_view.push(page3)
        }

    }

    My_Page {
        id: page2
        visible: false
        backgroundColor: "green"
        buttonText1: "To_Red"
        buttonText2: "To_Yellow"
        onButton1Clicked: {
            stack_view.pop(page1)
        }
        onButton2Clicked: {
            stack_view.push(page3)
        }
        onBackButtonClicked: {
            stack_view.pop()
        }
    }

    My_Page {
        id: page3
        visible: false
        backgroundColor: "yellow"
        buttonText1: "To_Green"
        buttonText2: "To_Red"
        onButton1Clicked: {
            stack_view.push(page2)
        }
        onButton2Clicked: {
            stack_view.pop(page1)
        }

        onBackButtonClicked: {
            stack_view.pop()
        }
    }
}
