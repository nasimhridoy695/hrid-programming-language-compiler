char [a-zA-Z]
digit [0-9]
bishesh [$_@]
space " "
newline "\n"
Datatype "inth"|"doubleh"|"floath"|"charh"|"stringh"
Operator "add"|"sub"|"multi"|"div"|"mod"|"pow"
rel_op "gt"|"lt"|"e"|"ne"|"gte"|"lte"
single_line_comment "//".*
multi_line_comment [/][*][A-Za-z0-9. \n]*[*][/]
cholok "cholok."[a-zA-Z]([a-zA-Z0-9])*
logical_operator "&&"|"||"|"!!"
header (#include<[a-zA-Z/]*.h>)


%{
	#include<stdio.h>
	#include "1907104.tab.h"
	#include <math.h>
	#include <string.h>
	lineNo = 1;
%}

%% 
","		{return COMMA;}
";"		{return SEMICOLON;}
":"		{return COLON;}
"display_var" { return SHOW_VAR;}
"display_str" {return SHOW_STR;}
"display_line" {return SHOW_LINE;}
"input" {return SCAN;}
{header}	{printf("This is a header\n");}
{digit}+ 	{
				yylval.val = atoi(yytext);
				return NUM;
			}

 
{single_line_comment} {
	printf("This is a single line comment\n");
}
{multi_line_comment} {
	printf("This is a multiple line comment\n");
}


"mainh"		{return MAIN;}
"func_"({char}|{digit}|{bishesh})+ {return FUNCTION;}
{cholok} { strcpy(yylval.text,yytext);return ID;}
[\n]	{lineNo++;printf("\n");}

"inth"			{ return INT;}
"doubleh"		{return DOUBLE;}
"floath"		{return FLOAT;}
"charh"		{return CHAR;}

"ifh"			{ return IF;}
"elseh"		{return ELSE;}
"elseifh"	{return ELSEIF;}
"switchh"		{return SWITCH;}
"defaulth"		{return DEFAULT;}


"fpb"		{ return FBS; }
"fpe"		{ return FBE; }
"spb"		{ return SBS; }
"spe"		{ return SBE; }


"for_loop"		{return FOR;}
"To"			{return TO;}
"inc_by"		{return INCREMENT_BY;}
"while" 		{return WHILE;}


"gt"		{return GT;}
"lt"		{return LT;}
"gte"		{return GE;}
"lte"		{return LE;}
"ne"		{return NE;}
"e"		{return EQ;}
"Less"  {return LESS;}
"Great" {return GREAT;}

. {}
"\""(.)*"\"" {strcpy(yylval.text,yytext);return STR;}

"add"		{return PLUS;}
"sub"		{return MINUS;}
"multi"		{return MUL;}
"div"		{return DIV;}
"mod"		{return MODULUS;}
"pow"		{return POWER;}

"assignh"	{return ASGN;} 



%%

int yywrap()
{
	return 1;
}

int main(){
   yyin = freopen("input.txt","r",stdin);
   yyout = freopen("output.txt","w",stdout);
   yyparse();
}