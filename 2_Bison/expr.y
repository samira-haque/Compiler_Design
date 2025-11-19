%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
int yyerror(const char *s);
int result;   /* to store final result */
%}

/* Token */
%token NUM

/* Precedence and associativity */
%left '+' '-'
%left '*' '/' '%'
%right UMINUS

%%

/* Start symbol: one expression followed by end-of-input (newline) */
input
    : expr '\n'      { result = $1; printf("Result = %d\n", result); }
    | expr           { result = $1; printf("Result = %d\n", result); }
    ;

expr
    : expr '+' expr          { $$ = $1 + $3; }
    | expr '-' expr          { $$ = $1 - $3; }
    | expr '*' expr          { $$ = $1 * $3; }
    | expr '/' expr          { $$ = $1 / $3; }
    | expr '%' expr          { $$ = $1 % $3; }

    /* unary minus: -expr */
    | '-' expr %prec UMINUS  { $$ = -$2; }

    /* parentheses and square brackets */
    | '(' expr ')'           { $$ = $2; }
    | '[' expr ']'           { $$ = $2; }

    /* number */
    | NUM                    { $$ = $1; }
    ;

%%

int main(void)
{
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s)
{
    printf("Syntax error: %s\n", s);
    return 0;
}
