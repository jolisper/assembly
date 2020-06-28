; memory.asm
section .data
  bNum db 123
  wNum dw 12345
  warray times 5 dw 0           ; array of 5 words, containing 0
  dNum dd 12345
  qNum1 dq 12345
  text1 db "abc",0
  qNum2 dq 3.141592654
  text2 db "cde",0

section .bss
  bvar resb 1
  dvar resd 1
  wvar resw 10
  qvar resq 3

section .text
  global main
main:
  push rbp
  mov rbp, rsp

  lea rax, [bNum]               ; load address of bNum in rax
  mov rax, bNum                 ; load addreass of bNum in rax
  ; mov rax, [bNum]               ; load value of bNum in rax
  ; The previous commented line could introduce a bug:
  ; rax is 8-byte long, bNum is 1-byte variable,
  ; the length of the register decide how much byte are moved,
  ; so, despite bNum is 1-byte lenght, 8 bytes are moved to rax
  ; starting from bNum address.
  ; To correct the problem:
  xor rax, rax                  ; clean rax, only want 1-byte move
  mov al, [bNum]                ; move only 1 byte to rax

  ; mov [bvar], rax               ; load from rax at address bvar
  ; Same problem as in line 26, but could be even worst,
  ; because in this case it is overwritten 7 extra bytes
  ; starting from bvar address, so dvar and 6 bytes of wvar are
  ; affected. Be careful about the sizes of data you are moving
  ; to and from memory.
  mov [bvar], al                ; move only 1 byte to bvar address
  lea rax, [bvar]               ; load address of bvar in rax

  lea rax, [wNum]               ; load address of wNum in rax
  mov rax, [wNum]               ; load content of wNum in rax

  lea rax, [text1]              ; load address of text1 in rax
  mov rax, text1                ; load address of text1 in rax

  mov rax, text1+1              ; load second character in rax
  lea rax, [text1+1]            ; load second character in rax

  mov rax, [text1]              ; load starting at text1 in rax
  mov rax, [text1+1]            ; load starting at text1+1 in rax

  mov rsp, rbp
  pop rbp

  ret
