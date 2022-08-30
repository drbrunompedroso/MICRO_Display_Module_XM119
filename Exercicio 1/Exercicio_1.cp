#line 1 "C:/Users/Bruno Medina Pedroso/Documents/Projetos/Programação Aplicada 2/Display LCD_EXSTO_XM119/Exercicio 1/Exercicio_1.c"
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







void config_io()
{
 TRISB=0X03;
 TRISC=0X00;
 TRISE=0x00;
 TRISD=0x00;
 ADCON1=0xFF;
 PORTE.RE1=0;
 PORTD=0x00;
 PORTC=0XFF;
}

void main()
{
 config_io();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 Lcd_Out(1,1,"Exercicio 1");
 if ( PORTB.RB0 ==0 &&  PORTB.RB1 ==0)
 {
  PORTC.RC0 =1;
  PORTC.RC1 =1;
 Lcd_Out(2,1,"D1=0");
 Lcd_Out(2,7,"D2=0");

 }
 else if ( PORTB.RB0 ==0 &&  PORTB.RB1 ==1)
 {
  PORTC.RC0 =0;
  PORTC.RC1 =0;
 Lcd_Out(2,1,"D1=1");
 Lcd_Out(2,7,"D2=1");

 }
 else if ( PORTB.RB0 ==1 &&  PORTB.RB1 ==0)
 {
  PORTC.RC0 =1;
  PORTC.RC1 =0;
 Lcd_Out(2,1,"D1=0");
 Lcd_Out(2,7,"D2=1");

 }
 else if ( PORTB.RB0 ==1 &&  PORTB.RB1 ==1)
 {
  PORTC.RC0 =0;
  PORTC.RC1 =1;
 Lcd_Out(2,1,"D1=1");
 Lcd_Out(2,7,"D2=0");

 }
 }
}
