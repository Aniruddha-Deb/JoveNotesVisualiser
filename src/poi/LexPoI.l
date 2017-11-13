whitespace [ \t\n\r]*
string (\"(\\.|[^\\"])*\")
float ([0-9]+"."[0-9]+)

qa "@qa"
fib "@fib"
definition "@definition"
truefalse "@true_false"
subject "subject"
chapterNumber "chapterNumber"
chapterName "chapterName"

%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>
%}

%%
{whitespace}    /* ignore*/;
{string}        yylval.str=strdup( yytext ); return STRING;
{float}         yylval.f  = atof( yytext );  return FLOAT;
{qa}            yylval.str=strdup( yytext ); return QA;
{fib}           yylval.str=strdup( yytext ); return FIB;
{definition}    yylval.str=strdup( yytext ); return DEFINITION;
{truefalse}     ;
{subject}       yylval.str=strdup( yytext ); return SUBJECT;
{chapterNumber} yylval.str=strdup( yytext ); return CHPNUM;
{chapterName}   yylval.str=strdup( yytext ); return CHPNAME;
%%