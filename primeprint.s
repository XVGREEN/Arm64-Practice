 .global main
 .extern printf
 
.text

 main:    
	mov w1,#2
     loop:     
       cmp w1,#0xFFF
       b.eq out      
  	   stp x1,xzr,[sp,#-16]!
  	   mov x0,x1
  	   bl primo
  	   ldp x1,xzr,[sp],#16
  	   cmp x0,#1 
  	   b.eq prnt
  	   b incr
  	   prnt:
    	  stp x1,xzr,[sp,#-16]!
    	  adr x0,fmt
   	 	  bl printf
   	  	  ldp x1,xzr,[sp],#16
   	   incr:
   	   add w1,w1,#1
   	   b loop
     out:                           
     mov x0, #0                      
     mov x8, #93                    
     svc #0

primo:
    sub sp,sp,#16
    stp x29,x30,[sp]
    mov x29,sp
    mov x1,#2

    loop_start:
        cmp x1,x0
        b.lt lower
        b loop_end
        lower:
            sub sp,sp,#16
            stp x0,xzr,[sp]
            bl  mod
            cmp x0,#0
            b.eq divisivel
            add x1,x1,#1
            ldp x0,xzr,[sp]
            add sp,sp,#16
            b loop_start
        divisivel:
            add sp,sp,#16
            mov x0,#0
            ldp x29,x30,[sp]
            add  sp,sp,#16
            ret
      loop_end:
            mov x0,#1
            ldp x29,x30,[sp]
            add sp,sp, #16
            ret

mod:
    udiv x2,x0,x1
    mul x2,x2,x1
    sub x0,x0,x2
    ret



 
     .data
 fmt:    .ascii "valor: %u\n"

