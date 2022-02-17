leds equ P0
ORG 0000H
	inicio:
		MOV A,#01H
	ida:
		MOV leds,A
		ACALL delay;
		salto1:
		CJNE A,#80H,izquierda ;si A!=0 va a la izquierda
		JMP salto2
	regreso:
		MOV leds,A
		ACALL delay;
		salto2:
		CJNE A,#01H,derecha;
		JMP salto1
	derecha:
		RR A
		AJMP regreso
	izquierda:
		RL A
		AJMP ida
	delay: ; =2
		MOV R6,#0FAH ;250 =1
	d1:
	MOV R7,#0F9H ;249 1*250=250
	NOP ; =250

	d2:
	NOP ;1 1*249*250=62250
	NOP ; =62250
	
	DJNZ R7,d2 ; 2*249*250 = 124500
	DJNZ R6,d1 ; 2*250 = 500
	RET ; =2
						; total=250,002
END
