; Nick Luca
; CISP 310 - Assignment 4
; Prof. Al Juboori
; Date:    2/12/2025

.586
.MODEL FLAT

INCLUDE io.h     ; header file for input/output

.STACK 4096

.DATA 
Rent		DWORD ?
Utilities	DWORD ?
prompt1		BYTE  "Enter your monthly expense on rent/mortgage:", 0
prompt2		BYTE  "Enter your monthly expenses on utilities", 0
resultLbl	BYTE  "Total monthly cost of these expenses:", 0
resultLbl2	BYTE  "Total yearly cost of these expenses:", 0
string		BYTE  40 DUP (?)
outputTotal	BYTE  40 DUP (?)

.CODE
_MainProc	PROC
	input	prompt1, string, 40		; read ASCII characters
	atod	string				; convert to integer
	mov	Rent, eax			; store in memor

	input	prompt2, string, 40		; repeat for second number
	atod	string
	mov	Utilities, eax

	add	eax, Rent
	dtoa	outputTotal, eax
	output	resultLbl, outputTotal

	mov	ebx, 12
	mul	ebx				; multiply
	dtoa	outputTotal, eax		; convert to ASCII characters
	output	resultLbl2, outputTotal		; output label and total

	mov	eax, 0				; exit with return code 0
	ret
_MainProc ENDP
END						; end of source code
