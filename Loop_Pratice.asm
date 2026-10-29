
section .data

    _Top db "TTTTTT" ; 
    _Top_LEN equ $ - _Top

    _Bottom db "BBBB" ; 
    _Bottom_LEN equ $ -  _Bottom ; 

    _nl db 10 ; Next Line

    ; Text
    _TEXT db "TOP Count (1 - 9): " ; 
    _T1_LEN equ $ - _TEXT
    _TEXT2 db "Bottom COUNT (1 - 9): " ; 
    _T2_LEN equ $ - _TEXT2

; input varriables
section .bss
    _INT_TOP resb 18
    _INT_Bottom resb 18



section .text
    global _start

_start:

    ; Text 1
    mov rax , 1 
    mov rdi , 1
    mov rsi , _TEXT
    mov rdx , _T1_LEN
    syscall
    ; TOP input

    mov rax , 0
    mov rdi , 0
    mov rsi , _INT_TOP
    mov rdx , 18
    syscall


    mov al , [_INT_TOP]
    sub al , '0'
    movzx r12 , al


    ; Metin 2
    mov rax , 1 
    mov rdi , 1
    mov rsi , _TEXT2
    mov rdx , _T2_LEN
    syscall

    ; bottom Girdi

    mov rax , 0
    mov rdi , 0
    mov rsi , _INT_Bottom
    mov rdx , 18
    syscall

    mov al , [_INT_Bottom]
    sub al , '0'
    movzx r13 , al

LOP1:
    ; Second Loop timer restart
    mov rbx , r13



    ; LOOP ONE TEXT
    mov rax , 1
    mov rdi , 1
    mov rsi, _Top
    mov rdx, _Top_LEN
    syscall

    ; New Row
    mov rax , 1
    mov rdi , 1
    mov rsi , _nl
    mov rdx , 1
    syscall


LOP2:

        ; Loop Text
    mov rax , 1
    mov rdi , 1
    mov rsi, _Bottom
    mov rdx, _Bottom_LEN
    syscall
        
    ; New Row
    mov rax , 1
    mov rdi , 1
    mov rsi , _nl
    mov rdx , 1
    syscall
        
    dec rbx
    jnz  LOP2 ; r13 != 0 return to LOP 2
    
    
    dec r12
    jnz  LOP1 ; r12 != 0 return to LOP 1

    
    ; New Row
    mov rax , 1
    mov rdi , 1
    mov rsi , _nl
    mov rdx , 1
    syscall


    ; Finish Program
    mov rax, 60
    mov rdi, 0
    syscall
