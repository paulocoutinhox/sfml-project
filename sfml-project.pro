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
    # method 1
    sfml-library.path  = $${DESTDIR}
    sfml-library.files = $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/
    INSTALLS += sfml-library

    # method 2+1
    #QMAKE_BUNDLE_DATA += sfml-library

    # method 3
    #EXTRA_BINFILES += \
    #    $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/sfml-system-2.dll
    #EXTRA_BINFILES_WIN = $${EXTRA_BINFILES}
    #EXTRA_BINFILES_WIN ~= s,/,\\,g
    #    DESTDIR_WIN = $${DESTDIR}
    #DESTDIR_WIN ~= s,/,\\,g
    #for(FILE,EXTRA_BINFILES_WIN){
    #            QMAKE_POST_LINK +=$$quote(cmd /c copy /y $${FILE} $${DESTDIR_WIN}$$escape_expand(\n\t))
    #}

    # method 4
    #QMAKE_POST_LINK += copy /Y $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/sfml-system-2.dll $${PWD}/debug
}

unix:!macx {
    # need implement
}
