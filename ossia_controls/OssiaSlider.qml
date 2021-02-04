import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    property string controlName: "ControlName"
    Slider {
        id: control
        value: 0.5

        Text {
            y: control.y - 20
            text: controlName
            color: "#a7dd0d"
        }
        Text {
            y: control.y - 20
            text: control.value.toFixed(3)
            color: "#ffedb6"
            font.bold: true
            width: control.width
            horizontalAlignment: Text.AlignHCenter
        }



        handle: Rectangle {} // No handle

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 500
            implicitHeight: 5
            width: control.availableWidth
            height: implicitHeight * 4
            color: "#363636"
            radius: 2

            Rectangle {
                x: y
                y: (parent.height - height) / 2
                width: control.visualPosition * parent.width - y
                height: parent.height - 4
                color: '#e0b01e'
            }
        }
    }
}
