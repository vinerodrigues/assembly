;Aruivo fonte base para todos os outros programa
;Declaração de Variáveis
;tentativa de fazer soma e subtração e fazer um loop de 10
section .data

;Exercicio: construir um alg bubble sort
;1º Definir o tamanho da lista, vai ser crucial para determinar como percorrer o vetor
;entrada do usuario

tamlista dq 5                 ;Tamanho da lista tem 5 elementos. Preciso para percorrer o loop
blista   db 5,3,4,1,2         ;Defini os elementos que eu quero ordenar. Elementos para definir as trocas


;Constantes

EXIT_SUCCESS equ 0   ; successful operation
SYS_exit equ 60      ; call code for terminate


;**
; Code Section

section .text
global _start
_start:

		mov rax, blista  ;Com  isso eu pego os endereço de memoria de todos os vetores

		;teste de lista
		mov bl, byte[rax+0]
		mov cl, byte[rax+1]
		mov dl, byte[rax+2]
		mov sil, byte[rax+3]
		mov dil, byte[rax+4]
		;após o teste consegui verificar que todos os elementos do vetor estão o.k

;--------------------------------------------------------------------------------------------------------------------------------------
		;contrução do loop
		;escolhi o rax pra armazenar o endereço de memoria, rbx para fazer o loop crescescente e o rcx para determinar o tamanho de loop
		;pela minha estratégia o loop vai só até 4
		
		mov rcx, qword[tamlista]
		sub rcx,1
		mov qword[tamlista], rcx

		mov rbx, 0; zerei o rbx
		mov rcx, 0;
		mov rcx, qword[tamlista]; Tudo pronto pro loop


		;após o teste do loop, depois de algumas tentativas, funcionou, agora é percorrer os elementos
		;vou usar o rdx para percorrer os elementos

		mov rdx, 0; zerei o rdx para percorrer os elementos.

		;Deu certo após algumas tentativas, agora vou criar um loop de comparação de elemento
		;A cada elemento verificado, vou comparar, se for maior vou fazer um jump onde eu possa trocar o elemento de posição
		;para fazer a comparação vou usar mais um registrador, para que ele percorra sem um elemento a mais que o primeiro vetor

		mov rsi, 0; Zerei o rsi para percorrer os elemntos

		;mais um registro pra auxiliar na troca
		mov rdi, 0
;------------------------------------------------------------------------------------------------------------------------------------------



		
loopcmp:
		cmp rbx, rcx		
		je verific
		mov dl, byte[rax+rbx*1]; agora vamos percorrer os endereços de memoria, como se trata de db, percorre-se 1 a 1 end. de memoria
		mov rdi, rbx
		inc rbx
		mov sil, byte[rax+rbx*1];pecorrendo os endereços de memorias um passo a frente do anterior
		cmp dl, sil
		ja troca
		jmp loopcmp


verific:
		mov rax, blista  ;Com  isso eu pego os endereço de memoria de todos os vetores


		;após o teste consegui verificar que todos os elementos do vetor estão o.k		
		dec rcx
		mov rbx,0
		cmp rcx, 0
		je last
		jmp loopcmp

troca:	 
		mov byte[rax+rdi*1], sil
		inc rdi
		mov byte[rax+rdi*1], dl
jmp loopcmp

last:
        mov rax, SYS_exit        ; successful operation
        mov rdi, EXIT_SUCCESS        ; call code for terminate
        syscall