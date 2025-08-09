.global main
.extern printf 
.include "header.s"
 main:
  bl fun
  mov x1,x0
  adr x0,fmt
  bl printf

  mov x0,#0
  mov x8,#93
  svc #0



 .data
 fmt: .asciz "valor:%d \n"



