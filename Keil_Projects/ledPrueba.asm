ORG 0000H
	inicio:
	MOV R2,#00H
	MOV P1,R2
	
	ciclo:
	JB P1.1,enciende_led
	CLR P1.0
	SJMP ciclo
	
	enciende_led:
	SETB P1.0
	SJMP ciclo
	
END