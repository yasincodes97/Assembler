
#MACRO SECTION
.equ	UART0, 0x860
.equ	UART1, 0x880


## DATA SECTION
	
	.data

CHAR:	.ascii "_"
TEXT:	.ascii "Hallo World"	#Null symbol bzw. 0000 0000 ist in jeden leeren/unverwendete byte vorhanden
	.byte 	0
	

### TEXT SECTION #######################################
	.end #end vom var
	.global main		
	.text #anfang vom code
main:	

	
	
	call	sendString0				#KEY3 wird ausgelsesen um festzustellen ob resettet werden soll

	#movia r4, CHAR
	#ldb r4, (r4)
	#call	sendChar0	
	
	
	br endLoop					#springt am ende des programms
	
	
sendChar0:	

	#movia r10,CHAR
	#ldb r9, (r10)	
	
	
	mov r8, r4
	
	movi r9, 4
	
	stb r8, UART0(r9)
	
	
BACK_Char:

	movi r8, 8

	ldb r9, UART0(r8)
	cmpgei r9, r9,64
	beq r9, r0, BACK_Char
	
	ret
	
	
	
sendString0:
	
	movia r10,TEXT
	#movia r10,0
BACK:

	movi r8, 8

	ldb r9, (r10)
	
	beq r9,r0, SKIP
	
	
	mov r4, r9
	call	sendChar0
	
	addi r10,r10,1
	br BACK
	
SKIP:
	
	ret
	
	
	
endLoop:

	br endLoop
	
	#wirte_LED nicht in main methode damit nur aktualisiert wird sobald eine taste gedr?ckt wurde
	.end #ende vom code
	
	

	

	
