#==============================================================================================
#
# File:         arduino_uno_rev3.cmake
# Author:       Michael R. Cieslinski, Jr.
# Description:  CMake settings for Arduino Uno Rev. 3.
# Usage:        Include the arduino.cmake, not this file directly. From there, select
#               build_arduino_uno_rev3 ON.
#
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

#if(not ${arduino_cmake_used})
#    message(FATAL_ERROR "Base arduino.cmake file not used, meaning you probably used this directly.\n
#                         Don't do that. That's not how this is meant to work.\n
#                         Include the arduino.cmake file in your base CMakeLists.txt like it says to do.")
#endif()

if(${build_uno_rev3})
    set(path_to_uno_rev3         "/dev/ttyUSB0" CACHE TYPE STRING)
    set(build_dir_uno_rev3       "arduino_uno")

# Add a line for printing that Arduino Uno Rev. 3 is being built.
    set(arduino_targets_to_build "${arduino_targets_to_build} \n  --Arduino Uno Rev. 3")

# Make a build directory for Arduino Uno rev3 and set to build there.
    set(build_dir_uno_rev3 "arduino_uno_rev3")
    file(MAKE_DIRECTORY ${build_dir_uno_rev3})
    set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
    set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
    set(output_name_uno_rev3 "${PROJECT_NAME}_uno_rev3")

# Set C/C++ flags for compiler.
    set(CMAKE_C_FLAGS   "-Os -DF_CPU=16000000UL -mmcu=atmega328p")
    set(CMAKE_CXX_FLAGS "-Os -DF_CPU=16000000UL -mmcu=atmega328p")
    set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
    set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
    add_executable(${output_name_uno_rev3} ${arduino_sources})

    add_custom_command(TARGET ${output_name_uno_rev3} POST_BUILD
                       COMMAND avr-objcopy -O ihex -R .eeprom ${output_name_uno_rev3} ${output_name_uno_rev3}.hex)

    add_custom_target(install_${output_name_uno_rev3}
                      COMMAND avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:${output_name_uno_rev3}.hex)
endif()
