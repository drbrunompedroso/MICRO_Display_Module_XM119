
_config_io:

;Exercicio_2.c,25 :: 		void config_io()
;Exercicio_2.c,27 :: 		ADCON1=0xFF; // Configura todos os pinos no módulo digital
	MOVLW       255
	MOVWF       ADCON1+0 
;Exercicio_2.c,28 :: 		TRISB=0X03;
	MOVLW       3
	MOVWF       TRISB+0 
;Exercicio_2.c,29 :: 		TRISE=0x00;
	CLRF        TRISE+0 
;Exercicio_2.c,30 :: 		TRISD=0x00;
	CLRF        TRISD+0 
;Exercicio_2.c,31 :: 		TRISC=0X00;
	CLRF        TRISC+0 
;Exercicio_2.c,32 :: 		PORTC=0XFF;
	MOVLW       255
	MOVWF       PORTC+0 
;Exercicio_2.c,33 :: 		PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
	BCF         PORTE+0, 1 
;Exercicio_2.c,34 :: 		PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)
	CLRF        PORTD+0 
;Exercicio_2.c,35 :: 		}
L_end_config_io:
	RETURN      0
; end of _config_io

_main:

;Exercicio_2.c,37 :: 		void main()
;Exercicio_2.c,39 :: 		config_io();
	CALL        _config_io+0, 0
;Exercicio_2.c,40 :: 		Lcd_Init(); // Inicia o LCD
	CALL        _Lcd_Init+0, 0
;Exercicio_2.c,41 :: 		Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio_2.c,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio_2.c,44 :: 		while(1)
L_main0:
;Exercicio_2.c,46 :: 		Lcd_Out(1,1,"Exercicio 2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio_2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio_2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio_2.c,47 :: 		Lcd_Chr(2,1,sD1);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _sD1+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Exercicio_2.c,48 :: 		Lcd_Chr(2,4,sD2);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _sD2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Exercicio_2.c,49 :: 		Lcd_Chr(2,7,sD3);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _sD3+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Exercicio_2.c,51 :: 		if (S1==0 && S2==0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	BTFSC       PORTB+0, 1 
	GOTO        L_main4
L__main20:
;Exercicio_2.c,53 :: 		D1=1;
	BSF         PORTC+0, 0 
;Exercicio_2.c,54 :: 		D2=1;
	BSF         PORTC+0, 1 
;Exercicio_2.c,55 :: 		D3=1;
	BSF         PORTC+0, 2 
;Exercicio_2.c,56 :: 		sD1= '0';
	MOVLW       48
	MOVWF       _sD1+0 
;Exercicio_2.c,57 :: 		sD2= '0';
	MOVLW       48
	MOVWF       _sD2+0 
;Exercicio_2.c,58 :: 		sD3= '0';
	MOVLW       48
	MOVWF       _sD3+0 
;Exercicio_2.c,59 :: 		}
	GOTO        L_main5
L_main4:
;Exercicio_2.c,60 :: 		else if (S1==0 && S2==1)
	BTFSC       PORTB+0, 0 
	GOTO        L_main8
	BTFSS       PORTB+0, 1 
	GOTO        L_main8
L__main19:
;Exercicio_2.c,62 :: 		D1=0;
	BCF         PORTC+0, 0 
;Exercicio_2.c,63 :: 		D2=1;
	BSF         PORTC+0, 1 
;Exercicio_2.c,64 :: 		D3=0;
	BCF         PORTC+0, 2 
;Exercicio_2.c,65 :: 		sD1= '1';
	MOVLW       49
	MOVWF       _sD1+0 
;Exercicio_2.c,66 :: 		sD2= '0';
	MOVLW       48
	MOVWF       _sD2+0 
;Exercicio_2.c,67 :: 		sD3= '1';
	MOVLW       49
	MOVWF       _sD3+0 
;Exercicio_2.c,68 :: 		}
	GOTO        L_main9
L_main8:
;Exercicio_2.c,69 :: 		else if (S1==1 && S2==0)
	BTFSS       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main18:
;Exercicio_2.c,71 :: 		D1=1;
	BSF         PORTC+0, 0 
;Exercicio_2.c,72 :: 		D2=0;
	BCF         PORTC+0, 1 
;Exercicio_2.c,73 :: 		D3=1;
	BSF         PORTC+0, 2 
;Exercicio_2.c,74 :: 		sD1= '0';
	MOVLW       48
	MOVWF       _sD1+0 
;Exercicio_2.c,75 :: 		sD2= '1';
	MOVLW       49
	MOVWF       _sD2+0 
;Exercicio_2.c,76 :: 		sD3= '0';
	MOVLW       48
	MOVWF       _sD3+0 
;Exercicio_2.c,77 :: 		}
	GOTO        L_main13
L_main12:
;Exercicio_2.c,78 :: 		else if (S1==1 && S2==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main16
	BTFSS       PORTB+0, 1 
	GOTO        L_main16
L__main17:
;Exercicio_2.c,80 :: 		D1=0;
	BCF         PORTC+0, 0 
;Exercicio_2.c,81 :: 		D2=0;
	BCF         PORTC+0, 1 
;Exercicio_2.c,82 :: 		D3=0;
	BCF         PORTC+0, 2 
;Exercicio_2.c,83 :: 		sD1= '1';
	MOVLW       49
	MOVWF       _sD1+0 
;Exercicio_2.c,84 :: 		sD2= '1';
	MOVLW       49
	MOVWF       _sD2+0 
;Exercicio_2.c,85 :: 		sD3= '1';
	MOVLW       49
	MOVWF       _sD3+0 
;Exercicio_2.c,86 :: 		}
L_main16:
L_main13:
L_main9:
L_main5:
;Exercicio_2.c,87 :: 		}
	GOTO        L_main0
;Exercicio_2.c,88 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
