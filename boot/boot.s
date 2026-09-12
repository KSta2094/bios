bits 16 ; tell NASM this is 16 bit code
org 0x7c00 ; tell NASM to start outputting stuff at offset 0x7c00



main:


halt:
    mov si,halt_msg
    mov ah,0x0e
.loop:
    lodsb
    cmp al,0
    je .return
    int 0x10
    jmp .loop
.return:
    cli ; clear interrupt flag
    hlt ; halt execution
halt_msg: db "... HALTING",0




times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
dw 0xaa55 ; magic bootloader magic - marks this 512 byte sector bootable!
