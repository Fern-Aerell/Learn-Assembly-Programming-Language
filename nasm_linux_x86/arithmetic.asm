section .data
    num1 db 5
    num2 db 3

section .bss
    result resb 1

section .text
    global _start

_start:
    mov al, [num1]      ; Load num1 ke AL
    add al, [num2]      ; Tambahkan num2 ke AL
    add al, 0x30        ; Konversi angka ke karakter ASCII
    mov [result], al    ; Simpan ke result

    ; Print result ke stdout
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    lea ecx, [result]   ; Pointer ke result
    mov edx, 1          ; Panjang data = 1 byte
    int 0x80            ; System call

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; System call

