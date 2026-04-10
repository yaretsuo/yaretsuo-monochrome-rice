import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: container
    width: screen.width
    height: screen.height
    color: "#000000"

    property int sessionIndex: sddm.lastSessionIndex >= 0 ? sddm.lastSessionIndex : 0

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: timeText.text = Qt.formatDateTime(new Date(), "h:mm AP")
    }

    Component.onCompleted: {
        if (name.text.length > 0) password.forceActiveFocus();
        else name.forceActiveFocus();
    }

    Item {
        id: centerAnchor
        anchors.centerIn: parent
        width: 400
        height: parent.height * 0.5

        Text {
            id: timeText
            text: Qt.formatDateTime(new Date(), "h:mm AP")
            color: "#FFFFFF"
            font.pointSize: Math.max(container.width / 40, 36)
            font.weight: Font.ExtraLight
            font.letterSpacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        Column {
            id: loginColumn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: timeText.bottom
            anchors.topMargin: container.height * 0.05
            spacing: 15

            Rectangle {
                width: 320; height: 45
                color: "#000000"
                border.color: "#1a1a1a"
                border.width: 1
                
                TextInput {
                    id: name
                    anchors.fill: parent
                    anchors.margins: 10
                    color: "#ffffff" 
                    text: userModel.lastUser
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignHCenter
                    font.pointSize: 10
                    selectByMouse: true
                }
            }

            Rectangle {
                width: 320; height: 45
                color: "#000000"
                border.color: password.activeFocus ? "#FFFFFF" : "#1a1a1a"
                border.width: 1

                TextInput {
                    id: password
                    anchors.fill: parent
                    anchors.margins: 10
                    color: "white"
                    echoMode: TextInput.Password 
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignHCenter
                    font.pointSize: 10
                    selectByMouse: true
                    onAccepted: sddm.login(name.text, password.text, sessionIndex)
                }
            }

            Rectangle {
                id: loginButton
                width: 320; height: 50
                color: "#000000"
                border.color: "#FFFFFF"
                border.width: 1
                
                Text {
                    anchors.centerIn: parent
                    text: "S I G N  I N"
                    color: "#FFFFFF"
                    font.pointSize: 9
                    font.letterSpacing: 4
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if (name.text != "" && password.text != "") {
                            sddm.login(name.text, password.text, sessionIndex)
                        }
                    }
                }
            }
        }
    }
}
