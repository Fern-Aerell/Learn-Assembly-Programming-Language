### GNU Assembler (GAS) 

Adalah assembler default dalam GNU Compiler Collection (GCC). Bahasa ini digunakan untuk menulis kode assembly, yang memberikan kontrol langsung terhadap perangkat keras. Berikut langkah-langkah pembelajarannya:

---

## **1. Pengenalan Dasar Assembly dan GAS**

### **a. Memahami Assembly**
- Assembly adalah bahasa tingkat rendah yang berinteraksi langsung dengan prosesor.
- Kode assembly diterjemahkan ke dalam machine code oleh assembler.
- GAS menggunakan sintaks AT&T, berbeda dari Intel yang lebih populer.

### **b. Persiapan Alat**
- Install GNU `as` (bagian dari binutils) dan `gcc` untuk proses kompilasi.
- Sistem operasi yang disarankan: Linux.
  ```bash
  sudo apt-get install build-essential binutils
  ```

- Editor teks: Gunakan **vim**, **nano**, atau **VS Code** (dengan ekstensi bahasa assembly).

---

## **2. Struktur Dasar Program Assembly di GAS**
- Format dasar GAS:
  ```assembly
  .section .data    # Section untuk data
  .section .text    # Section untuk kode
  .global _start     # Entry point

  _start:
      mov $1, %rax   # Memindahkan nilai ke register
      mov $0, %rdi   # Menyiapkan argumen
      syscall        # Memanggil sistem operasi
  ```

- **Section Penting**:
  - `.data`: Menyimpan data statis.
  - `.bss`: Menyimpan data tidak terinisialisasi.
  - `.text`: Menyimpan instruksi eksekusi.

---

## **3. Register dan Instruksi**
- **Register Umum (x86-64)**:
  - `%rax`, `%rbx`, `%rcx`, `%rdx`: Data umum.
  - `%rsi`, `%rdi`: Argumen fungsi.
  - `%rsp`, `%rbp`: Stack pointer dan base pointer.

- **Instruksi Dasar**:
  - `mov`: Memindahkan data.
  - `add`, `sub`, `mul`, `div`: Operasi aritmatika.
  - `jmp`, `je`, `jne`: Operasi lompat (branching).

### **Contoh Program Dasar**
- Menambahkan dua angka:
  ```assembly
  .section .text
  .global _start

  _start:
      mov $5, %rax       # RAX = 5
      mov $3, %rbx       # RBX = 3
      add %rbx, %rax     # RAX = RAX + RBX
      mov $60, %rax      # Exit syscall
      xor %rdi, %rdi     # Status 0
      syscall
  ```

---

## **4. Sistem Operasi dan Syscall**
- **Syscall Numbers**:
  - Linux syscall numbers berbeda untuk tiap operasi.
  - `write` (1), `exit` (60).

- **Contoh Syscall**:
  - Menulis ke stdout:
    ```assembly
    .section .data
    msg: .asciz "Hello, World!\n"

    .section .text
    .global _start

    _start:
        mov $1, %rax       # Syscall write
        mov $1, %rdi       # File descriptor (stdout)
        lea msg(%rip), %rsi # Pointer ke string
        mov $14, %rdx      # Panjang string
        syscall

        mov $60, %rax      # Syscall exit
        xor %rdi, %rdi     # Status 0
        syscall
    ```

---

## **5. Pemahaman Memori dan Stack**
- **Stack**:
  - Fungsi stack: Menyimpan data sementara.
  - Operasi stack:
    - `push`: Menyimpan data ke stack.
    - `pop`: Mengambil data dari stack.

- **Contoh Stack**:
  ```assembly
  .section .text
  .global _start

  _start:
      mov $10, %rax
      push %rax          # Push RAX ke stack
      pop %rbx           # Pop ke RBX
      mov $60, %rax
      xor %rdi, %rdi
      syscall
  ```

---

## **6. Pemrograman dengan Fungsi**
- Assembly memungkinkan penggunaan fungsi untuk modularitas.
- Contoh fungsi sederhana:
  ```assembly
  .section .text
  .global _start

  _start:
      call my_function   # Panggil fungsi
      mov $60, %rax
      xor %rdi, %rdi
      syscall

  my_function:
      mov $42, %rax      # Kembalikan nilai
      ret
  ```

---

## **7. Debugging**
- Gunakan **GDB** untuk debugging.
  ```bash
  gdb ./program
  ```
  Perintah dasar:
  - `break _start`: Menambahkan breakpoint.
  - `run`: Menjalankan program.
  - `info registers`: Melihat register.
  - `stepi`: Melangkah satu instruksi.

---

## **8. Error Umum dan Solusi**
- **Error Undefined Reference**:
  - Pastikan ada `.global _start`.
- **Segmentation Fault**:
  - Periksa akses memori ilegal.
- **Unknown Opcode**:
  - Cek instruksi apakah valid untuk arsitektur (x86 vs x86-64).

---

## **9. Studi Kasus**
- **Kalkulator Sederhana**:
  Program assembly untuk penjumlahan, pengurangan, dll.
- **Pemrosesan String**:
  Implementasi `strlen` dan `strcmp`.

---

## **10. Praktik Terbaik**
- Dokumentasikan kode dengan komentar.
- Struktur kode menjadi modul yang kecil dan dapat digunakan ulang.
- Gunakan **Makefile** untuk automasi kompilasi.

---

## **11. Pendalaman Ekosistem**
- **Library GAS**:
  - Gunakan **libc** untuk fungsi yang lebih kompleks.
  - Pelajari pemrograman inline assembly dengan C untuk integrasi.

- **Komunitas**:
  - Bergabung dengan forum seperti Stack Overflow atau Reddit (/r/assembly).
  - Ikut proyek open source yang menggunakan assembly (misalnya kernel Linux).

- **Buku dan Referensi**:
  - *Programming from the Ground Up* oleh Jonathan Bartlett.
  - Dokumentasi resmi [GNU Assembler](https://sourceware.org/binutils/docs/as/).

---