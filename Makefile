.PHONY: clean

include ../../mk/toolchain.mk

ASFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = --oformat=elf32-littleriscv

%.o: %.S
	$(CROSS_COMPILE)as -R $(ASFLAGS) -o $@ $<

all: pimo.elf

pimo.elf: pimo.o
	 $(CROSS_COMPILE)ld -o $@ -T pimo.ld $(LDFLAGS) $<

clean:
	$(RM) pimo.elf pimo.o