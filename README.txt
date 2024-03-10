====== piOS ======

In an attempt to foster my knowledge on embedded systems, operating systems and low level programming with C and assembly(ARM), I'm cooking up this very basic operating system for raspberry pi zero.

The pi zero houses a broadcom BCM2835 SOC, which contains ARM1176jzfs CPU core and Videocore IV GPU core with 512 MB of RAM shared between the CPU and GPU cores.

This OS so far just loads a very basic kernel which initialises UART and handles basic I/O.

HOW TO BUILD:
```make```
If all goes well, the kernel.img file will be generated in the "build" directory.

HOW TO RUN(with QEMU):
```make run```
