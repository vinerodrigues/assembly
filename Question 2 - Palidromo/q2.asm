;Aruivo fonte base para todos os outros programa
;Declaração de Variáveis

section .data
;EXERCICIOS DE PALINDROMO
;palavras testadas
;“ana”, “reviver”, “anilina”, “reviver” e “saias”
;A minha idéia foi percorrer a string nos dois sentindos comparando elementos por elemento.

;--------------------DIGITE QUALQUER PALAVRA---------------------------;
spa1 db 'civic',0     ;1ª String a ser testada

;------SE A SAÍDA FOR 1, É PALINDROMO, SE A SAÍDA FOR 0, NÃO É PALINDROMO

btam1 db 0
sresultp db ''

;Constantes

EXIT_SUCCESS equ 0   ; successful operation
SYS_exit equ 60      ; call code for terminate


;**
; Code Section

section .text
global _start
_start:
		mov rbx, 0
		;criando um len
clen:		
		mov rax, spa1;
		cmp byte[rax+rbx*1], 0 
		je inicio
		inc rbx
		jmp clen


inicio:
		mov rax, spa1; movendo o endereço de memoria da string
		mov sil, byte[rax+0]
		mov qword[btam1], rbx 
		mov rdx, qword[btam1]
		sub rdx, 1 
		mov rcx, 0
		mov rbp, 0


mainloop:
		cmp rcx, rbx
		je verifica
		mov sil, byte[rax+rcx*1]
		mov dil, byte[rax+rdx*1]
		cmp sil, dil
		je contador
		inc rcx
		dec rdx
		jmp mainloop

verifica:
		cmp rbp, rbx
		je resultado
		mov bl, 0
		mov byte[sresultp], bl

contador:
		inc rbp
		inc rcx
		dec rdx
		jmp mainloop

resultado:
		mov bl, 1
		mov byte[sresultp], bl
last:
        mov rax, SYS_exit        ; successful operation
        mov rdi, EXIT_SUCCESS        ; call code for terminate
        syscall