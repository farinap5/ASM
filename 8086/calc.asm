; Simple calc

.model small  
  
.data  
    h1 db "### Calculadora ###$" ; header 1  
       
    i1 db 0ah,0dh,"Insert a number: $" ; input 1  
    i2 db 0ah,0dh,"Insert the second number: $" ; input 2  
    r1 db 0ah,0dh,"The result is: $" ; Resultado  
    e1 db 0ah,0dh,"Error: Choosen option do not exists!",0ah,0dh,"$"  ; Mensagem de erro
       
    op db 0ah,0dh,"Operation + or - : $" ; Escolha da operação  
 
  
.code  
   mov ax, @data  
   mov ds, ax  
             
   ; Mostrar header  
   lea dx, h1  
   call PRINT  
      
      
   MAIN:  
       ; Primeiro input de número  
       lea dx, i1  
       call PRINT  
       call SCAN  
       ; Move o número para bl  
       mov bl, al  
             
       ; Escolha da Operação  
       lea dx, op  
       call PRINT  
       call SCAN  
       ; Move o operador para bh.  
       mov bh, al  
          
       ; Segundo input de número  
       lea dx, i2  
       call PRINT  
       CALL SCAN  
          
       ; Comparando opção  
       cmp bh, 2bh ; if bh == +  
       je SOMA  
          
       cmp bh, 2dh ; if bh == -  
       je SUBT  
          
       jmp ERRO ; else  
      
   SOMA: ; Soma 
       add bl, al  
       lea dx, r1    
       call PRINT  
       mov dl, bl  
       sub dl, 30h  
       call PRINTS  
       jmp FIM  
          
   SUBT: ; Subtração 
       sub bl, al  
       lea dx, r1    
       call PRINT  
       mov dl, bl  
       add dl, 30h  
       call PRINTS  
       jmp FIM  
      
   ERRO:  
       lea dx, e1  
       call PRINT
       ; Caso haja erro, retorna para Main
       jmp MAIN  
      
   FIM:  
       mov ah, 4ch  
       int 21h          
      
   ; ### Procedures ###  
   ; Print  
   PRINT proc  
       mov ah, 09h  
       int 21h  
       ret  
   endp          
   ; Print caracter simples  
   PRINTS proc  
       mov ah, 02h  
       int 21h  
       ret  
   endp  
   ; Scan, espera por input  
   SCAN proc  
       mov ah, 01h  
       ; 01h -> al  
       int 21h  
       ret  
   endp