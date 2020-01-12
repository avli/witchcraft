
newline_char: db 10
codes: db '0123456789abcdef'
section .text
global _start
print_newline:
    mov rax, 1            ; 'write' syscall identifier
    mov rdi, 1            ; stdout file descriptor
    mov rsi, newline_char ; where do we take data from
  mov rdx, 1
syscall
ret
print_hex:
    mov rax, rdi
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
iterate:
    push rax
    sub rcx, 4
    sar rax, cl
; the amount of bytes to write
; how far are we shifting rax?
; Save the initial rax value
; shift to 60, 56, 52, ... 4, 0
; the cl register is the smallest part of rcx
; clear all bits but the lowest four
and rax, 0xf
lea rsi, [codes + rax]; take a hexadecimal digit character code
mov rax, 1
push rcx
syscall
;
; syscall will break rcx
; rax = 1 (31) -- the write identifier,
;   rdi = 1 for stdout,
; rsi = the address of a character, see line 29
pop rcx
    pop rax
    test rcx, rcx
    jnz iterate
ret
_start:
; ˆ see line 24 ˆ
; rcx = 0 when all digits are shown
    mov rdi, 0x1122334455667788
    call print_hex
    call print_newline
    mov rax, 60
    xor rdi, rdi
    syscall
