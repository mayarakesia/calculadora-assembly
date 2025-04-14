ORG 100h

INICIO:
    MOV AH, 09h
    LEA DX, MENU
    INT 21h

    MOV AH, 01h
    INT 21h
    CMP AL, '1'
    JE SOMA
    CMP AL, '2'
    JE SUBTRACAO
    CMP AL, '3'
    JE MULTIPLICACAO
    CMP AL, '4'
    JE DIVISAO
    JMP INICIO

SOMA:
    CALL LER_NUMEROS
    MOV AL, NUM1
    ADD AL, NUM2
    MOV RESULTADO, AL
    CALL MOSTRAR_RESULTADO
    JMP INICIO

SUBTRACAO:
    CALL LER_NUMEROS
    MOV AL, NUM1
    SUB AL, NUM2
    MOV RESULTADO, AL
    CALL MOSTRAR_RESULTADO
    JMP INICIO

MULTIPLICACAO:
    CALL LER_NUMEROS
    MOV AL, NUM1
    MUL NUM2
    MOV RESULTADO, AL
    CALL MOSTRAR_RESULTADO
    JMP INICIO

DIVISAO:
    CALL LER_NUMEROS
    MOV AL, NUM1
    MOV AH, 0
    DIV NUM2
    MOV RESULTADO, AL
    CALL MOSTRAR_RESULTADO
    JMP INICIO


LER_NUMEROS:
    MOV AH, 09h
    LEA DX, PEDIR1
    INT 21h
    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV NUM1, AL

    MOV AH, 09h
    LEA DX, PEDIR2
    INT 21h
    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV NUM2, AL
    RET


MOSTRAR_RESULTADO:
    MOV AL, RESULTADO
    MOV AH, 0
    MOV BL, 10
    DIV BL               

    MOV DIG1, AL         
    MOV DIG2, AH         

    MOV AH, 09h
    LEA DX, MSG_RESULTADO
    INT 21h

    MOV AL, DIG1
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AL, DIG2
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 09h
    LEA DX, MSG_ENTER
    INT 21h
    RET


NUM1 DB 0
NUM2 DB 0
RESULTADO DB 0
DIG1 DB 0
DIG2 DB 0

MENU DB 13, 10, '--- CALCULADORA EM ASSEMBLY ---', 13, 10
     DB '1. Soma', 13, 10
     DB '2. Subtracao', 13, 10
     DB '3. Multiplicacao', 13, 10
     DB '4. Divisao', 13, 10
     DB 'Escolha uma opcao: $'

PEDIR1 DB 13, 10, 'Digite o primeiro numero (0 a 9): $'
PEDIR2 DB 13, 10, 'Digite o segundo numero (0 a 9): $'
MSG_RESULTADO DB 13, 10, 'Resultado: $'
MSG_ENTER DB 13, 10, 13, 10, '$'

FIM:
    MOV AH, 4Ch
    INT 21h
