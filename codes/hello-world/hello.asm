bits 64

extern GetStdHandle
extern ExitProcess
extern WriteFile

section .data
    hello db "Hello, World x64!", 0

section .text

    global main

    main:
        mov rcx, -11
        call GetStdHandle

        push 0
        mov r9, 0
        mov r8, 18
        mov rdx, hello
        mov rcx, rax
        call WriteFile

        mov rcx, 0
        call ExitProcess

; nasm -f win64 .\hello.asm -o .\hello.obj
; GoLink.exe .\hello.obj kernel32.dll /console /entry:main
; ./hello.exe