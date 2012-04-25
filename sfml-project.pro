TEMPLATE = app
CONFIG += console
CONFIG -= qt

SOURCES += main.cpp

###############################################
# CONFIGURATION
###############################################

CONFIG_APP_NAME = sfml-project

CONFIG += copy_dir_files
TARGET = $${CONFIG_APP_NAME}

macx {
    CONFIG_PLATFORM_PATH  = mac
    CONFIG_ICON_EXTENSION = icns

    ICON = $${PWD}/resources/$${CONFIG_PLATFORM_PATH}/app.$${CONFIG_ICON_EXTENSION}
}

win32 {
    CONFIG_PLATFORM_PATH  = win32
    CONFIG_ICON_EXTENSION = png

    RC_FILE = $${PWD}/resources/$${CONFIG_PLATFORM_PATH}/app.rc
}

unix:!macx {
    CONFIG_PLATFORM_PATH  = unix
    CONFIG_ICON_EXTENSION = png

    ICON = $${PWD}/resources/$${CONFIG_PLATFORM_PATH}/app.$${CONFIG_ICON_EXTENSION}
}

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
    QMAKE_POST_LINK += $(MKDIR) $${CONFIG_APP_NAME}.app/Contents/Frameworks &&
    QMAKE_POST_LINK += $${QMAKE_COPY} $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/lib/* $${CONFIG_APP_NAME}.app/Contents/Frameworks
}

win32 {
    QMAKE_POST_LINK += $${QMAKE_COPY} $${PWD}/library/sfml/$${CONFIG_PLATFORM_PATH}/bin/* $(OBJECTS_DIR)
}

unix:!macx {
    # need implement
}

OTHER_FILES += \
    resources/win32/app.rc
