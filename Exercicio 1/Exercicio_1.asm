
_config_io:

;Exercicio_1.c,21 :: 		void config_io()
;Exercicio_1.c,23 :: 		TRISB=0X03;
	MOVLW       3
	MOVWF       TRISB+0 
;Exercicio_1.c,24 :: 		TRISC=0X00;
	CLRF        TRISC+0 
;Exercicio_1.c,25 :: 		TRISE=0x00; // Configura como Pinos de saída Digital
	CLRF        TRISE+0 
;Exercicio_1.c,26 :: 		TRISD=0x00; // Configura como Pinos de saída Digital
	CLRF        TRISD+0 
;Exercicio_1.c,27 :: 		ADCON1=0xFF; // Configura todos os pinos no módulo digital
	MOVLW       255
	MOVWF       ADCON1+0 
;Exercicio_1.c,28 :: 		PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
	BCF         PORTE+0, 1 
;Exercicio_1.c,29 :: 		PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)
	CLRF        PORTD+0 
;Exercicio_1.c,30 :: 		PORTC=0XFF;
	MOVLW       255
	MOVWF       PORTC+0 
;Exercicio_1.c,31 :: 		}
L_end_config_io:
	RETURN      0
; end of _config_io

_main:

;Exercicio_1.c,33 :: 		void main()
;Exercicio_1.c,35 :: 		config_io();
	CALL        _config_io+0, 0
;Exercicio_1.c,36 :: 		Lcd_Init(); // Inicia o LCD
	CALL        _Lcd_Init+0, 0
;Exercicio_1.c,37 :: 		Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio_1.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio_1.c,40 :: 		while(1)
L_main0:
;Exercicio_1.c,42 :: 		Lcd_Out(1,1,"Exercicio 1"); // Escreve na linha 1 coluna 1
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,43 :: 		if (S1==0 && S2==0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	BTFSC       PORTB+0, 1 
	GOTO        L_main4
L__main20:
;Exercicio_1.c,45 :: 		D1=1;
	BSF         PORTC+0, 0 
;Exercicio_1.c,46 :: 		D2=1;
	BSF         PORTC+0, 1 
;Exercicio_1.c,47 :: 		Lcd_Out(2,1,"D1=0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,48 :: 		Lcd_Out(2,7,"D2=0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,50 :: 		}
	GOTO        L_main5
L_main4:
;Exercicio_1.c,51 :: 		else if (S1==0 && S2==1)
	BTFSC       PORTB+0, 0 
	GOTO        L_main8
	BTFSS       PORTB+0, 1 
	GOTO        L_main8
L__main19:
;Exercicio_1.c,53 :: 		D1=0;
	BCF         PORTC+0, 0 
;Exercicio_1.c,54 :: 		D2=0;
	BCF         PORTC+0, 1 
;Exercicio_1.c,55 :: 		Lcd_Out(2,1,"D1=1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,56 :: 		Lcd_Out(2,7,"D2=1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,58 :: 		}
	GOTO        L_main9
L_main8:
;Exercicio_1.c,59 :: 		else if (S1==1 && S2==0)
	BTFSS       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main18:
;Exercicio_1.c,61 :: 		D1=1;
	BSF         PORTC+0, 0 
;Exercicio_1.c,62 :: 		D2=0;
	BCF         PORTC+0, 1 
;Exercicio_1.c,63 :: 		Lcd_Out(2,1,"D1=0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,64 :: 		Lcd_Out(2,7,"D2=1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,66 :: 		}
	GOTO        L_main13
L_main12:
;Exercicio_1.c,67 :: 		else if (S1==1 && S2==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main16
	BTFSS       PORTB+0, 1 
	GOTO        L_main16
L__main17:
;Exercicio_1.c,69 :: 		D1=0;
	BCF         PORTC+0, 0 
;Exercicio_1.c,70 :: 		D2=1;
	BSF         PORTC+0, 1 
;Exercicio_1.c,71 :: 		Lcd_Out(2,1,"D1=1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,72 :: 		Lcd_Out(2,7,"D2=0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Exercicio_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Exercicio_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_1.c,74 :: 		}
L_main16:
L_main13:
L_main9:
L_main5:
;Exercicio_1.c,75 :: 		}
	GOTO        L_main0
;Exercicio_1.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
