[bits 16]

org 0x8000

sector:
cli ; clear Interupt falgs
lgdt [gdt_descriptor]; Load global descriptor table Registers

mov eax, cr0
or eax, 1
mov cr0, eax ; sets the protection enable flag
jmp 0x08:protected_mode ; far jump to 32 bit region


gdt_start:
dq 0 ; Define quadword - word = 2 bytes; 2*4 = 8 bytes
gdt_code:
dw 0xffff ; Define word
dw 0x0000
db 0x00
db 0x9A
db 0xCF
db 0x00
gdt_end:

gdt_descriptor:
dw gdt_end-gdt_start-1
dd gdt_start






bits 32
protected_mode:
 ; VGA text memory starts at 0xB8000

    mov edi, 0xB8000
    mov byte [edi], 'H'
    mov byte [edi + 2], 'E'
    mov byte [edi + 4], 'L'
    mov byte [edi + 6], 'L'
    mov byte [edi + 8], 'O'
    mov byte [edi + 10], ' '
    mov byte [edi + 12], 'W'
    mov byte [edi + 14], 'O'
    mov byte [edi + 15], 'R'
    mov byte [edi + 16], 'L'
    mov byte [edi + 17], 'D'
    mov byte [edi + 18], ' '
    ; Stop here
    cli
    hlt
    ; now we're executing 32-bit protected-mode code
times 512 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
