hello: hello3.o
	gcc -o hello hello3.o -no-pie
hello3.o: hello3.asm
	nasm -f elf64 -g -F dwarf hello3.asm -l hello3.lst
