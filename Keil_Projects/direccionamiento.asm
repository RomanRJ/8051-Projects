ORG 0000H
	inicio:
	;aqui inicia el codigo
	MOV 40H,#55H
	MOV 41H,#55H
	
	;direccionamiento inmediato
	MOV A,#12d
	MOV R1,#11110010b
	MOV B,#14H
	
	;direccionamiento por registro
	MOV A,R1
	
	;direccionamiento directo
	MOV P1,A
	MOV P0,#88H
	
	;direccionamineto indirecto
	MOV R0,#40H
	MOV A,@R0
	
	;direccionamiento indexado
	;pendiente
	
	;direccionamiento relativo
	;SJMP inicio
	
	;direccionamiento absoluto
	ACALL ejemplo
	AJMP inicio
	
	ejemplo: 
	MOV R6,#45H
	RET
END