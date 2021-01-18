#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    QPushButton *getB();
private slots:
  void handleButton();
  void Play();
private:
  QPushButton *m_button;
  QPushButton *m_Play;
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
