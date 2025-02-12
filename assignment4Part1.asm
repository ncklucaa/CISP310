; Nick Luca
; CISP 310 - Assignment 3
; Prof. Al Juboori
; Date:    2/12/2025

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA 
numOfGallons	DWORD	?
numOfMiles		DWORD	?
prompt1			BYTE	"Enter the number of gallons of gas the car can hold:", 0
prompt2			BYTE	"Number of miles it can be driven on a full tank:",	0
resultLbl		BYTE	"Miles per gallon the car gets:", 0
string			BYTE	40 DUP (?)
mpg				BYTE	40 DUP (?)

.CODE
_MainProc	PROC
			input	prompt1, string, 40     ; read ASCII characters
			atod	string					; convert to integer
			mov		numOfGallons, eax		; store in memory

			input	prompt2, string, 40		; repeat for second number
			atod	string
			mov		numOfMiles, eax 

			mov		eax, numOfMiles			; first number to EAX
			cdq
			idiv	numOfGallons			; divide
			dtoa	mpg, eax				; convert to ASCII characters
			output	resultLbl, mpg			; output label and mpg
			mov		eax, 0					; exit with return code 0
			ret
_MainProc ENDP
END											; end of source code
