all:
	as -o code.o code.s 
	gcc code.o -o app -lm
	
