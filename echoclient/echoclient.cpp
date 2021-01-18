#include "echoclient.h"
#include <QtCore/QDebug>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonValue>
#include <QPushButton>
#include <stdlib.h>
#include<unistd.h>
QT_USE_NAMESPACE

//! [constructor]
EchoClient::EchoClient(const QUrl &url,MainWindow * f, bool debug,QObject *parent) :
    QObject(parent),
    m_url(url),
    m_debug(debug)
{
    if (m_debug)
        qDebug() << "WebSocket server:" << url;
    connect(&m_webSocket, &QWebSocket::connected, this, &EchoClient::onConnected);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &EchoClient::closed);
    m_webSocket.open(QUrl(url));
    EchoClient::f = f;
}
//! [constructor]

//! [onConnected]
void EchoClient::onConnected()
{
    if (m_debug)
        qDebug() << "WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived,
            this, &EchoClient::onTextMessageReceived);
    m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}
//! [onConnected]

//! [onTextMessageReceived]
void EchoClient::onTextMessageReceived(QString message)
{
    if (m_debug){
        //qDebug() << "Message received:" << message; // ici j affiche le message recu
        QJsonValue mes(message);

        QByteArray json_bytes = message.toLocal8Bit();
        auto json_doc = QJsonDocument::fromJson(json_bytes);
        QJsonObject sett2 = json_doc.object();
        QString str = sett2.value(QString("Message")).toString() ;
        qDebug() << " _________  \"" << str << "\"";
        if(!str.isEmpty()){
          QPushButton *ff =  f->getB();
           ff->setText(str);
           //bouton.show();
           unsigned int microsecond = 1000000;
           usleep(microsecond);
           qDebug() << "pres ";}
    }
    //m_webSocket.close();    // pour terminer la communication
}
//! [onTextMessageReceived]
//{ "Message": "Play" }
