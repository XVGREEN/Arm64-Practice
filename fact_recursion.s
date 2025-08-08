.global main
.extern printf

.text
main:
    mov w0,#4
    bl fact
    mov w1,w0
    adr x0,fmt
    bl printf
	mov x8,#93
	svc #0

fact:
	stp x29,x30,[sp,#-16]!
	cmp w0,#1
	b.ge body
	mov w0,#1
	ldp x29,x30,[sp],#16
	ret
	body:
		stp x0,xzr,[sp,#-16]!
		sub w0,w0,#1
		bl fact
		mov w1,w0
		ldp x0,xzr,[sp],#16
		mul w0,w0,w1
		ldp x29,x30,[sp],#16
		ret

	
.data
fmt: .asciz "result: %d \n"
