section .text

exit:
    mov rax, 60
    syscall

string_length:
    push rcx
    mov rcx, 0
    push rax
    .loop:
        cmp byte [rdi + rcx], 0
	je .end
	inc rcx
	jmp .loop
    .end:
        mov rax, rcx
        pop rcx

print_string:
    push rax
    call string_length
    push rdx
    mov rdx, rax
    mov rax, 1
    push rsi
    mov rsi, rdi
    push rdi
    mov rdi, 1
    syscall
    pop rdi
    pop rsi
    pop rdx
    pop rax
    


