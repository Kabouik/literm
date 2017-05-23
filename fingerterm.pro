QT = core gui qml quick

CONFIG -= app_bundle

MOC_DIR = .moc
OBJECTS_DIR = .obj

CONFIG += link_pkgconfig

enable-feedback {
    QT += feedback
    DEFINES += HAVE_FEEDBACK
}

enable-nemonotifications {
    PKGCONFIG += nemonotifications-qt5
}

isEmpty(DEFAULT_FONT) {
    mac: DEFAULT_FONT = Monaco
    else: DEFAULT_FONT = monospace
}

DEFINES += DEFAULT_FONTFAMILY=\\\"$$DEFAULT_FONT\\\"

TEMPLATE = app
TARGET = fingerterm
DEPENDPATH += .
INCLUDEPATH += .
LIBS += -lutil

# Input
HEADERS += \
    ptyiface.h \
    terminal.h \
    textrender.h \
    version.h \
    utilities.h \
    keyloader.h

SOURCES += \
    main.cpp \
    terminal.cpp \
    textrender.cpp \
    ptyiface.cpp \
    utilities.cpp \
    keyloader.cpp

OTHER_FILES += \
    qml/mobile/Main.qml \
    qml/mobile/Keyboard.qml \
    qml/mobile/Key.qml \
    qml/mobile/Lineview.qml \
    qml/mobile/Button.qml \
    qml/mobile/MenuFingerterm.qml \
    qml/mobile/NotifyWin.qml \
    qml/mobile/UrlWindow.qml \
    qml/mobile/LayoutWindow.qml \
    qml/mobile/PopupWindow.qml

OTHER_FILES += \
    qml/desktop/Main.qml \
    qml/desktop/Keyboard.qml \
    qml/desktop/Key.qml \
    qml/desktop/Button.qml \
    qml/desktop/MenuFingerterm.qml \
    qml/desktop/NotifyWin.qml \
    qml/desktop/UrlWindow.qml \
    qml/desktop/LayoutWindow.qml \
    qml/desktop/PopupWindow.qml \
    qml/desktop/TabView.qml \
    qml/desktop/TabBar.qml

RESOURCES += \
    resources.qrc

target.path = /usr/bin
INSTALLS += target

contains(MEEGO_EDITION,nemo) {
    desktopfile.extra = cp $${TARGET}.desktop.nemo $${TARGET}.desktop
    desktopfile.path = /usr/share/applications
    desktopfile.files = $${TARGET}.desktop
    INSTALLS += desktopfile
    DEFINES += MOBILE_BUILD
} else {
    DEFINES += DESKTOP_BUILD
}
