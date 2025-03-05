; Nick Luca 
; CISP 310 - Assignment 5 
; Prof. Al Juboori 
; Date:    3/4/2025 
 
.586 
.MODEL FLAT 
 
INCLUDE io.h            ; header file for input/output 
 
.STACK 4096 
 
.DATA 
year DWORD ? 
num1 DWORD 100 
num2 DWORD 400 
num3 DWORD 4 
prompt1 BYTE "enter a year", 0 
string DWORD 4 DUP (?) 
resultLbl BYTE "this is a leap year february has 29 days", 0 
resultLbl2 BYTE "this is not a leap year february has 28 days", 0 
outputTotal  DWORD 4 DUP (?), 0 
 
.CODE 
_MainProc PROC 
 input prompt1, string, 40  ; read ASCII characters 
 atod string     ; convert to integer 
 mov  year, eax    ; store in memory 
 
 cdq 
 mov  eax, year    ; first number to EAX 
 mov  ebx, num1 
 idiv ebx 
 cmp  edx, 0 
 jz  divisibleBy100 
 jnz  notDivisibleBy100 
 jp  exit 
 
 divisibleBy100:  
  cdq 
  mov  eax, year 
  mov  ebx, num2 
  idiv ebx 
  cmp  edx, 0 
  jz  leapYear 
  jnz  notALeapYear 
 
 notDivisibleBy100:  
  cdq 
  mov  eax, year 
  mov  ebx, num3 
  idiv ebx 
  cmp  edx, 0 
  jz  leapYear 
  jnz  notALeapYear 
 
 leapYear:  
  output resultLbl, outputTotal 
  jmp exit 
 
 notALeapYear:  
  output resultLbl2, outputTotal 
 
 exit:  
  mov eax, 0 
  ret 
_MainProc ENDP 
END         ; end of source code