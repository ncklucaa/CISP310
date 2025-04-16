; Nick Luca
; CISP 310 - Assignment 8
; Prof. Al Juboori
; Date: 4/15/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
elts DWORD ?
cnt DWORD 0
minValue DWORD ?
num1 DWORD ?
array DWORD 100 DUP (?)
prompt1 BYTE "enter the array size", 0
prompt2 BYTE "what is n?", 0
enterNum BYTE "enter a number", 0
resultLbl BYTE "numbers > n", 0
string BYTE 40 DUP (?)

.CODE
_MainProc PROC

input prompt1, string, 40
atod string
mov elts, eax

input prompt2, string, 40
atod string
mov minValue, eax

lea esi, array
mov ecx, 0

startWhileLoop:
	input enterNum, string, 40
	atod string

	cmp eax, minValue
	jg increment
	jmp endWhileLoop

increment:
	mov [esi], eax
	add esi, 4
	inc cnt

endWhileLoop:
	inc ecx
	cmp ecx, elts
	jne startWhileLoop

	lea esi, array
	mov ecx, cnt

	jmp show

show:
	mov eax, [esi]
	dtoa num1, eax
	output resultLbl, num1
	add esi, 4
	loop show

exit:
	mov eax, 0
	ret
_MainProc ENDP
END          ; end of source code
