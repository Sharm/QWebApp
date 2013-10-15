#-------------------------------------------------
#
# Project created by QtCreator 2013-10-11T21:35:35
#
#-------------------------------------------------

QT       += network testlib

QT       -= gui

TARGET = tst_QtWebAppTest
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += \
    tst_QtWebAppTest.cpp \
    main.cpp
DEFINES += SRCDIR=\\\"$$PWD/\\\"

HEADERS += \
    tst_QtWebAppTest.h

OTHER_FILES += \
    testConfig.ini

# QtWQebApp lib

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../lib/QWebServer/ -lQWebServerd
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../lib/QWebServer/ -lQWebServerdd
else:unix: LIBS += -L$$PWD/../lib/QWebServer/ -lQWebServerd

INCLUDEPATH += $$PWD/../include/QWebServer
DEPENDPATH += $$PWD/../include/QWebServer

