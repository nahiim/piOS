#include <uart.h>


void kernel_main(uint32_t r0, uint32_t r1, uint32_t atags)
{
    (void) r0;
    (void) r1;
    (void) atags;

    uart_init();
    uart_puts("Hello, kernel World!\r\n");

    while (1)
    {
        char c = uart_getc(); // Read a character from UART
        uart_putc(c); // Echo the character back

        if (c == '\r')
        { // If carriage return is received
            uart_putc('\n'); // Send a newline character to move to the next line
        }
    }
}
