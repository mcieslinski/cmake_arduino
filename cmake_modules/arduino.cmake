#==============================================================================================
# File:         arduino.cmake
# Author:       Michael R. Cieslinski, Jr.
# Description:  A set of gcc/g++ settings for using CMake with various arduino boards.
#==============================================================================================

set(CMAKE_SYSTEM_NAME Arduino)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_FORCE_C_COMPILER "/usr/bin/avr-gcc")
set(CMAKE_FORCE_CXX_COMPILER "/usr/bin/avr-g++")

set(arduino_cmake_used TRUE)

set(targets_to_build    "Building files for:")

option(build_uno_rev3 OFF)

if(${build_uno_rev3})
    include(arduino_uno_rev3.cmake)
endif()
