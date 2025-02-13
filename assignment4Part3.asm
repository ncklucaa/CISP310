; Nick Luca
; CISP 310 - Assignment 4
; Prof. Al Juboori
; Date:    2/13/2025

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA 
cookies		DWORD 30
servings	DWORD 10
caloriesServ	DWORD 240
caloriesCookie	DWORD ?
cookiesAte	DWORD ?
prompt1		BYTE "How many cookies have you ate:", 0
resultLbl	BYTE "Total calories:", 0
string		BYTE 40 DUP (?)
outputTotal	BYTE 40 DUP (?)

.CODE
_MainProc	PROC
	input	prompt1, string, 40		; read ASCII characters
	atod	string					; convert to integer
	mov		cookiesAte, eax			; store in memory

	mov		eax, caloriesServ		; first number to EAX
	imul	eax, servings
	mov		ebx, cookies
	cdq
	div		ebx						; divide
	mov		caloriesCookie, eax

	mov		eax, cookiesAte
	mul		caloriesCookie			; multiply
	dtoa	outputTotal, eax		; convert to ASCII characters
	output	resultLbl, outputTotal	; output label and total

	mov		eax, 0					; exit with return code 0
	ret
_MainProc ENDP
END									; end of source code
