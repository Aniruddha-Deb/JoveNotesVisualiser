%{
#include <stdio.h>
#include <string.h>
#include "parse_header.h"

void yyerror( const char* str ) {
    fprintf(stderr,"error: %s\n",str);
}
 
int yywrap() {
    return 1;
} 
%}

%union{
  char *str;
  float f;
}

%token <str> QA 
%token <str> FIB 
%token <str> DEFINITION 
%token <str> SUBJECT 
%token <str> CHPNUM 
%token <str> CHPNAME 
%token <str> STRING 
%token <f> FLOAT

%%
file: subject chpNum chpName qs
    ;

qs: qs question
  | question
  ;

question: qa
        | fib
        | defn
        ;

qa: QA STRING strings
  { printf( "qa\n" ); process_qa( $2, $3 ); } 
  ;

fib: FIB STRING strings
   { printf( "fib\n" ); process_fib( $2, $3 ); }
   ;

defn: DEFINITION STRING strings
    { printf( "defn\n"); process_definition( $2, $3 ); }
    ;

strings: strings STRING
       | STRING
       ;

subject: SUBJECT STRING 
       { printf( "Subject %s%s\n", $1, $2 ); }
       ;

chpNum: CHPNUM FLOAT 
       { printf( "chpNum %s%f\n", $1, $2 ); }
       ;

chpName: CHPNAME STRING 
       { printf( "chpName %s%s\n", $1, $2 ); }
       ;
%%