# Assembly for 32 bits processors

Compilation and Run
```bash
$ nasm -f elf code.asm
$ ld -m elf_i386 -s -o code code.o
$ ./code
```