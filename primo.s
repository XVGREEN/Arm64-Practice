 .global main
 .extern atoi 
 .extern printf
 .text 

 main:
    mov x0,#0
    adr x1,buffer
    mov x2,#20
    mov x8,#63
    svc #0
    
    adr x0,buffer
    bl atoi 
    bl primo
    
    cmp x0,#1   
    b.eq isprime
    b nprime
    isprime:
        adr x0,txt
        b out
    nprime:
 		adr x0,txt2   
    out:
    bl printf
    mov x0,#0
    mov x8,#93
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
		    bl	mod
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
buffer: .space 20
txt: .asciz "primo \n"
txt2: .asciz "não primo\n"
