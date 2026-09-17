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
   mov ecx,2000
   .clear:
      mov word [edi],0x0720
      add edi,2
      loop .clear

   mov edi, 0xB8000
   mov word [edi],4048h
   mov word [edi+2],7065h
   mov word [edi+4],704ch
   mov word [edi+6],706ch
   mov word [edi+8],406fh

   cli
   hlt


times 512 - ($-$$) db 0 
