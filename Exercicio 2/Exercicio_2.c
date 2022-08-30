sbit lcd_rs at RE0_bit;
sbit lcd_en at RE2_bit;
sbit lcd_d7 at RD7_bit;
sbit lcd_d6 at RD6_bit;
sbit lcd_d5 at RD5_bit;
sbit lcd_d4 at RD4_bit;
//LCD: direcionamento dos pinos
sbit lcd_rs_direction at TRISE0_bit;
sbit lcd_en_direction at TRISE2_bit;
sbit lcd_d7_direction at TRISD7_bit;
sbit lcd_d6_direction at TRISD6_bit;
sbit lcd_d5_direction at TRISD5_bit;
sbit lcd_d4_direction at TRISD4_bit;

#define S1 PORTB.RB0
#define S2 PORTB.RB1
#define D1 PORTC.RC0
#define D2 PORTC.RC1
#define D3 PORTC.RC2

char sD1;
char sD2;
char sD3;

void config_io()
{
 ADCON1=0xFF; // Configura todos os pinos no módulo digital
 TRISB=0X03;
 TRISE=0x00;
 TRISD=0x00;
 TRISC=0X00;
 PORTC=0XFF;
 PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
 PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)
}

void main()
{
     config_io();
     Lcd_Init(); // Inicia o LCD
     Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
     Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD

     while(1)
     {
              Lcd_Out(1,1,"Exercicio 2");
              Lcd_Chr(2,1,sD1);
              Lcd_Chr(2,4,sD2);
              Lcd_Chr(2,7,sD3);
              
             if (S1==0 && S2==0)
             {
                D1=1;
                D2=1;
                D3=1;
                sD1= '0';
                sD2= '0';
                sD3= '0';
             }
             else if (S1==0 && S2==1)
             {
                D1=0;
                D2=1;
                D3=0;
                sD1= '1';
                sD2= '0';
                sD3= '1';
             }
             else if (S1==1 && S2==0)
             {
                D1=1;
                D2=0;
                D3=1;
                sD1= '0';
                sD2= '1';
                sD3= '0';
             }
             else if (S1==1 && S2==1)
             {
                D1=0;
                D2=0;
                D3=0;
                sD1= '1';
                sD2= '1';
                sD3= '1';
             }
     }
}