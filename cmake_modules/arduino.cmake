#==============================================================================================
# File:         arduino.cmake
# Author:       Michael R. Cieslinski, Jr.
# Description:  A set of gcc/g++ settings for using CMake with various arduino boards.
#==============================================================================================

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER "avr-gcc")
set(CMAKE_CXX_COMPILER "avr-g++")

option(build_uno_rev3 OFF CACHE)

# Create a printout dialog for what's being built.
set(arduino_targets_to_build    "Building files for:")

if(build_uno_rev3)
    include(arduino_uno_rev3.cmake)
endif()

message(${arduino_targets_to_build})
