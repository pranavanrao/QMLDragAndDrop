import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property string thekey: "Special Key Here"
    property color bgOn: "green"
    property color bgOff: "red"
    property color ballOn: "yellow"
    property color ballOff: "orange"
    property color borderColor: "black"

    DropArea {
        id: dropZone
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 300
        Drag.keys: [root.thekey]

        onDropped: {
            console.log("Dropped!!!")
            bg.color = bgOn
        }

        Rectangle {
            id: bg
            anchors.fill: parent
            color: bgOff
            border.color: root.borderColor
            border.width: 5
        }
    }

    Rectangle {
        id: ball
        width: 100
        height: 100
        radius: width
        x: 25
        y: (parent.height/2) - (height/2)
        color: ballOff
        border.color: borderColor
        border.width: 5

        Drag.active: dragArea.drag.active
        Drag.keys: [root.thekey]

        Text {
            id: title
            anchors.centerIn: parent
            text: Math.round(parent.x) + " x " + Math.round(parent.y)
        }

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent

            onPressed: {parent.color = ballOn; bg.color = bgOff}
            onReleased: {parent.color = ballOff; parent.Drag.drop()}
        }
    }
}
