import QtQuick 2.15

Item {
    property string _positionPointName: "PositionName"
    Rectangle {
        id: background
        width: 450
        height: 320
        color: "#363636"
        Rectangle {
            id: zone
            x: background.width/100
            y: background.height/100
            width: 70*background.width/100
            height: 98*background.height/100
            color: "black"


            Rectangle {
                id: positionButton
                anchors.left: zone.right
                anchors.leftMargin: 5
                anchors.top: zone.top
                width: background.width/40
                height: positionButton.width
                radius: positionButton.width/2
                color: "#a7dd0d"
                border.width: 2
                border.color: "#a7dd0d"

                Text {
                     id: positionName
                     anchors.left: positionButton.right
                     anchors.leftMargin: 5
                     anchors.top: positionButton.top
                     text: _positionPointName
                     color: "#a7dd0d"
                 }
                 Text {
                     id: positionValue
                     anchors.top: positionName.bottom
                     anchors.left: positionName.left
                     text: "x,y:"+cursor.x.toFixed(0)+","+cursor.y.toFixed(0)
                     color: "#a7dd0d"
                 }

                MouseArea{
                    id: positionMouseAreaButton
                    anchors.fill: parent
                    onClicked:  positionButton.state = 'off'
                }

                states: [
                    State {
                        name: "off"
                        PropertyChanges {
                            target: positionValue;
                            text: positionValue.text
                        }
                        PropertyChanges {
                            target: positionButton;
                            color: "#363636"
                        }
                        PropertyChanges{
                            target: positionMouseAreaButton;
                            onClicked: positionButton.state = 'on'
                        }
                    },
                    State {
                        name: "on"
                        PropertyChanges {
                            target: positionValue;
                            text: "x,y:"+cursor.x.toFixed(0)+","+cursor.y.toFixed(0)}
                    }
                ]
            }
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
    }
}
