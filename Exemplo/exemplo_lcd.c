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

unsigned char sText[10]={"Teste"}; // cria uma string com texto "Teste"
void main()
{
    ADCON1=0x0F; // Configura todos os pinos no módulo digital
    TRISE=0x00; // Configura como Pinos de saída Digital
    TRISD=0x00; // Configura como Pinos de saída Digital
    PORTE.RE1=0; // Seleciona como '0' o pino RE1 (R/W do display de lCD)
    PORTD=0x00; // Seleciona como '0' os pinos D0, D1, D2 E D3 para limpar o PORTD (pinos do display de LCD)

    Lcd_Init(); // Inicia o LCD
    Lcd_Cmd(_LCD_CLEAR); // Limpa o Display de LCD
    Lcd_Cmd(_LCD_CURSOR_OFF); // Desliga o cursor do LCD
    while(1)
    {
        Lcd_Out(1,1,sText); // Envia para 1º linha e coluna o texto contido na variavel sText
        Lcd_Out(2,1,"Programa LCD"); // Escreve na linha 2 coluna 1 "Programa LCD"
    }// fim while
}// fim main