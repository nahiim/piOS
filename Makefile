# Cross-compiler
CC = arm-none-eabi-gcc

CPU = arm1176jzf-s

# Compiler flags
# CFLAGS = -c -mcpu=arm1176jzf-s -fpic -ffreestanding -O2 -Wall -Wextra -Werror
CFLAGS = -mcpu=$(CPU) -fpic -ffreestanding
CSRCFLAGS = -O2 -Wall -Wextra
LFLAGS = -ffreestanding -O2 -nostdlib

# Source and object directories
SRCDIR = src
OBJDIR = objs

# Source files
SRCS = $(wildcard $(SRCDIR)/*.c) $(wildcard $(SRCDIR)/*.S)
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(patsubst $(SRCDIR)/%.S,$(OBJDIR)/%.o,$(SRCS)))

# Output executable
TARGET = build/kernel.img

build: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -T linker.ld -o $@ $(LFLAGS) $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@ $(CSRCFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.S
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

run: build
	cmd /k start qemu-system-arm -m 512 -M raspi0 -serial stdio -kernel $(TARGET)
