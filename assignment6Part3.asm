; Nick Luca
; CISP 310 - Assignment 6
; Prof. Al Juboori
; Date: 3/8/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
calsBurnPerMin DWORD 4
calsBurned DWORD 4 DUP (?), 0
mins DWORD 5 
string DWORD 4 DUP (?)
resultLbl BYTE "cals burned after 5+ mins", 0

.CODE
_MainProc PROC

while1:
	cmp mins, 30
	jnle exit
	mov eax, mins
	mul calsBurnPerMin
	dtoa calsBurned, eax
	output resultLbl, calsBurned
	add mins, 5
	jmp while1

exit:
	mov eax, 0
	ret
_MainProc ENDP 
END          ; end of source code
