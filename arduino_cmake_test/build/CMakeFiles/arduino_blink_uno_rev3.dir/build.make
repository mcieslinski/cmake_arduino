# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/michael/arduino/arduino_cmake_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/michael/arduino/arduino_cmake_test/build

# Include any dependencies generated for this target.
include CMakeFiles/arduino_blink_uno_rev3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/arduino_blink_uno_rev3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/arduino_blink_uno_rev3.dir/flags.make

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o: CMakeFiles/arduino_blink_uno_rev3.dir/flags.make
CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o: ../arduino_blink.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/michael/arduino/arduino_cmake_test/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o"
	avr-gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o   -c /home/michael/arduino/arduino_cmake_test/arduino_blink.c

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.i"
	avr-gcc  $(C_DEFINES) $(C_FLAGS) -E /home/michael/arduino/arduino_cmake_test/arduino_blink.c > CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.i

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.s"
	avr-gcc  $(C_DEFINES) $(C_FLAGS) -S /home/michael/arduino/arduino_cmake_test/arduino_blink.c -o CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.s

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.requires:
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.requires

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.provides: CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.requires
	$(MAKE) -f CMakeFiles/arduino_blink_uno_rev3.dir/build.make CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.provides.build
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.provides

CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.provides.build: CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o

# Object files for target arduino_blink_uno_rev3
arduino_blink_uno_rev3_OBJECTS = \
"CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o"

# External object files for target arduino_blink_uno_rev3
arduino_blink_uno_rev3_EXTERNAL_OBJECTS =

arduino_uno_rev3/arduino_blink_uno_rev3: CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o
arduino_uno_rev3/arduino_blink_uno_rev3: CMakeFiles/arduino_blink_uno_rev3.dir/build.make
arduino_uno_rev3/arduino_blink_uno_rev3: CMakeFiles/arduino_blink_uno_rev3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable arduino_uno_rev3/arduino_blink_uno_rev3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/arduino_blink_uno_rev3.dir/link.txt --verbose=$(VERBOSE)
	avr-objcopy -O ihex -R .eeprom arduino_uno_rev3/arduino_blink_uno_rev3 arduino_uno_rev3/arduino_blink_uno_rev3.hex

# Rule to build all files generated by this target.
CMakeFiles/arduino_blink_uno_rev3.dir/build: arduino_uno_rev3/arduino_blink_uno_rev3
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/build

CMakeFiles/arduino_blink_uno_rev3.dir/requires: CMakeFiles/arduino_blink_uno_rev3.dir/arduino_blink.c.o.requires
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/requires

CMakeFiles/arduino_blink_uno_rev3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/arduino_blink_uno_rev3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/clean

CMakeFiles/arduino_blink_uno_rev3.dir/depend:
	cd /home/michael/arduino/arduino_cmake_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/michael/arduino/arduino_cmake_test /home/michael/arduino/arduino_cmake_test /home/michael/arduino/arduino_cmake_test/build /home/michael/arduino/arduino_cmake_test/build /home/michael/arduino/arduino_cmake_test/build/CMakeFiles/arduino_blink_uno_rev3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/arduino_blink_uno_rev3.dir/depend
