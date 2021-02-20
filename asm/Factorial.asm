//CS243 - Project 4
//first hack asm project - factorial
//Factorial R0 store result in R1

//set D as value in memory R
@R0 
D=M
@:end_of_program
D;JEQ

//R3 is inner loop counter, when its 0 we have added R0 into R2 enough times
@R3
M=D-1

//outer loop counter
@R4
M=D-1

//lazy way of storing original value to place back in R0 at @endprogram sry
//must be a better way...but program works like this so
@R21
M=D

(:outer_loop)
    @R4
    D=M-1
    M=D
    @:outer_loop
    0;JGT
    //create a loop point called loop_begin line 29
    (:loop_begin)
        //load R0 value into M
        @R0
        D=M
        //set R2 value to R2+R0
        @R1
        M=M+D
        //decrement counter at R3
        @R3
        M=M-1
        //load decremented counter into memory
        D=M
        @:loop_begin
        //if greater than then go back to loop
        D;JGT
    //begin handling of sum and decrementing loop counters
    //Load R1 into D
    @R1
    D=M
    //R0 is now product of 1st mult loop - n*n-1
    @R0
    M=D  
    //decrement 1 from R4 loop counter 
    @R4
    D=M-1
    M=D
    //set R3 to new iteration round same as R4 but for inner loop, if it's greater than 0 loop again inner loop using new R0 sum as value to add into R1
    @R3
    M=D   
    @:loop_begin
    //if greater than then go back to loop
    D;JGT
    @R4
    D=M
    @:outer_loop
    D;JGT
//end of program loop    
(:end_of_program)
    //putting the original value back where it was found
    //loads R16/21 original untouched R0 value into D
    @R21
    D=M
    //sets R0 (same as R1 currently which we don't want) back to original value
    @R0
    M=D
    //now R0 is set back to original R0 and the factorial sum is stored in R1
    @:end_of_program
    0;JMP