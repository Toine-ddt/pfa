import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"

    OssiaSlider {
        x: 10; y: 100
    }
    OssiaSlider {
        x: 10; y: 150
        controlName: "toto"
    }
    OssiaTimeline {
        x: 10; y: 400
        totalTime: 100000
    }
    MyButton2 {}
}
