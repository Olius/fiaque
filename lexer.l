%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[[:digit:]]+	yylval.num = atof(yytext); return NUM;
"<="	return LE;
">="	return GE;
[-+*/();<>=]	return yytext[0];
[[:space:]]	;
.	fprintf(stderr, "unexpected character: %c\n", yytext[0]);
