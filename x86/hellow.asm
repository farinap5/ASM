section	.data
    msg	db	'Hello world!',0xa	; String ending with "line feed"
    len	equ	$ - msg			    ; length of the string

section	.text
	global _start 
_start:             ; entry point
	mov	edx, len    ; message length
	mov	ecx, msg    ; message to write
	mov	ebx, 1	    ; file descriptor (stdout)
	mov	eax, 4	    ; system call number 4 (sys_write)
	int	0x80        ; call kernel

	mov	eax, 1	    ; system call number 1 (sys_exit)
	int	0x80        ; call kernel

; It is important to note that sys write needs to take 4 arguments.
; edx -> message length
; ecx -> message to write, the first poiting address
; ebx -> file descriptor (stdout)
; eax -> the command passed to the kernel, "write" in this case.