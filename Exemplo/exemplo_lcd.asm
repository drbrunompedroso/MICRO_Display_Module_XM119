
_main:

;exemplo_lcd.c,16 :: 		void main()
;exemplo_lcd.c,18 :: 		ADCON1=0x0F; // Configura todos os pinos no módulo digital
	MOVLW       15
	MOVWF       ADCON1+0 
;exemplo_lcd.c,19 :: 		TRISE=0x00; // Configura como Pinos de saída Digital
	CLRF        TRISE+0 
;exemplo_lcd.c,20 :: 		TRISD=0x00; // Configura como Pinos de saída Digital
	CLRF        TRISD+0 
;exemplo_lcd.c,21 :: 		PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
	BCF         PORTE+0, 1 
;exemplo_lcd.c,22 :: 		PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)
	CLRF        PORTD+0 
;exemplo_lcd.c,24 :: 		Lcd_Init(); // Inicia o LCD
	CALL        _Lcd_Init+0, 0
;exemplo_lcd.c,25 :: 		Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exemplo_lcd.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exemplo_lcd.c,27 :: 		while(1)
L_main0:
;exemplo_lcd.c,29 :: 		Lcd_Out(1,1,sText); // Envia para 1º linha e coluna o texto contido na variavel sText
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _sText+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_sText+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exemplo_lcd.c,30 :: 		Lcd_Out(2,1,"Programa LCD"); // Escreve na linha 2 coluna 1 "Programa LCD"
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_exemplo_lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_exemplo_lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exemplo_lcd.c,31 :: 		}// fim while
	GOTO        L_main0
;exemplo_lcd.c,32 :: 		}// fim main
L_end_main:
	GOTO        $+0
; end of _main
