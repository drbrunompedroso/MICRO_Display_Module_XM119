/*****************************************************************************************************************************************************/
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

// Define as entradas e saídas para o LED (saída - OUT1) e Botão (B1 - entrada)
#define B1 PORTB.RB0
#define OUT1 PORTC.RC0

void main()
{
    ADCON1=0xFF; // Configura todos os pinos no módulo digital
    TRISB=0x01; // PORTB.RB0 definido como entrada de dados digitais
    TRISD=0X00; // PORTD definido como saidas de dados digitais
    TRISC=0X00; // PORTC.RC0 definido como saida de dados digitais
    TRISE=0x00; // Configura como Pinos de saída Digital
    PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
    PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)


    Lcd_Init(); // Inicia o LCD
    Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
    Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD

    while(1)
    {
     Lcd_Out(1,1,"Exercicio 3");

        if(B1==1)
          {
              OUT1=1;
              Lcd_Chr(2,1,'0');
              Delay_ms(1000);
              OUT1=0;
              Lcd_Chr(2,1,'1');
              Delay_ms(1000);
          }
        else
          {
              OUT1=1;
              Lcd_Chr(2,1,'0');
          }
    }
}