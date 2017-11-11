whitespace [ \t\n\r]*
string ([a-zA-Z_]?\"(\\.|[^\\"])*\")
float ([0-9]+"."[0-9]+)

answer ({string}{whitespace})*
question ({string}{whitespace})
qa "@qa"{whitespace}
fib "@fib"{whitespace}
definition "@definition"{whitespace}
truefalse "@true_false"{whitespace}
subject "subject"{whitespace}
chapterNumber "chapterNumber"{whitespace}
chapterName "chapterName"{whitespace}

%{
#include <stdio.h>
%}

%%
{qa}{question}{answer} printf( "question answer\n" );
{fib}{question}{answer} printf( "fib\n" );
{definition}{question}{answer} printf( "definition\n" );
{truefalse}{question}("true"|"false"){whitespace}{answer} printf( "true_false\n");
{subject}{string}{whitespace} printf( "Subject\n" );
{chapterNumber}{float}{whitespace} printf( "Chapter number\n" );
{chapterName}{string}{whitespace} printf( "Chapter name\n" );
%%