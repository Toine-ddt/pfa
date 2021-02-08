import QtQuick 2.15
import QtQuick.Controls 2.15



Rectangle {
    property string _positionPointName: "PositionPointName"
    id: positionButton
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
