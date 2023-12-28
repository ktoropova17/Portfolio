import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    property int defMargin: 10

    SwipeView {
        id: view
        currentIndex: indicator.currentIndex
        anchors.fill: parent
        orientation: Qt.Horizontal

        Comp {
            id: firstPage
            backgroundColor: "red"
            Text {
                id: name
                color: "red"
                anchors.centerIn: parent
                font.pointSize: 20
            }
        }

        Comp {
            id: secondPage
            backgroundColor: "green"
            Text {
                id: name_1
                color: "green"
                anchors.centerIn: parent
                font.pointSize: 20
            }
        }
        Comp {
            id: thirdPage
            backgroundColor: "yellow"
            Text {
                id: name_2
                color: "yellow"
                anchors.centerIn: parent
                font.pointSize: 20
            }
        }
    }
    PageIndicator {
        id: indicator
        interactive: true
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
