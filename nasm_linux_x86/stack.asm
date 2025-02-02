section .data
	num1 db 5			; Variabel data (int) 5
	num2 db 3			; Variabel data (int) 3

section .bss
	result resb 2			; Buffer untuk menyimpan hasil (2 byte + 1 angka + newline)

section .text
	global _start

_start:
	; Push nilai langsung, bukan alamat
	movzx eax, byte [num1]		; Load num1 ke EAX
	push eax			; Push num1 ke stack
	movzx eax, byte [num2]		; Load num2 ke EAX
	push eax			; Push num2 ke stack

	pop eax				; Ambil num2 dari stack (Karena LIFO)
	add al, [num1]			; AL = num2 + num1
	add al, 0x30			; Konversi ke ASCII
	mov [result], al		; Simpan hasil ke result

	mov byte [result + 1], 10	; Tambahkan newline '\n'

	; Tampilkan hasil ke konsol
	mov eax, 4			; System call number untuk sys_write (4)
	mov ebx, 1			; File descriptor untuk stdout (1)
	lea ecx, [result]		; Pointer ke hasil
	mov edx, 2			; 1 angka + newline
	int 0x80			; Make the system call.

	; Exit program
	mov eax, 1			; System call number untuk exit (1)
	xor ebx, ebx			; Exit code 0
	int 0x80			; Make the system call.
