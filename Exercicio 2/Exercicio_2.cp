#line 1 "C:/Users/PEDROSO/Documents/Projetos/Programação Aplicada 2/Display LCD_EXSTO_XM119/Exercicio 2/Exercicio_2.c"
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







char sD1;
char sD2;
char sD3;

void config_io()
{
 ADCON1=0xFF;
 TRISB=0X03;
 TRISE=0x00;
 TRISD=0x00;
 TRISC=0X00;
 PORTC=0XFF;
 PORTE.RE1=0;
 PORTD=0x00;
}

void main()
{
 config_io();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 Lcd_Out(1,1,"Exercicio 2");
 Lcd_Chr(2,1,sD1);
 Lcd_Chr(2,4,sD2);
 Lcd_Chr(2,7,sD3);

 if ( PORTB.RB0 ==0 &&  PORTB.RB1 ==0)
 {
  PORTC.RC0 =1;
  PORTC.RC1 =1;
  PORTC.RC2 =1;
 sD1= '0';
 sD2= '0';
 sD3= '0';
 }
 else if ( PORTB.RB0 ==0 &&  PORTB.RB1 ==1)
 {
  PORTC.RC0 =0;
  PORTC.RC1 =1;
  PORTC.RC2 =0;
 sD1= '1';
 sD2= '0';
 sD3= '1';
 }
 else if ( PORTB.RB0 ==1 &&  PORTB.RB1 ==0)
 {
  PORTC.RC0 =1;
  PORTC.RC1 =0;
  PORTC.RC2 =1;
 sD1= '0';
 sD2= '1';
 sD3= '0';
 }
 else if ( PORTB.RB0 ==1 &&  PORTB.RB1 ==1)
 {
  PORTC.RC0 =0;
  PORTC.RC1 =0;
  PORTC.RC2 =0;
 sD1= '1';
 sD2= '1';
 sD3= '1';
 }
 }
}
