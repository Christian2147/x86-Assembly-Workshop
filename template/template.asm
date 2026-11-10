; Data to define in memory
section .data
    ; Define this string in memory for later use
    message db "Sum of even numbers from 1 to 10: "

    ; Get the length of defined string
    message_len equ $ - message

    ; Define newline containing the value 10 (ASCII value of newline)
    newline db 10

section .bss
    ; Reserve 20 bytes for our output
    output resb 20

; stores our actual logic
section .text

; Define _start as the programs entry point
global _start

_start:
; ##### FILL IN #####





loop_end:
    ; Print message
    mov rax, 1   ; 1 for write system call
    mov rdi, 1   ; 1 for stdout
    mov rsi, message  ; message -> what to write
    mov rdx, message_len ; message_len -> how many bytes to write
    syscall

    ; Convert sum to decimal characters
    ; r13 stores our sum
    mov rax, r13

    ; Divisor to convert the number into decimal digits
    mov rbx, 10

    ; Address to output (where in memory we are storing our output)
    mov rsi, output

    ; Start at the end of the output buffer to write digits
    add rsi, 20

convert_loop:
    ; Sets rdx to 0, div divides a combined value held in rax, rdx
    mov rdx, 0
    ; quotient in RAX, remainder in RDX (Divide our sum by 10 to get the last digit)
    div rbx
    ; convert digit to ASCII (dl is lower 8 bits of rdx)
    add dl, '0'
    ; Move rsi back by one bit (we going backwards on output bytes)
    sub rsi, 1
    ; Store the digit in that byte of the output
    mov [rsi], dl
    ; Check rax (the quotiant) if there are any more digits to convert (If not 0, then there are)
    cmp rax, 0
    ; Jump back if there are more digits to convert
    jne convert_loop

    ; Print result
    ; Store output buffer in rdx
    mov rdx, output
    ; Move rdx to the end of this buffer
    add rdx, 20
    ; Subtract staring address to get the string length
    sub rdx, rsi
    ; Write
    mov rax, 1
    ; stdout
    mov rdi, 1
    ; rsi already points to the result string
    syscall

    ; Print newline
    ; Write
    mov rax, 1
    ; stdout
    mov rdi, 1
    ; newline ASCII code
    mov rsi, newline
    ; Only printing one character -> one byte
    mov rdx, 1
    syscall

    ; Exit
    ; 60 -> exit system call
    mov rax, 60
    ; exit status is 0 -> indicating success
    mov rdi, 0
    syscall

; Input: RDI = number
; Output: RAX = 1 if even, 0 if odd
is_even:
; ##### FILL IN #####




