
#include <QCoreApplication>
#include <QTest>
#include "tst_QtWebAppTest.h"

int main(int argc, char *argv[])
{
    QCoreApplication c(argc, argv);

    c.setApplicationName("qtwebapp-test");
    c.setOrganizationName("com.captemulation.test");

    QtWebAppTest *qtWebAppTest = new QtWebAppTest();
    QObject::connect(qtWebAppTest, SIGNAL(destroyed()), &c, SLOT(quit()));
    QTest::qExec(qtWebAppTest, argc, argv);

    return c.exec();
}

