# cmake_arduino

CMake file(s) to aid in the development of Arduino without the prohibitive
Arduino IDE and using the mighty power of CMake. This project is primarily an
exploration into the world of cross-compiling for Arduino and usage of CMake, as
well as a resource for anyone else who wishes to learn about the topic, written
from the perspective of someone who knew very little on the topic to begin with.

Notes can be found all over the place regarding why certain things were done,
but I'm finding this [Markdown](https://help.github.com/articles/markdown-basics/)
format to be very interesting for documenting things, so most things will be
better explained, easier to read, or both in the dox folder. There, you will
find that a lot of different things have links, much like the Markdown link
shortly before this statement. This is intended to help the learners learn more
easily while still allowing the skimmers to skim. Hopefully it helps someone.

### I wanted to make a table, so here is a board support list:

Arduino Model | Microcontroller (MCU)
--- | ---
[Arduino Uno Rev. 3](https://www.arduino.cc/en/Main/ArduinoBoardUno) | [Atmel ATmega328p](http://www.atmel.com/devices/ATMEGA328P.aspx)
[Arduino Mega 2560](https://www.arduino.cc/en/Main/ArduinoBoardMega2560)  | [Atmel ATmega2560](http://www.atmel.com/devices/ATMEGA2560P.aspx)
