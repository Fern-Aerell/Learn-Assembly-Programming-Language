; hello.asm
section .data
	message db 'Hello, World',0

section .text
	global _start

_start:
	; Print string
	mov eax, 4		; syscall number for sys_write (4)
	mov ebx, 1		; file descriptor 1 is stdout
	mov ecx, message	; address of the message to print
	mov edx, 13		; length of the message
	int 0x80		; call kernel

	; Exit program
	mov eax, 1		; syscall number for sys_exit (1)
	xor ebx, ebx		; exit code 0
	int 0x80		; call kernel
