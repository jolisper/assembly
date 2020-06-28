; hello4.asm
extern printf                   ; declare the fucntion as external
section .data
  msg db "Hello, World!", 0
  fmtstr db "This is our string: %s", 10, 0 ; printformat
section .bss
section .text
  global main
main:
  push rbp
  mov rbp, rsp
  mov rdi, fmtstr               ; first argument for printf
  mov rsi, msg                  ; second argument for printf
  mov rax, 0                    ; no xmm registers involved
  call printf                   ; call the function
  mov rsp, rbp
  pop rbp
  mov rax, 60                   ; 60 = exit
  mov rdi, 0                    ; 0 = success exit code
  syscall                       ; quit
