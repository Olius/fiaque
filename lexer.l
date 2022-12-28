%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[[:digit:]]+	yylval.num = atof(yytext); return NUM;
[-+*/()\n]	return yytext[0];
[[:blank:]]	;
.	fprintf(stderr, "unexpected character: %c\n", yytext[0]);
