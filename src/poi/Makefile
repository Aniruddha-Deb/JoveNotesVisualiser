CC=gcc
LEX=lex
YACC=yacc
BIN_PATH="../../bin"

GTKDemo: GTKDemo.c 
	$(CC) `pkg-config --cflags --libs gtk+-2.0` -o "$(BIN_PATH)/GTKDemo" GTKDemo.c
	"$(BIN_PATH)/GTKDemo"

ReadFilePoI: ReadFilePoI.c
	$(CC) -o "$(BIN_PATH)/ReadFilePoI" ReadFilePoI.c
	"$(BIN_PATH)/ReadFilePoI"

LexPoI: LexPoI.l
	$(YACC) -d YaccPoI.y
	$(LEX) LexPoI.l
	$(CC) -o "$(BIN_PATH)/ReadFilePoI" -ll lex.yy.c y.tab.c ReadFilePoI.c -I y.tab.h 
	"$(BIN_PATH)/ReadFilePoI"