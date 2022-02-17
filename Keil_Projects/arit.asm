ORG 0000H
	inicio:
	MOV A,#63H
	MOV R3,#23H
	
	ADD A,R3
	
	MOV A,#55H
	MOV B,#22H
	
	MUL AB
	aqui:
	SJMP aqui


END