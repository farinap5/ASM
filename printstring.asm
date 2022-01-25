SECTION .data
    msg db 'hello, brave new worlda!', 0ah

SECTION .text
global _start

_start:
    mov ebx, msg
    mov eax, ebx
    
NXTCHAR:
    ; As point address has been storeged, so we can compare the byte storage 
    ; in this memory. If the pointed byte to is  equal to zero or null it is
    ; probably the end of the string. Sense this fact that EAX is just storing
    ; a pointer to the first address of the string it is possible to 
    ; incremento to point another address.
    cmp byte [eax], 0 ; Compare and set the number of the flag.
    jz  END           ; Jump to the end if zero flag is setted.
    inc eax           ; Increment address by one byte.
    jmp NXTCHAR       ; Do again.

END:
    sub eax, ebx
    
    mov edx, eax
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h
    
    mov ebx, 0
    mov eax, 1
    int 80h