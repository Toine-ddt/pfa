import QtQuick 2.0

Rectangle {
    id: zone
    x: 50
    y: 50
    width: 480
    height: 320
    color: "black"

    Rectangle {
        id: cursor
        width: 5
        height: 5
        color: "white"
        radius: cursor.width/2
        MouseArea {
            anchors.fill: parent
            width: cursor.width * 2
            height: cursor.height*2
            drag.target: parent;
            drag.minimumX: -cursor.x
            drag.maximumX: zone.width - vertical.width
            drag.minimumY: -cursor.y
            drag.maximumY: zone.height - horizontal.height
        }
        Rectangle {
            id: vertical
            y: -cursor.y
            width: cursor.width
            height: zone.height
            color: "white"
        }
        Rectangle {
            id: horizontal
            x: -cursor.x
            width: zone.width
            height: cursor.height
            color: "white"
        }
    }
}
