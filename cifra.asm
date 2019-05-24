section .text
global _start

section .data
    txt db "texto no cifrado"
    len_txt equ $ - txt

_start:
    mov al,0x20
    mov ecx, len_txt
    ;dec ecx
    mov edx,[txt]
    call cifra_descifra
    mov ebx,0 
    mov eax, 1
    int 0x80
    #imprime la cadena
    #al tiene la llave para cifrar

cifra_descifra
    mov ecx,0
l1
    xor BYTE[edx+ecx],al
    inc ecx
    loop l1

    mov edx,len_txt
    mov ecx,edx
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

    
