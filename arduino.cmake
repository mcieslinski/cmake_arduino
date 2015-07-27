#==============================================================================================
# File:         arduino.cmake
# Author:       Michael R. Cieslinski, Jr.
# Description:  A set of gcc/g++ settings for using CMake with various arduino boards.
#==============================================================================================

#
# Commands used to get blink working (ATMega328p):
#
# avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o arduino_blink.o arduino_blink.c
# avr-gcc -mmcu=atmega328p arduino_blink.o -o arduino_blink
# avr-objcopy -O ihex -R .eeprom arduino_blink arduino_blink.hex
# avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:arduino_blink.hex
#

option(build_uno        "Create files for Arduino Uno." off)
option(build_zero       "Create files for Arduino Zero." off)
option(build_mega_2560  "Create files for Arduino Mega 2560." off)

set(targets_to_build "Building files for:")
set(build_dir_uno       "arduino_uno")
set(build_dir_zero      "arduino_zero")
set(build_dir_mega_2560 "arduino_mega_2560")

if(build_uno)
    set(targets_to_build "${targets_to_build} \n  --Arduino Uno")
    file(MAKE_DIRECTORY ${build_dir_uno})
    set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno}")
    set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno}")
    set(output_name_uno "${PROJECT_NAME}_uno")
    add_executable(${output_name_uno} ${arduino_sources})
endif()

# if(build_zero)
#     set(targets_to_build "${targets_to_build} \n  --Arduino Zero")
#     set(output_name_zero "${PROJECT_NAME}_zero")
#     file(MAKE_DIRECTORY ${build_dir_zero})
# endif()
# 
# if(build_mega_2560)
#     set(targets_to_build "${targets_to_build} \n  --Arduino Mega 2560")
#     set(output_name_mega_2560 "${PROJECT_NAME}_mega_2560")
#     file(MAKE_DIRECTORY ${build_dir_mega_2560})
# endif()

message(${targets_to_build})
