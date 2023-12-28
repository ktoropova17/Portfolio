import QtQuick

Rectangle {
    id: compRect
    property alias compColor: compRect.color
    property alias compText: compText.text
    property alias compBorderColor: compRect.border.color
    property alias compWidth: compRect.width
    property alias compHeight: compRect.height

    width: parent.width
    height: parent.height / 10
    color: "#D3D3D3"
    border.color: "#C0C0C0"

    Text {
        id: compText
        text: "Content"
        font.pointSize: 12
        font.weight: Font.Bold
        anchors.centerIn: parent
    }
}
