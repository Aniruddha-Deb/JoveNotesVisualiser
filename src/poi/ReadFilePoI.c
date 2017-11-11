#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main( void ) {
    FILE* fp = fopen( "/Users/Sensei/JoveNotes/JoveNotes-X/Class-10/Physics/12 - Thermionic Emission/12.1 - Thermionic Emission (qa).jn", "r" );
    FILE* fout = fopen( "/Users/Sensei/temp/cout.txt", "w" );

    if( fp == NULL ) {
        printf("Could not open file\n");
        return -1;
    }

    char* buffer = malloc( 1024 );
    int numQA = 0;
    while( fscanf( fp, "%s ", buffer ) != EOF ) {        
        if( strncmp( buffer, "@qa", 3 ) == 0 ) {
            numQA++;
            fscanf( fp, "\"%[^\"]\"", buffer );
            fprintf( fout, "Question: %s\n", buffer );
            fscanf( fp, "\n\"%[^\"]\"", buffer );
            fprintf( fout, "Answer: %s\n", buffer );
        }
    }
    printf( "%d\n", numQA );
    free( buffer );
    fclose( fp );

    return 0;
}