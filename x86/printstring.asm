 
; This code prints a string auto measuring to length of the string.
; As point address has been storeged at the register, so we can compare the byte storage on that
; pointed address to define if it is the end of the string or not.


; eax and ebx ave the firs addres of the string
; | h | e | l | l | o | null |
;   |
;  eax is pointing to the first address of the string. Is the byte in this addres equals to 0?
; if is not we can increment one address.
; | h | e | l | l | o | null |
;       |
;      eax 

; | h | e | l | l | o | null |
;                         |
;                        eax 
; After N loops eax is finally equals to 0, so its is possible to usbstract the original value
; to have the lenght of the string.


SECTION .data
    msg db 'hello hello hello', 0ah

SECTION .text
global _start

_start:
    mov ebx, msg
    mov eax, ebx
    
NXTCHAR:
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