ORG 0000H
		SETB P1.0 
	reg:
		ACALL delay
	ACALL delay  
	
	
    CPL P1.0          
    SJMP reg   
	
	delay: ;2  				                   =2
		
		MOV R6,#1F4H ;500d  ;1ciclo            =1
	d1: 
		MOV R7,#1F3H ;499d  ;1ciclo       1*500=500
		NOP					;1ciclo			   =500
		NOP					;1ciclo			   =500
		NOP					;1ciclo			   =500
		NOP					;1ciclo			   =500
		NOP					;1ciclo			   =500
	d2:
		NOP					;1ciclo   1*499*500=249500
		NOP					;1ciclo            =249500
		NOP					;1ciclo            =249500
		NOP					;1ciclo            =249500
		NOP					;1ciclo            =249500
		NOP					;1ciclo            =249500
		DJNZ R7,d2		;2ciclos      2*499*500=499000
		DJNZ R6,d1		;2ciclos		  2*500=1000
		RET				;2cilos				   =2
										;total=2000005 1seg encendido y 1 seg apagado 
END