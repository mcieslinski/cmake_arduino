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

#
# avr-gcc first run notes:
# avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o arduino_blink.o arduino_blink.c
# =============================================================================================
# -Os = (O)ptimize for (s)ize
# -DXXXX = (D)efine XXXX
#   -DF_CPU=16000000UL = CPU Frequency???
# -msomething=value = (m)achine dependent option something = value
#   -mmcu=atmega328p = (m)achine dependent option (mcu) = (atmega328p)
# -c = Compile only, no link
# -o file = (o)utput file
#   -o arduino_blink.o = output object arduino_blink.o
#

#
# avr-gcc second run notes:
# avr-gcc -mmcu=atmega328p arduino_blink.o -o arduino_blink
# =============================================================================================
# -msomething=value = (m)achine dependent option something = value
#   -mmcu=atmega328p = (m)achine dependent option (mcu) = (atmega328p)
# -o file = (o)utput file
#   -o arduino_blink = output executable arduino_blink
#

#
# avr-objcopy notes:
# avr-objcopy -O ihex -R .eeprom arduino_blink arduino_blink.hex
# =============================================================================================
# avr-objcopy = Copy and translate object files.
# -O bfdname = (O)utput file is in format bfdname
#   -O ihex = Output file in ihex(???) format.
# -R sectionname = (R)emove any section named sectionname from the output.
#   -R .eeprom = Remove .eeprom from the output file. (Why???)
# Other things:
#   arduino_blink = binary to copy
#   arduino_blink.hex = output file to be loaded to arduino
#

#
# avrdude notes:
# avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:arduino_blink.hex
# =============================================================================================
# avrdude = Command used to program the board.
# -F Force avrdude to skip device signature check.
# -V Disable automatic verify check when uploading data.
# -c programmer-id = Use the programmer "programmer-id" to write to the device.
#   -c arduino = Use the "arduino" icsp to program the mcu.
# -p partno = Target (p)art partno.
#   -p ATMEGA328P = Target the ATMega328p.
# -P /path/to/port = Serial (P)ort to use for uploading file.
#   -P /dev/ttyACM0 = Use /dev/ttyACM0 for uploading.
# -b baud_rate = Set (b)aud rate to be baud_rate.
#   -b 115200
# -U memtype:op:filename:filefmt = 
#   -U flash:w:arduino_blink.hex
#
cmake_minimum_required(VERSION 2.6)

#set(CMAKE_C_COMPILER_WORKS TRUE)
#set(CMAKE_CXX_COMPILER_WORKS TRUE)
#set(CMAKE_SYSTEM_NAME Generic)
# Look up CMake "toolchain file"
#set(CMAKE_CROSSCOMPILING TRUE)
#set(CMAKE_C_COMPILER "avr-gcc")
#set(CMAKE_CXX_COMPILER "avr-g++")

project(arduino_blink)
set(~/cmake_arduino/cmake_modules/arduino_toolchain.cmake)
set(arduino_sources arduino_blink.c)

# Store the original values of CMAKE_C_OPTIONS
#set(EXECUTABLE_OUTPUT_PATH_ORIG ${EXECUTABLE_OUTPUT_PATH})
#set(LIBRARY_OUTPUT_PATH_ORIG ${LIBRARY_OUTPUT_PATH})
#set(CMAKE_C_OPTIONS_ORIG ${CMAKE_C_OPTIONS})

# Make a build directory for Arduino Uno rev3 and set to build there.
set(build_dir_uno_rev3 "arduino_uno_rev3")
file(MAKE_DIRECTORY ${build_dir_uno_rev3})
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
set(output_name_uno_rev3 "${PROJECT_NAME}_uno_rev3")
set(CMAKE_C_FLAGS "-Os -DF_CPU=16000000UL -mmcu=atmega328p")
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
add_executable(${output_name_uno_rev3} ${arduino_sources})

add_custom_command(TARGET ${output_name_uno_rev3} POST_BUILD
                   COMMAND avr-objcopy -O ihex -R .eeprom ${output_name_uno_rev3} ${output_name_uno_rev3}.hex)

add_custom_target(install_${output_name_uno_rev3}
                  COMMAND avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:${output_name_uno_rev3}.hex)
