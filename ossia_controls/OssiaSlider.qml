import QtQuick 2.0

import QtQuick.Controls 2.15

Item {
    Slider {
        id: control
        value: 0.5
        handle: Rectangle{} // No handle

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: control.availableWidth
            height: implicitHeight *4
            radius: 0
            color: "#808080"

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: '#f6a019'
                radius: 0
            }
        }

    }
}
