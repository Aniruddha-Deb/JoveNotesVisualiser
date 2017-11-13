#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse_header.h"
#include "y.tab.h"

void process_qa( char* question, char* answer ) {
    printf( "Processing qa %s -> %s\n", question, answer );    
}

void process_fib( char* question, char* blanks ) {
    printf( "Processing fib %s -> %s\n", question, blanks );    
}

void process_definition( char* question, char* definition ) {
    printf( "Processing definition %s -> %s\n", question, definition );    
}

int main( void ) {
    printf("Running\n");
    extern FILE* yyin;
    FILE* fout = fopen( "/Users/Sensei/temp/cout.txt", "w" );
    yyin = fopen( "/Users/Sensei/JoveNotes/JoveNotes-X/Class-10/Physics/12 - Thermionic Emission/12.1 - Thermionic Emission (qa).jn", "r" );
    if( yyin == NULL ) {
        printf("Could not open file\n");
        return -1;
    }
    yyparse();
    fclose( yyin );
    fclose( fout );

    return 0;
}
