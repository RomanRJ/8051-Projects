ORG 0000H
    
    MOV DPTR,#TABLA
    MOV A,#0FFH
    MOV P0,#0FFH
    
inicio:
    MOV P2,#0FFH
    CLR P2.0
    JB P2.4,B1
    MOV A,#1H
    ACALL MOVIMIENTO
    
B1:
    JB P2.5,B2
    MOV A,#2H
    ACALL MOVIMIENTO
    
B2:
    JB P2.6,B3    
    MOV A,#3H
    ACALL MOVIMIENTO
    
B3:
    JB P2.7,B4
    MOV A,#0AH
    ACALL MOVIMIENTO
    
B4:
    SETB P2.0
    CLR P2.1
    JB P2.4,B5
    MOV A,#4H
    ACALL MOVIMIENTO
    
B5:
    JB P2.5,B6
    MOV A,#5H
    ACALL MOVIMIENTO
    
B6:
    JB P2.6,B7
    MOV A,#6H
    ACALL MOVIMIENTO
    
B7:
    JB P2.7,B8
    MOV A,#0BH
    ACALL MOVIMIENTO
    
B8:
    SETB P2.1
    CLR P2.2
    JB P2.4,B9
    MOV A,#7H
    ACALL MOVIMIENTO
    
B9:
    JB P2.5,B10
    MOV A,#8H
    ACALL MOVIMIENTO
    
B10:
    JB P2.6,B11
    MOV A,#9H
    ACALL MOVIMIENTO
    
B11:
    JB P2.7,B12
    MOV A,#0CH
    ACALL MOVIMIENTO
    
B12:
    SETB P2.2
    CLR P2.3
    JB P2.4,B13
    MOV A,#0FH
    ACALL MOVIMIENTO
    
B13:
    JB P2.5,B14
    MOV A,#0H
    ACALL MOVIMIENTO
    
B14:
    JB P2.6,B15
    MOV A,#0EH
    ACALL MOVIMIENTO
    
B15:
    JB P2.7,inicio
    MOV A,#0DH
    ACALL MOVIMIENTO
    LJMP inicio
    
MOVIMIENTO:
    MOVC A,@A+DPTR
    MOV P0,A
    
    RET
TABLA:
    DB 40H ;0
    DB 79H ;1    
    DB 24H ;2
    DB 30H ;3
    DB 19H ;4
    DB 12H ;5
    DB 02H ;6
    DB 78H ;7
    DB 00H ;8
    DB 18H ;9
    DB 08H ;A
    DB 03H ;B
    DB 46H ;C
    DB 21H ;D
    DB 06H ;E
    DB 0EH ;F

 

       END