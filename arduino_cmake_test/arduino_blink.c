#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRD |= 0x04;
    while(1)
    {
        PORTD |= 0x04;
        _delay_ms(500);

        PORTD &= ~0x04;
        _delay_ms(500);
    }
}
