; Nick Luca
; CISP 310 - Assignment 7
; Prof. Al Juboori
; Date: 4/7/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
num1 DWORD ?
num2 DWORD ?
prompt1 BYTE "enter first number", 0
prompt2 BYTE "enter second number", 0
prompt3 BYTE "enter math operator (+, -, *, /)", 0
string DWORD 4 DUP (?)
resultLbl BYTE "result =", 0
total BYTE 11 DUP (?), 0

.CODE
_MainProc PROC

	userInput:
		input prompt3, string, 40
		cmp string, '+'
		je addition
		cmp string, '-'
		je subtraction
		cmp string, '*'
		je multiply
		cmp string, '/'
		je divide
		cmp string, 'e'
		je exit

		jmp userInput

	addition:
		input prompt1, string, 40
		atod string
		mov num1, eax
		input prompt2, string, 40
		atod string
		mov num2, eax
		mov eax, num1
		add eax, num2
		dtoa total, eax
		output resultLbl, total

		jmp userInput

	subtraction:
		input prompt1, string, 40
		atod string
		mov num1, eax
		input prompt2, string, 40
		atod string
		mov num2, eax
		mov eax, num1
		sub eax, num2
		dtoa total, eax
		output resultLbl, total

		jmp userInput

	multiply:
		input prompt1, string, 40
		atod string
		mov num1, eax
		input prompt2, string, 40
		atod string
		mov num2, eax
		mov eax, num1
		mul num2
		dtoa total, eax
		output resultLbl, total

		jmp userInput

	divide:
		input prompt1, string, 40
		atod string
		mov num1, eax
		input prompt2, string, 40
		atod string
		mov num2, eax
		cdq
		mov eax, num1
		mov ebx, num2
		idiv ebx
		dtoa total, eax
		output resultLbl, total

		jmp userInput

	exit:
		mov eax, 0
		ret
_MainProc ENDP 
END          ; end of source code
