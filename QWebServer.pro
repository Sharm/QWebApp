###########################
###     CONFIG SETUP    ###
###########################

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

HEADERS += $$PWD/QWebServer_global.h \
    $$PWD/Global

include(lib/bfLogging/src/bfLogging.pri)
include(lib/bfHttpServer/src/bfHttpServer.pri)
include(lib/bfTemplateEngine/src/bfTemplateEngine.pri)



###########################
###       INSTALL       ###
###########################

OUTINCLUDE = $$PWD/../include

win32 {
    OUTINCLUDE ~= s,/,\\,g
    QMAKE_POST_LINK += $$quote(if not exist $$OUTINCLUDE\\$$RELEASE_TARGET mkdir $$OUTINCLUDE\\$$RELEASE_TARGET)

    for(header, HEADERS) {
        header ~= s,/,\\,g
        QMAKE_POST_LINK += $$quote(xcopy $$header $$OUTINCLUDE\\$$RELEASE_TARGET /y)
    }
}

unix {
    QMAKE_POST_LINK += $$quote(mkdir -p $$OUTINCLUDE/$$RELEASE_TARGET$$escape_expand(\\n\\t))

    for(header, HEADERS) {
       QMAKE_POST_LINK += $$quote(cp -u $$header $$OUTINCLUDE/$$RELEASE_TARGET$$escape_expand(\\n\\t))
    }
}
