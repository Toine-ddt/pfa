#include <QtCore/QCoreApplication>
#include <QtCore/QCommandLineParser>
#include <QtCore/QCommandLineOption>
#include "echoclient.h"
#include <iostream>
#include <mainwindow.h>
#include <QApplication>
#include <QPushButton>
#include <stdlib.h>
#include<unistd.h>
void walo(MainWindow *f){
    QPushButton("My Walo button",f );
}
void walo(MainWindow  *f);
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QWidget fenetre;
    //QCoreApplication a(argc, argv);
    printf("Zboubix je suis aus main \n");
    QCommandLineParser parser;
    parser.setApplicationDescription("QtWebSockets example: echoclient");
    parser.addHelpOption();
    fenetre.setFixedSize(300, 150);
    QCommandLineOption dbgOption(QStringList() << "d" << "debug",
            QCoreApplication::translate("main", "Debug output [default: off]."));
    parser.addOption(dbgOption);
    parser.process(a);
    bool debug = parser.isSet(dbgOption);
    QPushButton bouton("Salut les Zéros, la forme ?",&fenetre);
    QPushButton bouton3("Salut les sfantoufix ",&fenetre);
    //walo(fenetre);

    MainWindow w(&fenetre);//on peut ajouter l initilialisation de echoClient
    QPushButton("My Walo button Zboubix ",&fenetre );
    w.show();
    unsigned int microsecond = 1000000;
    usleep(microsecond);

    walo(&w);
    //fenetre.show();
    //w.show();
    EchoClient client(QUrl(QStringLiteral("ws://localhost:10212")), &w, debug);
    QObject::connect(&client, &EchoClient::closed, &a, &QCoreApplication::quit);

    return a.exec();
}
