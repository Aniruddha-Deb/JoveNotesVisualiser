qa "@qa"
fib "@fib"
definition "@definition"
truefalse "@true_false"
subject "subject"
chapterNumber "chapterNumber"
chapterName "chapterName"
whitespace [ \t\n\r]

string ([a-zA-Z_]?\"(\\.|[^\\"])*\")
float ([0-9]+"."[0-9]+)

%{
#include <stdio.h>
%}

%%
{qa}{whitespace}*({string}{whitespace}*({string}{whitespace}*)*) printf( "question answer\n" );
{fib}{whitespace}*({string}{whitespace}*({string}{whitespace}*)*) printf( "fib\n" );
{definition}{whitespace}*({string}{whitespace}*({string}{whitespace}*)*) printf( "definition\n" );
{truefalse}{whitespace}*{string}{whitespace}*("true"|"false"){whitespace}*({string}{whitespace}*)*
{subject}{whitespace}*{string} printf( "Subject\n" );
{chapterNumber}{whitespace}*{float} printf( "Chapter number\n" );
{chapterName}{whitespace}*{string} printf( "Chapter name\n" );
%%