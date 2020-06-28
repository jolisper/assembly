# makefile for alive.asm
alive: alive2.o
	gcc -o alive alive2.o -no-pie
alive2.o: alive2.asm
	nasm -f elf64 -g -F dwarf alive2.asm -l alive2.lst
