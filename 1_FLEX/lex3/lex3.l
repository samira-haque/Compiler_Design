/*Lex program to count the number of vowels & consonants from the given input string. */
%{
#include<stdio.h>
int v=0, c=0;
%}

%%

[ \t\n]+        ;               /* skip whitespace (space, tab, newline) */
[aeiouAEIOU]    { v++; }
[^aeiouAEIOU]   { c++; }

%%

int main()
{
    printf("Enter the input string:\n");
    yylex();
    printf("No of vowels are %d\n", v);
    printf("No of consonents are %d\n", c);

}

int yywrap()
{
    return 1;
}
