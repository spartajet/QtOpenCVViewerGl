QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtGLWebcamDemo
TEMPLATE = app

INCLUDEPATH+=../cqtopencvviewergl

SOURCES += main.cpp\
           qtglwebcamdemo.cpp \
           ../cqtopencvviewergl/cqtopencvviewergl.cpp

HEADERS  += qtglwebcamdemo.h \
            ../cqtopencvviewergl/cqtopencvviewergl.h

FORMS    += qtglwebcamdemo.ui

win32 {
message("Using win32 configuration")

OPENCV_PATH = C:/OpenCV # Note: update with the correct OpenCV version


#LIBS_PATH = "$$OPENCV_PATH/build/x86/mingw/lib" #project compiled using MINGW
LIBS_PATH = "$$OPENCV_PATH/build/x64/vc15/lib" #project compiled using Visual C++ 2010 32bit compiler

    CONFIG(debug, debug|release) {
    LIBS     += -L$$LIBS_PATH \
                -lopencv_world411d \
#                -lopencv_highgui246d
    }

    CONFIG(release, debug|release) {
    LIBS     += -L$$LIBS_PATH \
                -lopencv_world411 \
#                -lopencv_highgui246
    }
}

unix {
message("Using unix configuration")

OPENCV_PATH = /usr/opencv2

LIBS_PATH = /usr/lib

LIBS     += \
    -L$$LIBS_PATH \
    -lopencv_core \
    -lopencv_highgui
}

INCLUDEPATH += \
    $$OPENCV_PATH/build/include/  #core module
    $$OPENCV_PATH/build/include/opencv2/highgui/ #highgui modul

message("OpenCV path: $$OPENCV_PATH")
message("Includes path: $$INCLUDEPATH")
message("Libraries: $$LIBS")


