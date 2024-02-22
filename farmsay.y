%code{
    extern void yyerror(...);
}
%{
    #include "farmsay.yy.h"

    #include <string.h>
    #include <string>

    extern void bison_say(const char * const s);
    extern void snake_say(const char * const s);
    extern void sheep_say(const char * const s);

    using namespace std;
%}

%union {
    char * strval;
}

%token <strval> DOT BANG QUESTIONMARK
%token <strval> STRING
%type  <strval> sentence snake sheep bison

%%

speech: %empty
    | speech snake
    | speech bison
    | speech sheep
    ;

snake: sentence DOT          { snake_say($$); };
bison: sentence BANG         { bison_say($$); };
sheep: sentence QUESTIONMARK { sheep_say($$); };

sentence: STRING
    | sentence STRING
    ;

%%

void yyerror(...) { puts("\033[31m\033[7m!!!\033[0m"); }
