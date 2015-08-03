#==============================================================================================
# File:         arduino_uno_rev3.cmake
# Author:       Michael R. Cieslinski, Jr.
# Description:  CMake settings for Arduino Uno Rev. 3.
# Usage:        Include the arduino.cmake, not this file directly. From there, select
#               build_arduino_uno_rev3 ON.
#==============================================================================================

if(UNIX)
    set(uno_rev3_programmer "/dev/ttyUSB0" CACHE STRING "Path to programmer connected to the Arduino Uno Rev. 3")
elseif(WIN32)
    set(uno_rev3_programmer "" CACHE)
endif()

# Add a line for printing that Arduino Uno Rev. 3 is being built.
set(arduino_targets_to_build "${arduino_targets_to_build} \n  -- Arduino Uno Rev. 3. \n    -- Programmer: ${uno_rev3_programmer}")

# Make a build directory for Arduino Uno rev3 and set to build there.
set(build_dir_uno_rev3 "arduino_uno_rev3")
file(MAKE_DIRECTORY ${build_dir_uno_rev3})

if(UNIX)
    set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
    set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/${build_dir_uno_rev3}")
elseif(WIN32)
    set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}\${build_dir_uno_rev3}")
    set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}\${build_dir_uno_rev3}")
endif()

# Name the output variable to reflect what's being built.
set(output_name_uno "${CMAKE_PROJECT_NAME}_uno_rev3")

# Flags for compiling for Arduino Uno Rev. 3
set(CMAKE_C_FLAGS   "-Os -DF_CPU=16000000UL -mmcu=atmega328p")
set(CMAKE_CXX_FLAGS "-Os -DF_CPU=16000000UL -mmcu=atmega328p")

# Make sure CMake doesn't try to add stupid flags to the linker that we don't want.
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

# Awwwwww yyyyeeaaaahhhh
add_executable(${output_name_uno} ${arduino_sources})

if(UNIX)
    # Make the hex file.
    add_custom_command(TARGET ${output_name_uno} POST_BUILD
                       COMMAND avr-objcopy -O ihex -R .eeprom ${build_dir_uno_rev3}/${output_name_uno} ${build_dir_uno_rev3}/${output_name_uno}.hex)

    # Create install target for Arduino Uno Rev. 3
    add_custom_target(install_${output_name_uno}
                      COMMAND avrdude -F -V -c arduino -p ATMEGA328P -P ${uno_rev3_programmer} -b 115200 -U flash:w:${build_dir_uno_rev3}/${output_name_uno}.hex)
elseif(WIN32)
    # Make the hex file.
    add_custom_command(TARGET ${output_name_uno} POST_BUILD
                       COMMAND avr-objcopy -O ihex -R .eeprom ${build_dir_uno_rev3}\${output_name_uno} ${build_dir_uno_rev3}\${output_name_uno}.hex)

    # Create install target for Arduino Uno Rev. 3
    add_custom_target(install_${output_name_uno}
                      COMMAND avrdude -F -V -c arduino -p ATMEGA328P -P ${uno_rev3_programmer} -b 115200 -U flash:w:${build_dir_uno_rev3}\${output_name_uno}.hex)
else()
endif()
