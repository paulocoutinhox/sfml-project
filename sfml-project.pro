TEMPLATE = app
CONFIG += console
CONFIG -= qt

SOURCES += main.cpp

###############################################
# CONFIGURATION
###############################################

CONFIG_APP_NAME = sfml-project

macx {
    CONFIG_PLATFORM_PATH  = mac
    CONFIG_ICON_EXTENSION = icns
}

win32 {
    CONFIG_PLATFORM_PATH  = win32
    CONFIG_ICON_EXTENSION = png
}

unix:!macx {
    CONFIG_PLATFORM_PATH  = unix
    CONFIG_ICON_EXTENSION = png
}

ICON = $${PWD}/resources/$${CONFIG_PLATFORM_PATH}/app.$${CONFIG_ICON_EXTENSION}
TARGET = $${CONFIG_APP_NAME}

###############################################
# SFML LIBRARY
###############################################

INCLUDEPATH += "$${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/include"
LIBS += -L"$${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/lib" \
    -lsfml-system \
    -lsfml-window \
    -lsfml-graphics \
    -lsfml-audio \
    -lsfml-network

macx {
    sfml-library.path  = Contents/Frameworks
    sfml-library.files = $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/lib/
    QMAKE_BUNDLE_DATA += sfml-library
}

win32 {
    sfml-library.path  = $${DESTDIR}
    sfml-library.files = $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/
    INSTALLS += sfml-library
    #QMAKE_BUNDLE_DATA += sfml-library
    #PRE_TARGETDEPS += $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/*
    #copyfiles.commands += copy /y $${PWD}\\library\\sfml\\$${CONFIG_PLATFORM_PATH}\\bin\\sfml-system-2.dll debug
    #QMAKE_EXTRA_TARGETS += copyfiles
}

unix:!macx {
    # need implement
}
