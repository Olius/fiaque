%{
#include <stdio.h>
%}

%union {
	double num;
}

%left	<num>	'+' '-'
%left	<num>	'*' '/'
%token	<num>	NUM

%type	<num>	expr num

%%

input	: input expr '\n'	{ printf("%f\n", $2); }
	|
	| input      '\n'
	;

expr	: num
	| expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr { $$ = $1 / $3; }
	| '(' expr ')'	{ $$ = $2; }
	;

num	:     NUM
	| '+' NUM	{ $$ = +$2; }
	| '-' NUM	{ $$ = -$2; }
	;
