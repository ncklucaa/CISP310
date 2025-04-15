; Nick Luca
; CISP 310 - Assignment 8
; Prof. Al Juboori
; Date: 4/14/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
num1 DWORD ?
cnt DWORD 0
array WORD 10 DUP (?)
prompt1 BYTE "enter the test score: ", 0
resultLbl BYTE "total perfect scores = ", 0
invalidInput BYTE "enter numbers only between 0 and 100", 0
string BYTE 40 DUP (?)

.CODE
_MainProc PROC

mov ecx, 0
lea ebx, array
jmp forLoopStart

invalidData:
	output invalidInput, invalidInput

forLoopStart:
	input prompt1, string, 40
	atod string
	mov num1, eax
	jmp validInput

validInput:
	cmp num1, 100
	je perfectScore
	cmp num1, 0
	jl invalidData
	cmp num1, 100
	jg invalidData
	jmp increment

perfectScore:
	inc cnt
	jmp increment

increment:  
	mov ebx, num1
	add ebx, 2
	jmp forLoopEnd

forLoopEnd:
	inc ecx
	cmp ecx, 10
	jne forLoopStart
	jmp exit

exit:
	mov eax, cnt
	dtoa cnt, eax
	output resultLbl, cnt
	mov eax, 0
	ret
_MainProc ENDP
END          ; end of source code
