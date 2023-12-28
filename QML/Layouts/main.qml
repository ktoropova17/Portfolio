import QtQuick

Window {
    width: 480
    height: 640
    visible: true
    color: "#F0F0F0"

    Item {
        anchors.fill: parent

        MyRect {
            id: headerRect
            anchors.top: parent.top
            compText: "Header"
        }

        MyRect {
            id: contentRect
            width: parent.width * 0.95
            height: parent.height * 0.75
            border.color: "black"
            anchors.centerIn: parent
            compColor: "#F0F0F0"
            compText: "Content"
        }

        Item {
            width: parent.width
            height: parent.height / 10
            anchors.bottom: parent.bottom

            MyRect {
                id: rect1
                height: parent.height
                width: (parent.width - 10) / 3
                compText: "1"
            }

            MyRect {
                id: rect2
                height: parent.height
                width: (parent.width - 10) / 3
                anchors.left: rect1.right
                anchors.leftMargin: 5
                compText: "2"
            }

            MyRect {
                height: parent.height
                width: (parent.width - 10) / 3
                anchors.left: rect2.right
                anchors.right: parent.right
                anchors.leftMargin: 5
                compText: "3"
            }
        }
    }
}
