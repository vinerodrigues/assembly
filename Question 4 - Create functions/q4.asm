;-------------------------Função de ordenar lista------------------------------
global ordenar
ordenar:

loopstart:										;COMEÇANDO O PRIMEIRO LOOP. ENQUANTO I < (LEN-1)     **** RDI = I
		cmp rdi, rbx                            ;FOR I TO (LEN-1)
		je fimordenar						    ;SALTO PARA QUANDO TERMINAR A LISTA
		mov cl, byte[rax+rdi*1]					;GUARDANDO O ELEMENTO DA VEZ PARA AS COMPARAÇÕES						;
		mov rsi, rdi							;GUARDANDO O INDICE DO ELEMENTO GUARDADO	         **** INDICE
		mov rdx, rdi							;MOVENDO O VALOR DE I PARA J

loopstart2:										;COMEÇANDO O SEGUNDO LOOP
		cmp rdx, rbx							;CONDIÇÃO DO NOVO LOOP. ENQUANTO J MENOR QUE (LEN-1)
		je fimloop2								;SALTO PARA SAIR DO LOOOP
		inc rdx									;SENÃO, INCREMENTA 1 VAI PARA O VALOR SEGUINTE.
		cmp cl, byte[rax+rdx*1]					;SE VALOR GUARDADO É MENOR QUE O DA VEZ
		jg loopse								;SE CONDIÇÃO FOR VERDADEIRA. SALTO PARA ATRIBUIÇÃO

		jmp loopstart2
loopse:											;SALTO PARA COMPARAÇÃO
		mov cl, byte[rax+rdx*1]					;GUARDANDO O MENOR VALOR ENCONTRADO NA VARIAVEL
		mov rsi, rdx 							;GUARDANDO O INDICE                                    **** INDICE
		;inc rdx									;INCREMENTANDO PARA ANÁLISE DE OUTROS VALORES DA LISTA
		jmp loopstart2							;VERIFICAR PROXIMO DIGITE.

fimloop2:  										;ENCERROU O SEGUNDO LOOP
		mov r8b, byte[rax+rdi*1]
		mov byte[rax+rsi*1], r8b			 	;REALIZANDO A TROCA DO VALOR, CASO ACHE UM MENOR, SE NÃO ACHAR, VAI MOVER O MESMO VALOR
		mov byte[rax+rdi*1], cl                 ;REALOCANDO O MENOR VALOR
		inc rdi									;INCRMETANDO 1 PARA VERIFICAR O VALOR SEGUINTE 
		jmp loopstart							;PROXIMO VALOR
fimordenar:										;
		ret										;
;-----------------------------------------------

;Aruivo fonte base para todos os outros programa
;Declaração de Variáveis

section .data


;------------------------------------------------
blist0 db 8,9,25,3,1,19,30,20,50,115,0			 ;LISTA1
blenlist0 db 11 								 ;TAMANHO DA LISTA 1	
;------------------------------------------------ 
;------------------------------------------------
blist1 db -115,50,20,30,19,1,3,25,9				 ;LISTA2
blenlist1 db 9 									 ;TAMANHO DA LISTA 2
;------------------------------------------------
blist2 db 8,115,9,50,25,20,3,30,1,19,19,14,2,5   ;LISTA3
blenlist2 db 14 								 ;TAMANHO DA LISTA 3	
;-------------------------------------------------
;-------------------------------------------------
blist3 db 8,115,9,50   							  ;LISTA4
blenlist3 db 4 								      ;TAMANHO DA LISTA 4	
;-------------------------------------------------

;Constantes

EXIT_SUCCESS equ 0   ; successful operation
SYS_exit equ 60      ; call code for terminate


;**
; Code Section

section .text
global _start
_start:

;--------------  PARAMETROS DE ENTRADA - TESTE  -------------------------		
										;	
		mov rax, blist3         		; ENDEREÇAMENTO DA LISTA
		movzx rbx, byte[blenlist3] 		; TAMANHO DA LISTA
		sub bl, 1     					; 'LEN -1'
		mov rdi, 0
		call ordenar					;CHAMANDO A FUNÇÃO A PRIMEIRA VEZ

;--------------  PARAMETROS DE ENTRADA - PRIMEIRO  -------------------------		
										;	
		mov rax, blist0         		; ENDEREÇAMENTO DA LISTA
		movzx rbx, byte[blenlist0] 		; TAMANHO DA LISTA
		sub bl, 1     					; 'LEN -1'
		mov rdi, 0
		call ordenar					;CHAMANDO A FUNÇÃO A PRIMEIRA VEZ

;--------------  PARAMETROS DE ENTRADA - SEGUNDO  -------------------------		
										;	
		mov rax, blist1         		; ENDEREÇAMENTO DA LISTA
		movzx rbx, byte[blenlist1] 		; TAMANHO DA LISTA
		sub bl, 1     					; 'LEN -1'
		mov rdi, 0
		call ordenar					;CHAMANDO A FUNÇÃO A PRIMEIRA VEZ

;--------------  PARAMETROS DE ENTRADA - TERCEIRO ------------------------		
										;	
		mov rax, blist2         		; ENDEREÇAMENTO DA LISTA
		movzx rbx, byte[blenlist2] 		; TAMANHO DA LISTA
		sub bl, 1     					; 'LEN -1'
		mov rdi, 0
		call ordenar					;CHAMANDO A FUNÇÃO A PRIMEIRA VEZ

last:
        mov rax, SYS_exit        ; successful operation
        mov rdi, EXIT_SUCCESS        ; call code for terminate
        syscall