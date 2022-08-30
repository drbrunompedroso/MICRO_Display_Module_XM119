#line 1 "C:/Users/PEDROSO/Documents/Projetos/Programação Aplicada 2/Display LCD_EXSTO_XM119/Exercicio 3/IO_Digital.c"

sbit lcd_rs at RE0_bit;
sbit lcd_en at RE2_bit;
sbit lcd_d7 at RD7_bit;
sbit lcd_d6 at RD6_bit;
sbit lcd_d5 at RD5_bit;
sbit lcd_d4 at RD4_bit;

sbit lcd_rs_direction at TRISE0_bit;
sbit lcd_en_direction at TRISE2_bit;
sbit lcd_d7_direction at TRISD7_bit;
sbit lcd_d6_direction at TRISD6_bit;
sbit lcd_d5_direction at TRISD5_bit;
sbit lcd_d4_direction at TRISD4_bit;





void main()
{
 ADCON1=0xFF;
 TRISB=0x01;
 TRISD=0X00;
 TRISC=0X00;
 TRISE=0x00;
 PORTE.RE1=0;
 PORTD=0x00;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 Lcd_Out(1,1,"Exercicio 3");

 if( PORTB.RB0 ==1)
 {
  PORTC.RC0 =1;
 Lcd_Chr(2,1,'0');
 Delay_ms(1000);
  PORTC.RC0 =0;
 Lcd_Chr(2,1,'1');
 Delay_ms(1000);
 }
 else
 {
  PORTC.RC0 =1;
 Lcd_Chr(2,1,'0');
 }
 }
}
