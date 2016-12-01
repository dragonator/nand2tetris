// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    // result = 0
    @result
    M=0

    // multiplier1 = R0  ; return result if R0 == 0
    @R0
    D=M
    @STOP
    D;JEQ
    @multiplier1
    M=D

    // multiplier2 = R1 ; return result if R1 == 00
    @R1
    D=M
    @STOP
    D;JEQ
    @multiplier2
    M=D

    // counter = multiplier2
    @counter
    M=D

(LOOP)
    // result += multiplier1
    @multiplier1
    D=M
    @result
    M=M+D

    // counter -= 1
    @counter
    M=M-1
    D=M

    // if counter > 0 goto LOOP
    @LOOP
    D;JGT

    // if counter = 0 goto STOP
    //@STOP
    //D;JEQ

(STOP)
    // R2 = result
    @result
    D=M
    @R2
    M=D
    @END
    0;JMP

(END)
    0;JMP
