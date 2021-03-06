/* recognize tokens for the calculator and print them out */
%{
# include "sql.tab.h"
%}

%%
SELECT                          {printf("<%s> ",yytext ); return SELECT;}
PROJECT                         {printf("<%s> ",yytext ); return PROJECT;}
CARTESIAN_PRODUCT               {printf("<%s> ",yytext ); return CARTESIAN_PRODUCT;}
EQUI_JOIN                       {printf("<%s> ",yytext ); return EQUI_JOIN;}
"<="                            {printf("<%s> ",yytext ); return LESS_EQUAL;}
">="                            {printf("<%s> ",yytext ); return GREATER_EQUAL;}
"!="                            {printf("<%s> ",yytext ); return NOT_EQUAL;}
"<"                             {printf("<%s> ",yytext ); return LESS_THAN;}
">"                             {printf("<%s> ",yytext ); return GREATER_THAN;}
"="                             {printf("<%s> ",yytext ); return EQUAL;}
"AND"                           {printf("<%s> ",yytext ); return AND;}
"OR"                            {printf("<%s> ",yytext ); return OR;}
"NOT"                           {printf("<%s> ",yytext ); printf("<%s> ",yytext ); return NOT;}
,                               {printf("<%s> ",yytext ); return COMMA;}
\.                              {printf("<%s> ",yytext ); return DOT;}
'[A-Za-z_][0-9A-Za-z_]*'        {printf("<%s> ",yytext ); return STRING_IN_QUOTES;}
[(]                             {printf("<%s> ",yytext ); return LP;}
[)]                             {printf("<%s> ",yytext ); return RP;}
[A-Za-z_][0-9A-Za-z_]*          {printf("<%s> ",yytext ); return IDENTIFIER; }
[0-9]+                          {printf("<%s> ",yytext ); return INTEGER; }
\n                              {printf("%s ",yytext ); yylineno++; return NEWLINE; }
[ \t]                           {/* ignore whitespace */ }
.                               {printf("Unknown character %c\n", *yytext);}
%%
