rs         equ P1.0
rw         equ P1.1
en         equ P1.2
datos    equ P0
ORG 0000H
	
	inicio:
	MOV P2,#0FFH
	CLR P2.0
	JB P2.4,B1
	MOV A,#31H
	ACALL MOVIMIENTO
B1:
	JB P2.5,B2
	MOV A,#32H
	ACALL MOVIMIENTO
B2:
	JB P2.6,B3
	MOV A,#33H
	ACALL MOVIMIENTO
B3:
	JB P2.7,B4
	MOV A,#41H
	ACALL MOVIMIENTO
B4:
	SETB P2.0
	CLR P2.1
	JB P2.4,B5
	MOV A,#34H
	ACALL MOVIMIENTO	
B5:
	JB P2.5,B6
	MOV A,#35H
	ACALL MOVIMIENTO
B6:
	JB P2.6,B7
	MOV A,#36H
	ACALL MOVIMIENTO
B7:
	JB P2.7,B8
	MOV A,#42H
	ACALL MOVIMIENTO
B8:
	SETB P2.1
	CLR P2.2
	JB P2.4,B9
	MOV A,#37H
	ACALL MOVIMIENTO
B9:
	JB P2.5,B10
	MOV A,#38H
	ACALL MOVIMIENTO
B10:
	JB P2.6,B11
	MOV A,#39H
	ACALL MOVIMIENTO
B11:
	JB P2.7,B12
	MOV A,#43H
	ACALL MOVIMIENTO
B12:
	SETB P2.2
	CLR P2.3
	JB P2.4,B13
	MOV A,#46H
	ACALL MOVIMIENTO
B13:
	JB P2.5,B14
	MOV A,#30H
	ACALL MOVIMIENTO
B14:
	JB P2.6,B15
	MOV A,#45H
	ACALL MOVIMIENTO
B15:
	JB P2.7,inicio
	MOV A,#44H
	ACALL MOVIMIENTO
	LJMP inicio
MOVIMIENTO:
	ACALL main
	
RET






    main:
	MOV B,A
    ACALL iniciar_lcd
   
    mostrar_lcd:
   
    ;Regreso a casa
	
    ACALL en_h
    MOV A,#02H
    MOV datos,A
    ACALL en_l
   
    ACALL en_h
    ACALL rs_h
    MOV A,B
    MOV datos,A
    ACALL en_l
	
    ACALL inicio
   
   
   
   
   
    iniciar_lcd:
    ACALL rw_l
    ACALL rs_l
   
    ;comienza la configuración de encendido de lcd
   
    ACALL en_h
    MOV A,#38H
    MOV datos,A
    ACALL en_l
   
    ACALL en_h
    MOV A,#38H
    MOV datos,A
    ACALL en_l
   
    ACALL en_h
    MOV A,#38H
    MOV datos,A
    ACALL en_l
   
    ACALL en_h
    MOV A,#38H
    MOV datos,A
    ACALL en_l
   
    ;Para apagar la pantalla
   
    ACALL en_h
    MOV A,#08H
    MOV datos,A
    ACALL en_l
   
    ;Limpiar pantalla
   
    ACALL en_h
    MOV A,#01H
    MOV datos,A
    ACALL en_l
   
    ;Modo de entrada
   
    ACALL en_h
    MOV A,#06H
    MOV datos,A
    ACALL en_l
   
    ;Encender pantalla
   
    ACALL en_h
    MOV A,#0FH
    MOV datos,A
    ACALL en_l
   
    RET
   
   
   
    en_l:
    CLR en
    ACALL delay
    RET
   
    en_h:
    SETB en
    ACALL delay
    RET
   
    rs_l:
    CLR rs
    ACALL delay
    RET
   
    rs_h:
    SETB rs
    ACALL delay
    RET
   
    rw_l:
    CLR rw
    ACALL delay
    RET
   
    rw_h:
    SETB en
    ACALL delay
    RET
   
   
    delay:
    MOV R6,#65H        ;1
    d1:
    MOV R7,#49H        ;101
    d2:
    DJNZ R7,d2        ;2*101*73
    DJNZ R6,d1        ;2*101
    RET                ;2
   
END