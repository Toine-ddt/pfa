import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQml 2.15

Item {
    property int totalTime: 100 //in miliseconds
    Slider {
        id: progress
        value: 0.1
        Text {
            text: totalTime * progress.value.toFixed(3)
            color: "#f0f0f0"
            font.bold: true
            width: progress.width
            horizontalAlignment: Text.AlignHCenter
        }
        handle: Rectangle {} // No handle

        background: Rectangle {
            x: progress.leftPadding
            y: progress.topPadding + progress.availableHeight / 2 - height / 2
            implicitWidth: 500
            implicitHeight: 5
            width: progress.availableWidth
            height: implicitHeight * 4
            color: "#161514"
            border.width: 1
            border.color: "#62400a"

            Rectangle {
                x: y
                y: (parent.height - height) / 2
                width: progress.visualPosition * parent.width - y
                height: parent.height - 4
                color: '#62400a'
            }
        }
    }
}
