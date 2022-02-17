ORG 0000H
	inicio:
	ACALL delay
	aqui:
	AJMP aqui
	
	delay: ;2  .5 segundos                 =2
	MOV R6,#0FAH ;250d  ;1ciclo            =1
	d1: 
	MOV R7,#0F9H ;249d  ;1ciclo       1*250=250
	NOP					;1ciclo			   =250
	NOP					;1ciclo            =250
	NOP					;1ciclo            =250
	NOP					;1ciclo            =250
	NOP					;1ciclo            =250
	d2:
	NOP					;1ciclo   1*249*250=62250
	NOP					;1ciclo            =62250
	NOP					;1ciclo            =62250
	NOP					;1ciclo            =62250
	NOP					;1ciclo            =62250
	NOP					;1ciclo            =62250
	DJNZ R7,d2		;2ciclos      2*249*250=124500
	DJNZ R6,d1		;2ciclos		  2*250=500
	RET				;2cilos				   =2
										;total=500005
END