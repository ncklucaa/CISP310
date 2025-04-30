; Nick Luca
; CISP 310 - Assignment 10
; Prof. Al Juboori
; Date: 4/29/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
string1 BYTE 100 DUP (?)
string2 BYTE 100 DUP (?)
outputString BYTE 100 DUP (?)
prompt1 BYTE "enter first string", 0
prompt2 BYTE "enter second string", 0
resultLbl BYTE "concatenate the two strings", 0

.CODE
_MainProc PROC

	input prompt1, string1, 100
	input prompt2, string2, 100
	lea esi, string1
	lea edi, outputString
	push esi
	push edi
	cld

startWhileLoop:
	cmp BYTE PTR [esi], 0
	je endWhileLoop
	movsb
	loop startWhileLoop

endWhileLoop:
	lea esi, string2

startWhileLoop2:
	cmp BYTE PTR [esi], 0
	je endWhileLoop2
	movsb
	loop startWhileLoop2
	movsb
	loop startWhileLoop2

endWhileLoop2:
	mov BYTE PTR [edi], 0
	pop esi
	pop edi
	output resultLbl, outputString

	ret
_MainProc ENDP
END          ; end of source code
