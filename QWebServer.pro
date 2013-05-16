TEMPLATE = lib
DEFINES += QWEBSERVER_SHARED

DEBUG_TARGET = QWebServerd
RELEASE_TARGET = QWebServer

QT = core network


###########################
###    LINK DEP LIBS    ###
###########################

# LIBS += -lAdvapi32 -lSetupapi


###########################
###    SETUP OUTPUT     ###
###########################

OUTDIR = ..

CONFIG(debug, debug|release){
    TARGET = $$DEBUG_TARGET
}

CONFIG(release, debug|release){
    TARGET = $$RELEASE_TARGET
    DEFINES += QT_NO_DEBUG_OUTPUT
}

DESTDIR = $$OUTDIR/lib/$$RELEASE_TARGET
DLLDESTDIR = $$OUTDIR/../bin/FlipBox


###########################
###       SOURCES       ###
###########################

# SOURCES += *.cpp

HEADERS += *.h

include(lib/bfLogging/src/bfLogging.pri)
include(lib/bfHttpServer/src/bfHttpServer.pri)
include(lib/bfTemplateEngine/src/bfTemplateEngine.pri)



###########################
###       INSTALL       ###
###########################

win32 {
    OUTINCLUDE = ..\\include
    headercopy.commands += cd $$PWD $$escape_expand(\\n)

    for(header, HEADERS) {
        header ~= s,/,\\,g
        headercopy.commands += xcopy $$header $$OUTINCLUDE\\$$RELEASE_TARGET /y $$escape_expand(\\n)
    }

    QMAKE_EXTRA_TARGETS += headercopy
    POST_TARGETDEPS += headercopy
}


