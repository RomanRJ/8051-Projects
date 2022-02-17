ORG   0000H    
           SETB P1.0                   ;Set Port Bit 0 of P1 to HIGH
BACK: ACALL DELAY               ;WAIT 0.125 Second
           ACALL DELAY              ;WAIT 0.125 Second    
  
           CPL P1.0                    ;Complement Bit 0 of Port 1,High-to-Low
           SJMP BACK                 ;Make This Operation to Run Repeatedly
      
DELAY:MOV R0,#250              ;Initialize the R0 Register With an Immediate Value 250 
NEXT: MOV R1,#250               ;Load R0 With 250 Value to Repeat the Loop for 250 Times

AGAIN:DJNZ R1,AGAIN           ;Internal Loop Repeates 250 Times
            DJNZ R0,NEXT            ;External Loop Repeates 250 Times
            RET                            ;Return to Caller
            END                           ;End of .asm File