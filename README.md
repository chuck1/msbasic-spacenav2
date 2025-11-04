# Microsoft BASIC for 6502

This is a single integrated assembly source tree that can generate nine different versions of Microsoft BASIC for 6502.

By running ./make.sh, this will generate all versions and compare them to the original files byte by byte. The CC65 compiler suite is need to build this project.

These are the first ten (known) versions of Microsoft BASIC for 6502:

| Name                | Release  | MS Version   | ROM  | 9digit | INPUTBUFFER  | extensions  | .define    |
| ------------------- |:--------:| ------------ |:----:|:------:|:------------:|:-----------:| ---------- |
| Commodore BASIC 1   |  1977    |              |  Y   |   Y    |      ZP      |    CBM      |            |
| OSI BASIC           |  1977    | 1.0 REV 3.2  |  Y   |   N    |      ZP      |      -      | CONFIG_10A |
| AppleSoft I         |  1977    | 1.1          |  N   |   Y    |    $0200     |    Apple    | CONFIG_11  |
| KIM BASIC           |  1977    | 1.1          |  N   |   Y    |      ZP      |      -      | CONFIG_11A |
| AppleSoft II        |  1978    |              |  Y   |   Y    |    $0200     |    Apple    | CONFIG_2   |
| AIM-65 BASIC        |  1978    | 1.1?         |  Y   |   N    |      ZP      |     AIM     | CONFIG_2A  |
| SYM-1 BASIC         |  1978    | 1.1?         |  Y   |   N    |      ZP      |     SYM     | CONFIG_2A  |
| Commodore BASIC 2   |  1979    |              |  Y   |   Y    |    $0200     |     CBM     | CONFIG_2A  |
| KBD BASIC           |  1982    |              |  Y   |   N    |    $0700     |     KBD     | CONFIG_2B  |
| MicroTAN            |  1980    |              |  Y   |   Y    |      ZP      |      -      | CONFIG_2C  |

(Note that this assembly source cannot (yet) build AppleSoft II.)

This lists the versions in the order in which they were forked from the Microsoft source base. Commodore BASIC 1, as used on the original PET is the oldest known version of Microsoft BASIC for 6502. It contains some additions to Microsoft's version, like Commodore-style file I/O.

The CONFIG_n defines specify what Microsoft-version the OEM version is based on. If CONFIG_2B is defined, for example, CONFIG_2A, CONFIG_2, CONFIG_11A, CONFIG_11 and CONFIG_10A will be defined as well, and all bugfixes up to version 2B will be enabled.

The following symbols can be defined in addition:

| Configuration Symbol              | Description
| --------------------------------- | --------------------------------------------------------------------------------
| CONFIG_CBM1_PATCHES               | jump out into CBM1's binary patches instead of doing the right thing inline
| CONFIG_CBM_ALL                    | add all Commodore-specific additions except file I/O
| CONFIG_DATAFLG                    | ?
| CONFIG_EASTER_EGG                 | include the CBM2 "WAIT 6502" easter egg
| CONFIG_FILE                       | support Commodore PRINT#, INPUT#, GET#, CMD
| CONFIG_IO_MSB                     | all I/O has bit #7 set
| CONFIG_MONCOUT_DESTROYS_Y         | Y needs to be preserved when calling MONCOUT
| CONFIG_NO_CR                      | terminal doesn't need explicit CRs on line ends
| CONFIG_NO_LINE_EDITING            | disable support for Microsoft-style "@", "_", BEL etc.
| CONFIG_NO_POKE                    | don't support PEEK, POKE and WAIT
| CONFIG_NO_READ_Y_IS_ZERO_HACK     | don't do a very volatile trick that saves one byte
| CONFIG_NULL                       | support for the NULL statement
| CONFIG_PEEK_SAVE_LINNUM           | preserve LINNUM on a PEEK
| CONFIG_PRINTNULLS                 | whether PRINTNULLS does anything
| CONFIG_PRINT_CR                   | print CR when line end reached
| CONFIG_RAM                        | optimizations for RAM version of BASIC, only use on 1.x
| CONFIG_ROR_WORKAROUND             | use workaround for buggy 6502s from 1975/1976; not safe for CONFIG_SMALL!
| CONFIG_SAFE_NAMENOTFOUND          | check both bytes of the caller's address in NAMENOTFOUND
| CONFIG_SCRTCH_ORDER               | where in the init code to call SCRTCH
| CONFIG_SMALL                      | use 6 digit FP instead of 9 digit, use 2 character error messages, don't have GET
| CONFIG_SMALL_ERROR                | use 2 character error messages

Changing symbol definitions can alter an existing base configuration, but it not guaranteed to assemble
or work correctly.

## More Information

More information on the differences of the respective versions can be found on this blog entry: [Create your own Version of Microsoft BASIC for 6502](http://www.pagetable.com/?p=46).

Also, Ben Eater has an published excellent video demonstrating how to port BASIC to a new system: [Running MSBASIC on my breadboard 6502 computer
](https://www.youtube.com/watch?v=XlbPnihCM0E)

## License

2-clause BSD

## Credits

* Main work by Michael Steil <mist64@mac.com>.
* AIM-65 and SYM-1 by Martin Hoffmann-Vetter
* Function names and all uppercase comments taken from Bob Sander-Cederlof's excellent [AppleSoft II disassembly](http://www.txbobsc.com/scsc/scdocumentor/).
* [Applesoft lite](http://cowgod.org/replica1/applesoft/) by Tom Greene helped a lot, too.
* Thanks to Joe Zbicak for help with Intellision Keyboard BASIC
* This work is dedicated to the memory of my dear hacking pal Michael "acidity" Kollmann.

# My Issues

* cant figure out IF THEN ELSE END
* cant figure out WHILE loops
* cant figure out DO loops
* cant figure out PEEK
* INPUT seems to want weird string syntax
* no backspace
* no line editing

# BASIC Reference

Things I've demonstrated

    PRINT 1
    PRINT "HELLO"
    1+1
    1-1
    1*1
    1/1
    3/2
    

## FLow Control

Haven't figured out WHILE or DO loops yet

### FOR loop

    FOR I = 0 TO 5
    NEXT

## Input

Only works in a program.

For the input, not having the starting quotation mark fails. And if I add a terminating quotation mark, it gets added to string.

    10 input
    10 INPUT "HI"; A$
    20 PRINT A$
    RUN
    HI? "HELLO ALL
    HELLO ALL

## Sample Programs

### Primes

    50 M = 5
    100 DIM A(20)
    200 A(0)=2
    201 A(1)=3
    210 N=2
    250 X=4
    270 FOR I = 0 TO M
    280 P = 1
    300 FOR J = 0 TO (N-1)
    310 R = X - INT(X/A(J))*A(J)
    390 GOTO 450
    400 PRINT X,A(J),R
    450 IF R = 0 THEN 460
    455 GOTO 500
    460 P = 0
    500 NEXT
    510 IF P = 0 THEN 570
    530 PRINT "FOUND PRIME",X
    550 A(N)=X
    560 N=N+1
    570 X=X+1
    600 NEXT

### Fib

    5 D = 1000
    10 A = 1
    20 B = 1
    25 PRINT A,B
    30 C = A + B
    40 A = B
    50 B = C
    55 PRINT A,B,B/A
    60 IF B < D THEN 30

    

