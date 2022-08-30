
_main:

;IO_Digital.c,20 :: 		void main()
;IO_Digital.c,22 :: 		ADCON1=0xFF; // Configura todos os pinos no módulo digital
	MOVLW       255
	MOVWF       ADCON1+0 
;IO_Digital.c,23 :: 		TRISB=0x01; // PORTB.RB0 definido como entrada de dados digitais
	MOVLW       1
	MOVWF       TRISB+0 
;IO_Digital.c,24 :: 		TRISD=0X00; // PORTD definido como saidas de dados digitais
	CLRF        TRISD+0 
;IO_Digital.c,25 :: 		TRISC=0X00; // PORTC.RC0 definido como saida de dados digitais
	CLRF        TRISC+0 
;IO_Digital.c,26 :: 		TRISE=0x00; // Configura como Pinos de saída Digital
	CLRF        TRISE+0 
;IO_Digital.c,27 :: 		PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
	BCF         PORTE+0, 1 
;IO_Digital.c,28 :: 		PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)
	CLRF        PORTD+0 
;IO_Digital.c,31 :: 		Lcd_Init(); // Inicia o LCD
	CALL        _Lcd_Init+0, 0
;IO_Digital.c,32 :: 		Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IO_Digital.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;IO_Digital.c,35 :: 		while(1)
L_main0:
;IO_Digital.c,37 :: 		Lcd_Out(1,1,"Exercicio 3");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_IO_Digital+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_IO_Digital+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;IO_Digital.c,39 :: 		if(B1==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
;IO_Digital.c,41 :: 		OUT1=1;
	BSF         PORTC+0, 0 
;IO_Digital.c,42 :: 		Lcd_Chr(2,1,'0');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;IO_Digital.c,43 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;IO_Digital.c,44 :: 		OUT1=0;
	BCF         PORTC+0, 0 
;IO_Digital.c,45 :: 		Lcd_Chr(2,1,'1');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;IO_Digital.c,46 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;IO_Digital.c,47 :: 		}
	GOTO        L_main5
L_main2:
;IO_Digital.c,50 :: 		OUT1=1;
	BSF         PORTC+0, 0 
;IO_Digital.c,51 :: 		Lcd_Chr(2,1,'0');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;IO_Digital.c,52 :: 		}
L_main5:
;IO_Digital.c,53 :: 		}
	GOTO        L_main0
;IO_Digital.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
