; Nick Luca
; CISP 310 - Assignment 6
; Prof. Al Juboori
; Date: 3/10/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
numDays    DWORD 1
prompt1    BYTE "How many days have you worked from 1 to 31?", 0
string     DWORD 4 DUP (?)
resultLbl   BYTE "Pennies earned", 0
resultLbl2  BYTE "You entered less than 1 day or more than 31", 0 
outputTotal BYTE 11 DUP (?), 0
 
.CODE
_MainProc PROC

daysWorked:
    input prompt1, string, 40       ; read ASCII characters 
    atod  string                    ; convert to integer 
    mov   numDays, eax              ; store in memory         
    mov   ch, al
    cmp   numDays, 1
    jb    daysWorked
    cmp   numDays, 31
    ja    daysWorked

penniesPerDay:
    mov  eax, 1    ; first number to EAX
    shl  eax, CL
    dtoa outputTotal, eax
    output resultLbl, outputTotal
    inc  CL
    dec  ch
    cmp  ch, 0
    jne  penniesPerDay

exit:  
    ret
_MainProc ENDP 
END          ; end of source code
