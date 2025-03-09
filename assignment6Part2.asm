; Nick Luca
; CISP 310 - Assignment 6
; Prof. Al Juboori
; Date: 3/10/2025
 
.586 
.MODEL FLAT 
 
INCLUDE io.h       ; header file for input/output 
 
.STACK 4096 
 
.DATA
userWeight DWORD ?
weightMonth1 DWORD 4
weightMonth2 DWORD 8
weightMonth3 DWORD 12
weightMonth4 DWORD 16
weightMonth5 DWORD 20
weightMonth6 DWORD 24
prompt1 BYTE "enter your weight", 0
string DWORD 4 DUP (?)
resultLbl BYTE "weight month 1", 0
resultLbl2 BYTE "weight month 2", 0
resultLbl3 BYTE "weight month 3", 0
resultLbl4 BYTE "weight month 4", 0
resultLbl5 BYTE "weight month 5", 0
resultLbl6 BYTE "weight month 6", 0
totalMonth1 BYTE 11 DUP (?), 0
totalMonth2 BYTE 11 DUP (?), 0
totalMonth3 BYTE 11 DUP (?), 0
totalMonth4 BYTE 11 DUP (?), 0
totalMonth5 BYTE 11 DUP (?), 0
totalMonth6 BYTE 11 DUP (?), 0

.CODE
_MainProc PROC

	input prompt1, string, 40
	atod string
	mov userWeight, eax
	
	mov eax, userWeight
	sub eax, weightMonth1
	dtoa totalMonth1, eax
	output resultLbl, totalMonth1

	mov eax, userWeight
	sub eax, weightMonth2
	dtoa totalMonth2, eax
	output resultLbl2, totalMonth2

	mov eax, userWeight
	sub eax, weightMonth3
	dtoa totalMonth3, eax
	output resultLbl3, totalMonth3

	mov eax, userWeight
	sub eax, weightMonth4
	dtoa totalMonth4, eax
	output resultLbl4, totalMonth4

	mov eax, userWeight
	sub eax, weightMonth5
	dtoa totalMonth5, eax
	output resultLbl5, totalMonth5

	mov eax, userWeight
	sub eax, weightMonth6
	dtoa totalMonth6, eax
	output resultLbl6, totalMonth6

	mov eax, 0
	ret
_MainProc ENDP 
END          ; end of source code
