%include "lib.inc"
section .data
message: db 'Hello, World', 10
section .text
global _start
_start:
    mov rdi, message
    call print_string
    call exit
