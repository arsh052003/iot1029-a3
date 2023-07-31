.global _start
_start:
    MOV R0, #20
    MOV R1, #6
    MOV R5, #15

    CMP R0, R1  //Compare the values in R0 and R1
    BGT greater //If R0 > R1, branch to the 'greater' label
    BLT lesser  //If R0 < R1, branch to the 'lesser' label
    BEQ equal   //If R0 = R1, branch to the 'equal' label
    BAL end    //Always branch to the 'end' label

//This label will be executed if R0 > R1
greater:        
    LSL R5, #2 //If R0 > R1, perform two logical left shift on R5.
    BAL end

//This label will be executed if R0 < R1
lesser: 
    LSR R5, #1 //If R0 < R1, perform one logical right shift on R5.
    BAL end

//This label will be executed if R0 = R1
equal:
    ROR R5, #1 //If R0 = R1, perform one right rotation on R5.

//Sequence to terminate the program
end:
    MOV R0, R5 //Move the value in R5 to R0
    MOV R7, #1 
    SWI 0
 