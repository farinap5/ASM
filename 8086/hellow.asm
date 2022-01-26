.model small ; Small space of mammory -> 64kbb
  
.data  
	msg db "Hello World$" ; db -> this can store two integers, or 65k of space.
                       ; $ end the string.  
  
.code  
	; mov e2,e1  Move e2 <- e1  
	mov ax, @data ; Pointing the data into ax.  
	mov ds, ax    ; ds -> registrer segmentation of data.  
                  ; from `ds` I can start using my pointers (msg).  
  
	lae dx, msg   ; Load effective address (msg pointer)  into dx.
	mov ah, 09h   ; ah receives 09h whats calls the system to print string. `09h` reads  data from`dx`.  
	int 21h       ; Executes program interrupt in DOS, executing the `ah` function. 
  
	move ah, 4ch ; Function to exit the program in DOS. 4c -> function 76 
	int 21h      ; Execute 4ch (exit)  and return to the system.
  
end