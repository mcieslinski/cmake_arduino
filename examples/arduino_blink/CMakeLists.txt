cmake_minimum_required(VERSION 2.6)
project(arduino_blink)
set(arduino_sources arduino_blink.c)
include(arduino.cmake)

# I am still incredibly unclear which of these are necessary, but for the time, 
# CMAKE_SYSTEM_NAME Generic seems to be all that is needed.
#set(CMAKE_C_COMPILER_WORKS TRUE)
#set(CMAKE_CXX_COMPILER_WORKS TRUE)
#set(CMAKE_SYSTEM_NAME Generic)
#set(CMAKE_CROSSCOMPILING TRUE)
#set(CMAKE_C_COMPILER "avr-gcc")
#set(CMAKE_CXX_COMPILER "avr-g++")


# Store the original values of CMAKE_C_OPTIONS
#set(EXECUTABLE_OUTPUT_PATH_ORIG ${EXECUTABLE_OUTPUT_PATH})
#set(LIBRARY_OUTPUT_PATH_ORIG ${LIBRARY_OUTPUT_PATH})
#set(CMAKE_C_OPTIONS_ORIG ${CMAKE_C_OPTIONS})

# Make a build directory for Arduino Uno and set to build there.
#file(MAKE_DIRECTORY ${build_dir_uno})
#set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno}")
#set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno}")

