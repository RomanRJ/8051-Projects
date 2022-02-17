;Román Guadalupe De León Vázquez
;Oscar Alonso Flores Fernández
;No pudimos usar bien las interrupciones y el imprimir los datos en LCD
;Asi que solo tenemos la funcion de cronometro y reloj por separado 
	ca equ 30H
	cb equ 31H
	cc equ 32H
	cd equ 33H
	enc equ P3.7

ORG 0000H
	inicio:
	mov ca,#01H
	mov cb,#02H
	mov cc,#00H
	mov cd,#00H
	acall mostrar
	
	crono:
		;jb enc,crono
		
		inc cd
		acall mostrar
		acall delay 
		acall delay 
		mov R7,cd
		cjne R7,#9d,crono
		mov cd, #0
		inc cc
		acall mostrar
		acall delay 
		acall delay 
		mov R7,cc
		cjne R7,#5d,crono
		mov cc,#0
		inc cb
		acall mostrar
		acall delay 
		acall delay 
		mov R7,cb
		cjne R7,#9d,crono
		mov cb,#0
		inc ca
		acall mostrar
		acall delay 
		acall delay 
		mov R7,ca
		cjne R7,#2d,crono
		mov ca,#0
		ajmp $;limite
			
	mostrar:
		mov dptr,#tabla
		mov a,ca
		movc a,@a+dptr
		cpl a
		mov P0,a
		mov a,cb
		movc a,@a+dptr
		cpl a
		mov P1,a
		mov a,cc
		movc a,@a+dptr
		cpl a
		mov P3,a
		mov a,cd
		movc a,@a+dptr
		cpl a
		mov P2,a
		ret
		
	tabla:
	DB 3FH ;0
	DB 06H ;1
	DB 5BH ;2
	DB 4FH ;3
	DB 66H ;4
	DB 6DH ;5
	DB 7DH ;6
	DB 07H ;7
	DB 7FH ;8
	DB 6FH ;9
	ret
	
	delay: ;  30 segundos                 =2
	MOV R6,#0FFH ;255d  ;1ciclo            =1
	d1: 
	MOV R7,#0FEH ;254d  ;1ciclo       1*3162=3162
	d2:
	MOV R5,#088H
	NOP					;1ciclo   1*3161*3162=9,995,082
	d3:
	NOP
	DJNZ R5,d3
	DJNZ R7,d2		;2ciclos      2*3161*3162=19,990,164
	DJNZ R6,d1		;2ciclos		  2*3162=6324
	RET				;2cilos				   =2
										;total=30,001,061
END