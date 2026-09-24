// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(START)
    // stop = KBD.address
    @KBD 
    D=A
    @stop
    M=D 

(CHECK_KBD)
    // color = KBD ? -1 : 0
    @KBD
    D=M 
    @SET_COLOR
    D;JEQ 
    D=-1

    (SET_COLOR)
        @color 
        M=D 

    // address = SCREEN.address
    @SCREEN 
    D=A 
    @address 
    M=D 

(LOOP)
    // do
    // RAM[address] = color
    @color 
    D=M 
    @address
    A=M 
    M=D 

    // address++
    @address 
    DM=M+1

    // if (address == stop) goto CHECK_KBD
    @stop 
    D=D-M
    @CHECK_KBD
    D;JEQ 

    // while (address < stop)
    @LOOP
    0;JMP
