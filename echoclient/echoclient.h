#ifndef ECHOCLIENT_H
#define ECHOCLIENT_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>
#include <QPushButton>
#include "mainwindow.h"
#include "ui_mainwindow.h"
class EchoClient : public QObject
{
public:
    MainWindow *f;
    Q_OBJECT
public:
    explicit EchoClient(const QUrl &url, MainWindow *f,bool debug = false ,QObject *parent = nullptr);
    void sendPLayPause();
Q_SIGNALS:
    void closed();
private Q_SLOTS:
    void onConnected();
    void onTextMessageReceived(QString message);

private:
    QWebSocket m_webSocket;
    QUrl m_url;
    bool m_debug;
};

#endif // ECHOCLIENT_H
