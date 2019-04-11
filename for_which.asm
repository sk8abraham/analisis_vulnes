section .text
global _start
_start:
    jmp for

b1
    mov ecx,[cont]
    call which
    add byte [cont],1
for
    cmp byte [cont],0xb
    jne b1
    jmp fin

which
caso1
    cmp ecx,1
    jne caso2
    mov edx,len_uno
    mov ecx,uno
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso2
    cmp ecx,2
    jne caso3
    mov edx,len_dos
    mov ecx,dos
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso3
    cmp ecx,3
    jne caso4
    mov edx,len_tres
    mov ecx,tres
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso4
    cmp ecx,4
    jne caso5
    mov edx,len_cuatro
    mov ecx,cuatro
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso5
    cmp ecx,5
    jne caso6
    mov edx,len_cinco
    mov ecx,cinco
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso6
    cmp ecx,6
    jne caso7
    mov edx,len_seis
    mov ecx,seis
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso7
    cmp ecx,7
    jne caso8
    mov edx,len_siete
    mov ecx,siete
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso8
    cmp ecx,8
    jne caso9
    mov edx,len_ocho
    mov ecx,ocho
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso9
    cmp ecx,9
    jne caso10
    mov edx,len_nueve
    mov ecx,nueve
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp salir

caso10
    cmp ecx,0xa
    jne salir
    mov edx,len_diez
    mov ecx,diez
    mov ebx, 1
    mov eax, 4
    int 0x80

salir
    ret

fin
    mov eax, 1
    int 0x80

section .data
    uno: db 'uno',0xa
    len_uno: equ $ - uno
    dos: db 'dos',0xa
    len_dos: equ $ - dos
    tres: db 'tres',0xa
    len_tres: equ $ - tres
    cuatro: db 'cuatro',0xa
    len_cuatro: equ $ - cuatro
    cinco: db 'cinco',0xa
    len_cinco: equ $ - cinco
    seis: db 'seis',0xa
    len_seis: equ $ - seis
    siete: db 'siete',0xa
    len_siete: equ $ - siete
    ocho: db 'ocho',0xa
    len_ocho: equ $ - ocho
    nueve: db 'nueve',0xa
    len_nueve: equ $ - nueve
    diez: db 'diez',0xa
    len_diez: equ $ - diez


section .bss
cont resb 0x1
