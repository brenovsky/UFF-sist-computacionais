section .data
    msg db 'Hello, world!', 0

section .text
    global main

extern GetStdHandle
extern WriteFile
extern ExitProcess

main:
    ; Obter o identificador do console de saída padrão (stdout)
    push -11               ; STD_OUTPUT_HANDLE
    call GetStdHandle
    mov r9, rax            ; r9 contém o identificador do console

    ; Escrever a mensagem no console
    mov edx, 13            ; comprimento da mensagem
    mov ecx, msg           ; ponteiro para a mensagem
    mov ebx, r9            ; identificador do console
    call WriteFile

    ; Sair do programa
    xor ecx, ecx           ; código de saída 0
    call ExitProcess