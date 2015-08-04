# Arduino Uno Rev. 3 Cross-Compiling Notes

This file contains the commands used to get a blink program working on the Arduino Uno Rev. 3 with
an Atmel [ATmega328p](http://www.atmel.com/devices/ATMEGA328P.aspx) microcontroller onboard. These commands were stolen and modified from
[here](https://balau82.wordpress.com/2011/03/29/programming-arduino-uno-in-pure-c/).

Figuring out what each of these things did was done by me, and this is all for learning purposes for those who aren't so enchanted with the Arduino IDE or just want to learn what happens
under the sheets.


### Commands used to get blink working (ATMega328p):

```
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o arduino_blink.o arduino_blink.c
avr-gcc -mmcu=atmega328p arduino_blink.o -o arduino_blink
avr-objcopy -O ihex -R .eeprom arduino_blink arduino_blink.hex
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:arduino_blink.hex
```

---

##### avr-gcc first run notes:

`avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o arduino_blink.o arduino_blink.c`

- `avr-gcc` - GCC (GNU C Compiler) for AVR microcontrollers.


- `-Os` - (O)ptimize for (s)ize


- `-DXXXX` - (D)efine XXXX
  - `-DF_CPU=16000000UL` - CPU Frequency


- `-msomething=value` - (m)achine dependent option something = value
  - `-mmcu=atmega328p` - (m)achine dependent option (mcu) = (atmega328p)


- `-c` - (c)ompile only, no link


- `-o` file - (o)utput file
  - `-o arduino_blink.o` - output object arduino_blink.o

---

##### avr-gcc second run notes:

`avr-gcc -mmcu=atmega328p arduino_blink.o -o arduino_blink`


- `-msomething=value` - (m)achine dependent option something = value
  - `-mmcu=atmega328p` - (m)achine dependent option (mcu) = (atmega328p)


- `-o file - (o)utput file`
  - `-o arduino_blink` - output executable arduino_blink

---

##### avr-objcopy notes:

`avr-objcopy -O ihex -R .eeprom arduino_blink arduino_blink.hex`

- `avr-objcopy` - Copy and translate object files.


- `-O bfdname` - (O)utput file is in format bfdname
  - `-O ihex` - Output file in [ihex](https://en.wikipedia.org/wiki/Intel_HEX)
  format.


- `-R sectionname` - (R)emove any section named sectionname from the output.
  - `-R .eeprom` - Remove .eeprom from the output file.
    - I'm not super sure on this yet, but it seems removing this
      section is to prevent wiping the bootloader from
      [EEPROM](https://en.wikipedia.org/wiki/EEPROM).


- `arduino_blink` - binary to copy


- `arduino_blink.hex` - output file to be loaded to arduino

---


#####avrdude notes:

`avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:arduino_blink.hex`

- `avrdude` - Command used to program the board.


- `-F` - Force avrdude to skip device signature check.


- `-V` - Disable automatic verify check when uploading data.


- `-c programmer-id` - Use the programmer "programmer-id" to write to the device.
  - `-c arduino` - Use the "arduino" [icsp](https://en.wikipedia.org/wiki/In-system_programming) to program the mcu.


- `-p partno` - Target (p)art partno.
  - `-p ATMEGA328P` - Target the ATMega328p.


- `-P /path/to/port` - Serial (P)ort to use for uploading file.
  - `-P /dev/ttyACM0` - Use /dev/ttyACM0 for uploading.


- `-b baud_rate` - Set (b)aud rate to be baud_rate.
  - `-b 115200` - Set the [baud rate](https://en.wikipedia.org/wiki/Symbol_rate) to 115200.


- `-U memtype:op:filename:filefmt` =
  - `-U flash:w:arduino_blink.hex`
