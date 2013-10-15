#ifndef TST_QTWEBAPPTEST_H
#define TST_QTWEBAPPTEST_H

#include <QString>
#include <QtTest>
#include <QSettings>
#include <QCoreApplication>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <httprequesthandler.h>
#include <httplistener.h>

class MyRequestHandler : public HttpRequestHandler
{
    Q_OBJECT
public:

    MyRequestHandler(QObject *parent = 0);

    void service(HttpRequest &request, HttpResponse &response) {
        Q_UNUSED(request)
        Q_UNUSED(response)
        emit serviceWasHit();
    }

signals:
    void serviceWasHit();
};

class QtWebAppTest : public QObject
{
    Q_OBJECT

    QSettings *mSettings;

    QNetworkAccessManager mQnam;


    QString getBaseUrl() {
        return QString("http://127.0.0.1:").append(QString::number(mSettings->value("port").toInt()));
    }

public:
    QtWebAppTest();

private Q_SLOTS:
    void initTestCase()
    {
        QString configPath = QString(SRCDIR) + "/testConfig.ini";
        mSettings = new QSettings(configPath, QSettings::IniFormat, this);
        mSettings->beginGroup("tst_QtWebAppTest");
    }

    void cleanupTestCase()
    {
        this->deleteLater();
    }

    void sanity()
    {
        MyRequestHandler *handler = new MyRequestHandler(this);
        QSignalSpy wasHit(handler, SIGNAL(serviceWasHit()));
        HttpListener *listener = new HttpListener(mSettings, handler);
        mQnam.get(QNetworkRequest(getBaseUrl().append("/foo")));
        QTRY_VERIFY(wasHit.count());
        listener->deleteLater();
        handler->deleteLater();
    }
};



#endif // TST_QTWEBAPPTEST_H
