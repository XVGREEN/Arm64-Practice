.global main
.extern printf

.text
main:
    mov w0,#3
    mov w2,w0
    bl fak
    mov w1,w2
    mov w2,w0
    adr x0,fmt
    bl printf
	mov x0,#0
	mov x8,#93
    svc #0

fak:
	mov w1,w0
	sub w1,w1,#1
	loop:
		cmp w1,#2
		b.ne body
		b out
		body:
			mul w0,w0,w1
			sub w1,w1,#1
			b loop	
     out:
	 ret


.data 
fmt: .asciz "%d!=%d\n"
