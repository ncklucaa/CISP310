; Nick Luca
; CISP 310 - Assignment 3
; Prof. Al Juboori
; Date:    2/8/2025

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA 
studentName BYTE    40 DUP (?)
degreeName  BYTE    40 DUP (?)
number1  DWORD   ?
number2  DWORD   ?    
prompt1  BYTE    "Enter the name of the student:", 0
prompt2  BYTE    "Enter the name of the degree:", 0
prompt3  BYTE    "Enter number of credits the student has taken:", 0
prompt4  BYTE    "Enter the total credits required for the degree:", 0
resultLbl  BYTE  "Credits needed to graduate: ", 0
string   BYTE    40 DUP (?)
sum      BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, studentName, 40  

        input   prompt2, degreeName, 40  

        input   prompt3, string, 40     ; read ASCII characters
        atod    string           ; convert to integer
        mov     number1, eax     ; store in memory

        input   prompt4, string, 40     ; repeat for second number
        atod    string
        mov     number2, eax 

        mov     eax, number2        ; first number to EAX
        sub     eax, number1        ; subtract second number
        dtoa    sum, eax            ; convert to ASCII characters
        output  resultLbl, sum      ; output label and sum

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                     ; end of source code