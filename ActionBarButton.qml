import QtQuick 2.4

Item {
    id: root

    property ActionBar actionBar: window.scene.actionBar
    property string icon: ""
    property Item button
    property bool enabled: true

    signal clicked();

    Component {
        id: buttonComponent

        Item {
            height: actionBar.height
            width: root.enabled ? height : 0

            Image {
                anchors.fill: parent
                anchors.margins: 14*dp
                source: icon
                mipmap: true
            }

            Rectangle {
                anchors.fill: parent
                color: "white"
                opacity: 0.2
                visible: mouseArea.containsPress
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: root.clicked()
            }
        }
    }

    Component.onCompleted: {
        button = buttonComponent.createObject(actionBar.buttonRow);
    }

    Component.onDestruction: {
        button.destroy();
    }
}
