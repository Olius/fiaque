%{
#include <stdio.h>
%}

%union {
	double num;
}

%token	<num>	NUM

%left	'+' '-'
%left	'*' '/'
%left 	NEG

%type	<num>	expr

%%

input	: input expr '\n'	{ printf("%f\n", $2); }
	|
	| input      '\n'
	;

expr	: NUM
	| '(' expr ')'	{ $$ = $2; }
	| '+' expr %prec NEG	{ $$ = +$2; }
	| '-' expr %prec NEG	{ $$ = -$2; }
	| expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr { $$ = $1 / $3; }
	;
