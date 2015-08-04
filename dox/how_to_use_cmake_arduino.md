# How to use cmake_arduino

#### First things first:

In order to most effectively use this system, you should follow these steps.
CMake is supposed to be cross-platform, but until I get to making sure it works
on Windows and Mac(probably never), it might simply not work on Windows or Mac.

1. Use some linux distro with package management. I recommend [Ubuntu](http://www.ubuntu.com)!
2. Download, using the command line and `apt-get` or `yum` or the like,
   `arduino-core`, `cmake`, and either `cmake-curses-gui` or `cmake-qt-gui`.
   I will be using cmake-curses-gui for all examples.
  - `sudo apt-get install arduino-core cmake cmake-curses-gui `
  - `sudo apt-get install arduino-core cmake cmake-qt-gui`
3. Read the rest of this tutorial.

---

#### If/once you know more about what you're doing:
Let's say you have this file: `CMakeLists.txt`

In this file, you might typically have done something like this for a normal project:
```
# Preheat oven.
project(my_arduino_project)

# Combine ingredients.
set(my_sources  main.cpp
                auxiliary_file.cpp
                secret_sauce.cpp)

# Bake at 450 for like 2 seconds.
add_executable(${PROJECT_NAME} ${my_sources})
```

But you, as a pretty clever dude(tte), know that this won't quite work for
programming the actual board, and nothing has even been set to indicate that
you are cross-compiling! Here is the easy way to do it:

```
# Preheat oven.
project(my_arduino_project)

# Combine ingredients.
set(my_sources  main.cpp
                auxiliary_file.cpp
                secret_sauce.cpp)

# Turn off oven and deep fry it instead.
include(~/cmake_arduino/cmake_modules/arduino.cmake)
```

There are a few important things about this:
1. `PROJECT_NAME` must be set by calling `project(something)`
2. `my_sources` must be set by calling `set(my_sources) and listing the sources as above.
3. `arduino.cmake` must be included by calling `include(path/to/arduino.cmake)` as above.

These things must be done with at least steps 1 and 2 coming before 3, since `arduino.cmake`
depends on the variables `PROJECT_NAME` and `my_sources` to make output files.

---

#### Now that the `CMakeLists.txt` file exists:

If you know how to use CMake, you can pretty much skip this part. If not, read on!

1. It's a good idea, in general, to create a separate build directory in your project
   directory so that you do not get build files all over your beautiful new source code.
  ```
  cd ~/arduino_project
  mkdir build
  cd build
  ```

2. Now that you're in a nice, isolated area, you need to generate your `CMakeCache.txt` file.
  ```
  ccmake ..
  ```

3. You should now have a window open that says `EMPTY CACHE`. Press `c`!

4. You should now have a list of options that appear to be related to Arduino,
   such as `build_uno_rev3 | OFF`. Go through the available boards and press
   `Enter` to toggle them as you go and press `c` when finished.

5. More options appear! Now you need to enter the serial programmer's path on your
   system for each board you aim to program. Press `Enter` to edit and `Enter`
   again to complete the edit or `Esc` to discard the edit. One more `c` press
   is required.

6. Hooray, project configuration is done. You may have noticed a `[g]` option
   appeared at the bottom of the window. Go ahead and do that. Press `g`.

7. Back at the command line, assuming nothing went wrong, you have a `Makefile`
   just awaiting your command. From here, you can do a...
   ```
   make
   sudo make install<TAB><TAB>
   ```

8. Yay install options! One option should pop up for each board you chose, and
   now you can install with something like:
   ```
   sudo make install_arduino_uno_rev3
   ```
