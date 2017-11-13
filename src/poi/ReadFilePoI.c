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

    FILE* fp = fopen( "/Users/Sensei/JoveNotes/JoveNotes-X/Class-10/Physics/12 - Thermionic Emission/12.1 - Thermionic Emission (qa).jn", "r" );
    FILE* fout = fopen( "/Users/Sensei/temp/cout.txt", "w" );

    if( fp == NULL ) {
        printf("Could not open file\n");
        return -1;
    }

    char tempChar;
    while( (tempChar=fgetc( fp )) != EOF ) {
        if( (int)tempChar <= 32 ) {
            // whitespace: do nothing
        }
        else if( tempChar == '\"' ) {
            char *str = malloc( 2 * sizeof( char ) );
            str[0] = tempChar;
            str[1] = '\0';

            while( (tempChar=fgetc( fp )) ) {
                int len = strlen( str );
                str = realloc( str, (len+2)*sizeof( char ) );
                str[len] = tempChar;
                str[len+1] = '\0';
                if( str[len] == '\"' && str[len-1] != '\\' ) {
                    fprintf(fout, "%s", str );
                    break;                    
                }
            }
            free( str );
        }
    }

    fclose( fp );
    fclose( fout );

    return 0;
}
