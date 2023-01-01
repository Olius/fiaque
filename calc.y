%{
#include <stdio.h>
%}

%union {
	double num;
	int bool;
}

%token	<num>	NUM

%nonassoc '=' '<' '>' LE GE

%left	'+' '-'
%left	'*' '/'
%left 	NEG

%type	<num>	nexpr
%type	<bool>	bexpr

%%

input	: input nexpr ';'	{ printf("%f\n", $2); }
	| input bexpr ';'	{ printf("%s\n", $2 ? "true" : "false"); }
	|
	;

bexpr	: nexpr '=' nexpr	{ $$ = $1 == $3; }
	| nexpr '<' nexpr	{ $$ = $1 <  $3; }
	| nexpr '>' nexpr	{ $$ = $1 >  $3; }
	| nexpr LE  nexpr	{ $$ = $1 <= $3; }
	| nexpr GE  nexpr	{ $$ = $1 >= $3; }
	;

nexpr	: NUM
	| '(' nexpr ')'	{ $$ = $2; }
	| '+' nexpr %prec NEG	{ $$ = +$2; }
	| '-' nexpr %prec NEG	{ $$ = -$2; }
	| nexpr '+' nexpr	{ $$ = $1 + $3; }
	| nexpr '-' nexpr	{ $$ = $1 - $3; }
	| nexpr '*' nexpr	{ $$ = $1 * $3; }
	| nexpr '/' nexpr	{ $$ = $1 / $3; }
	;
