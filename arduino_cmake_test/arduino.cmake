set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER "avr-gcc")
set(CMAKE_CXX_COMPILER "avr-g++")

message("In arduino.cmake: PROJECT_NAME: ${CMAKE_PROJECT_NAME}")
option(build_uno_rev3 OFF CACHE)

if(build_uno_rev3)
    include(arduino_uno_rev3.cmake)
endif()
