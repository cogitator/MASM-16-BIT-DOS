.386
ASSUME CS:code, DS:data, SS:stack

stack SEGMENT STACK
  DB 64 DUP (0)
stack ENDS

data SEGMENT para public 'DATA'
  NUM1 DB 00000100B ;4
  NUM2 DB 00000101B ;5
  NUM3 DB 00000011B ;3
  NUM4 DB 00001000B ;8
  ANS DB ?
data ENDS

code SEGMENT USE16 PARA PUBLIC 'CODE'
start:
  MOV AX, data
  MOV DS, AX

  MOV AL, NUM1
  CMP AL, NUM2
  JBE MAX_IS_NUM2
  CMP AL, NUM3
  JBE MAX_IS_NUM3
  CMP AL, NUM4
  JBE MAX_IS_NUM4
  JMP ANSWER

  MAX_IS_NUM2:
  MOV AL, NUM2
  CMP AL, NUM3
  JBE MAX_IS_NUM3
  CMP AL, NUM4
  JBE MAX_IS_NUM4
  JMP ANSWER

  MAX_IS_NUM3:
  MOV AL, NUM3
  CMP AL, NUM4
  JBE MAX_IS_NUM4
  JMP ANSWER

  MAX_IS_NUM4:
  MOV AL, NUM4

  ANSWER:
  MOV ANS, AL

  FIN:
  MOV AH, 4Ch
  INT 21h
code ENDS
END start
