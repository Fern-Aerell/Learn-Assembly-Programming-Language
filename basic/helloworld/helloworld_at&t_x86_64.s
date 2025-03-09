.section .data
    msg: .asciz "Hello, World!\n"

.section .text

.global _start

_start:
    # syscall write(1, message, length)
    mov $1, %rax            # syscall number for sys_write
    mov $1, %rdi            # file descriptor 1 (stdout)
    lea msg(%rip), %rsi     # pointer to string
    mov $14, %rdx           # string length
    syscall

    # syscall exit(0)
    mov $60, %rax           # syscall number for sys_exit
    xor %rdi, %rdi          # exit code 0`
    syscall
