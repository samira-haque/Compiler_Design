/*Lex Program to recognize and display keywords, numbers and words in a given statement */
%{
#include<stdio.h>
%}

%%

if      { printf("%s is a keyword\n", yytext); }
else    { printf("%s is a keyword\n", yytext); }
printf  { printf("%s is a keyword\n", yytext); }
[0-9]+  { printf("%s is a number\n", yytext); }
[a-zA-Z]+ { printf("%s is a word\n", yytext); }
.|\n    { ECHO; }

%%

int main()
{
	printf("\n Enter the string: ");
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
