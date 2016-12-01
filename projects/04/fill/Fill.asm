// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LISTEN)
    @KBD
    D=M             // get keyboard state
    @FILL
    D;JGT           // if KBD > 0 goto FILL
    @CLEAR
    D;JEQ           // if KBD == 0 goto CLEAR
    @LISTEN
    0;JMP           // goto LISTEN

(FILL)
    @fill_with
    M=-1            // fill_with = -1 (16 ones)
    @INIT_PRINT
    0;JMP           // goto INIT_PRINT

(CLEAR)
    @fill_with
    M=0             // fill_with = 0
    @INIT_PRINT
    0;JMP           // goto INIT_PRINT

(INIT_PRINT)
    @8192
    D=A
    @words_count
    M=D             // words_count = 8192

    @counter
    M=0             // counter = 0

    @SCREEN
    D=A
    @current_address
    M=D             // current_address = SREEN

(PRINT_ITERATION)
    @words_count
    D=M
    @counter
    D=D-M
    @LISTEN
    D;JEQ           // if counter == words_count go to LISTEN

    @fill_with
    D=M
    @current_address
    A=M
    M=D             // current_address = fill_with

    @1
    D=A
    @current_address
    M=D+M           // current_address += 1 (next word)

    @counter
    M=M+1           // counter++
    @PRINT_ITERATION
    0;JMP           // goto PRINT_ITERATION
