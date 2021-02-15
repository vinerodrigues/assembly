;Aruivo fonte base para todos os outros programa
;Declaração de Variáveis

;Crie um programa para converter uma string que representa um valor numérico em um inteiro. Por exemplo, dada a string terminada em ;NULL “41275” (um total de 6 bytes), converta a string em um número inteiro de palavra dupla (0x0000A13B). Você pode assumir que a ;string e o inteiro resultante não têm sinal. Use o depurador para executar o programa e exibir os resultados finais. Crie um arquivo ;de entrada do depurador para mostrar os resultados.

section .data

sstr1 db '41275',0  ;Palavra que será verfiicada
qaux dd 0
qaux2 dd 0


;Constantes

EXIT_SUCCESS equ 0   ; successful operation
SYS_exit equ 60      ; call code for terminate


;**
; Code Section

section .text


global _start
_start:

;-------------------criando o len do numero------------------------------------------
		mov rbx, 0    ; len	
		mov rax, sstr1;  
		mov rdx, 1    ; variavel do potencia de dez
looplen:
		cmp byte[rax +rbx*1], 0
		je loopconvert 
		inc rbx
		jmp looplen

;-------------------convertendo----------------------------------------------------
loopconvert:
		dec rbx
		cmp rbx, 0
		jl converthexa
		mov cl, byte[rax+rbx*1]
		sub cl, 48
		movzx ecx, cl
;--------------------------------------------botar em uma variavel de maior capacidade		
		;;;;;;;;;;;mov byte[qaux2], cl


;-----------------------------------------------------------------------------------------
		
		imul ecx, edx
		imul edx, 10

;----------------------------------------------------------------------------		
		
		add ecx, dword[qaux]
		mov dword[qaux], ecx

;---------------------------------------------------------------------------------		
		
		;mov ecx, 0
		jmp loopconvert


converthexa:
		mov ecx, dword[qaux]


last:
        mov rax, SYS_exit        ; successful operation
        mov rdi, EXIT_SUCCESS        ; call code for terminate
        syscall