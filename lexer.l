%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[[:digit:]]+(.[[:digit:]]+)?	yylval.num = atof(yytext); return NUM;
[-+*/();]	return yytext[0];
[[:space:]]	;
.	fprintf(stderr, "unexpected character: %c\n", yytext[0]);
