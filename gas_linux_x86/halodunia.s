.section .rodata

    halodunia_text:
        .asciz "Halo Dunia!\n"  # String halo dunia yang hanya dapat di baca

    halodunia_text_length:
        .long 12                # Panjang string halo dunia

.section .text

    .global _start # entry point

    _start:
        # Cetak halo dunia
        movl $4, %eax                       # sys_write
        movl $1, %ebx                       # fd_out
        movl $halodunia_text, %ecx          # mengatur teks halo dunia
        movl halodunia_text_length, %edx    # mengatur panjang teks
        int $0x80                           # sys_call

        # Keluar
        movl $1, %eax                       # sys_exit
        xorl %ebx, %ebx                     # exit code
        int $0x80                           # sys_call
