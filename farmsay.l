%{
    #include "farmsay.tab.h"
    extern void yyerror(...);
%}

%option noyywrap
%option nodefault

%%

<INITIAL>{
\.[[:space:]]*  { return DOT; }
\![[:space:]]*  { return BANG; }
\?[[:space:]]*  { return QUESTIONMARK; }
.               { yylval.strval = yytext; return STRING; }
\n              { ; }
}

%%
