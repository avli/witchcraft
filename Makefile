all:
	nasm -felf64 test_exit.asm && ld -o test_exit test_exit.o
	nasm -felf64 print_hex.asm && ld -o print_hex print_hex.o
	nasm -felf64 hello.asm && ld -o hello hello.o
	nasm -felf64 test_print_string.asm && ld -o test_print_string test_print_string.o
