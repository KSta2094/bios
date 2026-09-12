[bits 16]

org 0x7c00 



sector:
mov si,msg
mov ah,0eh
    .loop:
        lodsb
        cmp al,0
        je .halt 
        int 0x10
        jmp .loop
.halt:
    cli ; clear interrupt flag
    hlt ; halt execution

msg : db "Hello from sector 2"

times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
dw 0xaa55 ; magic bootloader magic - marks this 512 byte sector bootable!
