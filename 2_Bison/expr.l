%{
#include "expr.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUM; }
[ \t]+          { /* ignore spaces and tabs */ }
\n              { return '\n'; }
[+\-*/%\(\)\[\]]    { return yytext[0]; }
.               { /* skip unknown characters */ }

%%
int yywrap(void) { return 1; }
