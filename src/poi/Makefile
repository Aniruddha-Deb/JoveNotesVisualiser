CC=gcc
LEX=lex
BIN_PATH="../../bin"

GTKDemo: GTKDemo.c 
	$(CC) `pkg-config --cflags --libs gtk+-2.0` -o "$(BIN_PATH)/GTKDemo" GTKDemo.c
	"$(BIN_PATH)/GTKDemo"

ReadFilePoI: ReadFilePoI.c
	$(CC) -o "$(BIN_PATH)/ReadFilePoI" ReadFilePoI.c
	"$(BIN_PATH)/ReadFilePoI"

LexPoI: LexPoI.l
	$(LEX) LexPoI.l
	$(CC) -o "$(BIN_PATH)/LexPoI" -ll lex.yy.c
	"$(BIN_PATH)/LexPoI"