// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

(START)
    @R2
    M=0

    // if (!R0) goto END
    @R0
    D=M 
    @END
    D;JEQ  

    // if (!R1) goto END
    @R1 
    D=M 
    @END 
    D;JEQ  

    // large sums are more performatic than several iterations, then it swaps
    // R0 and R1 if the latter is larger, changing iterations for sums

    // if (R0 >= R1) goto LOOP
    @R0
    D=D-M
    @LOOP
    D;JLE 

    // else swap(R0,R1)
    @R0 
    D=M 
    @R3
    M=D  
    @R1
    D=M 
    @R0 
    M=D  
    @R3
    D=M 
    @R1 
    M=D 

(LOOP)
    // do
    @R0
    D=M 
    @R2 
    M=D+M  // R2 += R0

    @R1 
    DM=M-1  // R1--

    @LOOP 
    D;JGT  // while (R1)

(END)
    @END
    0;JMP