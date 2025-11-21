%{
#include"cfg.tab.h"
%}
%%
[0-9]+	{yylval=atoi(yytext); return NUM;}
"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}
"%"	{return '%';}
"("	{return '(';}
")"	{return ')';}
"["	{return '[';}
"]"	{return ']';}

"\t"	{	}
"\n"	{return '\n';} 

%%

int yywrap()
{
return 1;
}