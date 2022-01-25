; BubbleSort

model small

.data
    valor db 55,54,51,48,49,50,54,0ah,0dh,"$"
    ; valor db 52,51,51,55,54,56,55,0ah,0dh,"$"   db define byte 16 bits
    t     dw 6                                  ; dw define word  8 bits

.code
    mov dx, @data
    mov ds, dx
    
    ; Macro to print simple characters
    PRINTC macro char
        mov ah, 02h
        mov dl, char
        int 21h
    endm
    
    ; Macro to print strings.
    PRINTS macro str
        mov ah, 09h
        lea dx, str
        int 21h
    endm

    ; si will be incremented, so starts with 0
    mov si, 0
    ; Print the array valor
    PRINTS valor

    
    LOOPING:
        mov bh, valor[si]   ; pass the position 0 (1) of the "valor" to bh.
        mov bl, valor[si+1] ; pass the position 1 (2) of the array "valor" to bl.
        cmp si, t           ; if si == (t = 6)
        je END              ;     jump if equal -> END

        cmp bl, bh          ; if bl < bh
        jb  TROCA           ;    jump if below  -> TROCA
        inc si              ; increment si++
        jmp  LOOPING        ; else -> LOOPING


    TROCA:
        mov valor[si], bl   ; valor[si+1] -> valor[si]
        mov valor[si+1], bh ; valor[si]   -> valor[si+1]
        mov si,0            ; After the changing of value si is initialized again.
        PRINTS valor
        jmp LOOPING         ; Return to the loop.


    END:
        mov ah, 4ch
        int 21h