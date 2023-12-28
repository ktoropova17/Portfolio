import QtQuick 2.15

Rectangle {
    id: compRect
    property alias compColor: compRect.color
    property alias compText: compText.text
    property alias compBorderColor: compRect.border.color

    width: parent.width
    height: parent.height / 10
    border.color: "#C0C0C0"
    color: "#D3D3D3"

    Text {
        id: compText
        text: "Content"
        font.pointSize: 12
        font.weight: Font.Bold
        anchors.centerIn: parent
    }
}
