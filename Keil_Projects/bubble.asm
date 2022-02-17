ORG 0000H    ;reset
    LJMP inicio
    
    

 


ORG 0030H
    inicio:
    
    
    ACALL init_uart
    ACALL imprimir
    
    aqui:
    ACALL recibir_datos
    ACALL trans_datos
    
    AJMP aqui
    
    init_uart:
    MOV TMOD,#20H    ;Configuramos el timer1 en modo 2 con autorecarga
    MOV TH1,#0FDH    ;una velocidad de transmision de 9600 baudios
    MOV SCON,#50H    ;modo 1 de uart (8bits), un bit inicio y uno de parada
    SETB TR1
    RET
    
    recibir_datos:
    JNB RI,$
    CLR RI
    MOV A,SBUF 
    RET 
    
    
    
    
    
    trans_datos:
    MOV SBUF,A
    JNB TI,$
    CLR TI
    CJNE A,#0DH,fin
    
    fin:
    RET
    

 

    
    
    

 

    
    
    
    imprimir:
    MOV DPTR,#tabla_mensaje
    MOV R5,#28H
    cicint:
    MOV A,R5
    MOVC A,@A+DPTR
    ACALL trans_datos
    DJNZ R5,cicint
    MOV A,R5
    MOVC A,@A+DPTR
    ACALL trans_datos
    
    RET 
    
    tabla_mensaje:
    DB      0AH    ;enter
    DB      52H    ;r
    DB      41H    ;A
    DB      4eH    ;N
    DB      45H    ;E
    DB      44H    ;D
    DB      52H    ;R
    DB      4FH    ;O
    DB      20H    ;
    DB      41H    ;A
    DB      20H    ;
    DB      53H    ;S
    DB      4FH    ;O
    DB      54H    ;T
    DB      41H    ;A
    DB      44H    ;D    
    
        
END