//CS243 Project 4 - Fill
//Kyle Filice

//jump here at end (want to listen again for kbd + draw white if no kbd input)
(:program_start)
//listen for keyboard input until key press is the "enter" key
//get initial count / screen start
@16384
D=A
//store initial count add in R14
@R14
M=D 
//get screen end
@24575
D=A
//set R14 to Screen end - screen start (overall count)
@R14
M=D-M

//listen for keypress, will loop until key is pressed
(:listen_keyboard)
@KBD
D=M
@R0
M=D
//KBD = 0, then write 0 to all screen pixels
@:write_white
D;JEQ
//KBD != 0, then write -1 to all screen pixels
@:write_black
D;JGT

//writes 0
(:write_white)
@16384
D=A
//set pointer i to start of screen
@i
M=D

    (:write_loopw)
    @i
    A=M
    M=D
    M=0

    //setting gaps for 8 (address +4)
    @i
    M=M+1
    M=M+1
    M=M+1
    M=M+1

    //decrementing counter x4
    @R14
    M=M-1
    M=M-1
    M=M-1
    M=M-1
    D=M
    @:program_end
    D;JLE
    @:write_loopw
    D;JNE

//loop writes -1
(:write_black)
@16384
D=A
//set pointer i to start of screen
@i
M=D

    (:write_loopb)
    @i
    A=M
    M=D
    M=-1
    //setting gaps for 8 (address +4)
    @i
    M=M+1
    M=M+1
    M=M+1
    M=M+1

    //decrementing counter x4
    @R14
    M=M-1
    M=M-1
    M=M-1
    M=M-1
    D=M
    @:program_end
    D;JLE
    @:write_loopb
    D;JNE

(:program_end)
    @:program_start
    0;JMP
    @:program_end
    0;JMP