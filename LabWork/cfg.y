%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex(void);
extern int yyerror(const char *s);
%}

%token NUM;
%left '+''-'
%left '*''/''%'
%left '(' ')'
%left '[' ']'


%%
S:
E '\n'		{printf("The Result Is: %d\n",$1);}
;
E:
 E'+'E		{$$ = $1+$3;}
|E'-'E		{$$ = $1-$3;}
|E'*'E	 	{$$ = $1*$3;}
|E'/'E		{$$ = $1/$3;}
|E'%'E	  	{$$ = $1%$3;}
|E'['E']'       {$$ = $1 * $3;}
|'-'E	 	{$$ = -$2;}
|'('E')'	{$$ = $2;}
|'['E']'	{$$ = $2;}
|NUM		{$$ = $1;}
;
%%

int main()
{
printf("Enter the expression: \n");
yyparse();
return 0;
}

int yyerror(const char *s)
{
printf("Error\n");
return 0;
}










