#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtCore/QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // Create the button, make "this" the parent
    m_button = new QPushButton("My Button", this);
    m_Play = new QPushButton("Play yyy", this);
    m_Play->setText("Play");
    // set size and location of the button
    m_button->setGeometry(QRect(QPoint(100, 100), QSize(200, 50)));
    m_Play->setGeometry(QRect(QPoint(200, 200), QSize(200, 50)));
    // Connect button signal to appropriate slot
    connect(m_button, &QPushButton::released, this, &MainWindow::handleButton);
    connect(m_Play, &QPushButton::released, this, &MainWindow::Play);
}

void MainWindow::handleButton()
{
  // change the text
  m_button->setText("Example");
  // resize button
  m_button->resize(100,100);
}
void MainWindow::Play()
{
  // change the text
    qDebug() << m_Play->text();
    QString s = m_Play->text();
    if(QString::compare(m_Play->text() ,"Pause") == 0){
        m_Play->setText("Play");
        qDebug() << m_Play->text() << "  pause/";
    }
    else if(QString::compare(m_Play->text(), "Play")==0){
        m_Play->setText("Pause");
        qDebug() << m_Play->text() << "  play/";
    }
  // resize button
  //m_button->resize(100,100);
}
MainWindow::~MainWindow()
{
    delete ui;
}

QPushButton *MainWindow::getB(){
    return m_button;
}
