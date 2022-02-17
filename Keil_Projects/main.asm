;*********************************************************************************
;********************** PROGRAMA QUE SIRVE COMO PLANTILLA ************************
;*********************************************************************************

NAME	UART_BT
	
;--------------------------------- VARIABLES -------------------------------------
CONTADOR1	EQU	0x20		;CONTADOR1 = 0x20
CONTADOR2	EQU	0x23
MS			EQU	0x22		;Milisegundos
VEL			EQU	0x21
RES			EQU 0x25		;variable de resultado
	
;-------------------------- VECTOR DE INTERRUPCIONES ----------------------------
	ORG	0x00				;A partir de la 0x00 vas a compilar lo siguiente
		AJMP	MAIN
	ORG	0x03
		AJMP	INTE0
	ORG	0x0B
		AJMP	TOV0
	ORG	0x13
		AJMP	INTE1
	ORG	0x1B
		AJMP	TOV1
	ORG	0x23
		AJMP	UART
	ORG	0x2B
		AJMP	TOV2
;-------------------------------- INICIO DE PROGRAMA -----------------------------
	ORG	0x33
		
MAIN:	MOV   	SP,#0x07	;Stack Pointer = 0x07 "inicializar la pila"
		MOV		P3,#0xFF	;Puerto 3 como entrada (P0 solo da ceros)
		MOV		P1,#0x00	;Puerto 1 como salida
		MOV		VEL,#100	;velocidad del pendulo
		
		;------------------- Puerto UART
		MOV		SCON,#01010000b ;UART modo 1, 8 bits, Timer1 en modo 2
		MOV		TMOD,#0x20		;Timer 1 en modo 2, autorecarga de 8 bits
		MOV		TH1,#250		;Baud=Xtal/(32*12*(256-TH1)) -> TH1 = 256 - Xtal*K/(32*12*Baud)
		MOV		PCON,#0x80		;SMOD=1 doble velocidad -> Baud=9600, K=2
		SETB	TR1				;activar timer 1
		SETB	ES				;mascara de interrupción del UART
		SETB	EA				;mascara general de interrupcion


LOOP:	JB		P3.2, LOOP
		MOV		SBUF,#'A'
  M2:	JNB		P3.2, M2
		
		AJMP	LOOP



;--------------------------------- INICIO DE SUBRUTINAS ---------------------------
;Retardo de MS miliseconds
DELAY:	MOV		CONTADOR2,#2 	
  D2:	MOV		CONTADOR1,#226		
  D1:	DJNZ 	CONTADOR1,D1
		NOP
		DJNZ	CONTADOR2,D2
		NOP
		DJNZ	MS,DELAY
		RET



;------------------------------ INICIO DE INTERRUPCIONES --------------------------
INTE0:	RETI
TOV0:	RETI
INTE1:	RETI
TOV1:	RETI

UART:	JNB		TI,URX	;checamos si fue Tx completa o fue Rx
		CLR		TI		;limpiar bandera de transmision completa
		RETI			;transmision completa no hacer nada
  URX:	CLR		RI 		;limpiar bandera de recepcion completa
		MOV		A,SBUF	;Dato recibido
		MOV		P1,A	;mandar dato al puerto 1
		RETI

TOV2:	RETI

	

	END