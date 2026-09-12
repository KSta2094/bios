# NASM Instructions

[BITS 16]
    Tells nasm to use 16 bits for all instructions
[org 0x7c00]
    Tells nasm to start the bootloader at 0x7c00

# ASM instructions 

- start: is a label so that you don't need to use a specific adress 
- SI register is a register used mostly with strings and arrays
- mov : move instruction with the form "` move [destination] [source] `"
- lodsb : move register SI into AX and increments SI by 1





