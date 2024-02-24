%{
    #include "farmsay.yy.h"

    #include <string>
    #include <string.h>

    extern void bison_say(const char * const s);
    extern void snake_say(const char * const s);
    extern void sheep_say(const char * const s);
    extern void duck_say(const char * const s);

    void yyerror(...) { puts("\033[31m\033[7m!!!\033[0m"); }

    using namespace std;
%}
%union {
    char * strval;
}

%token DOT BANG QUESTIONMARK QUACK
%token <strval> STRING
%type  <strval> sentence
%%

speech: %empty
    | speech snake
    | speech bison
    | speech sheep
    | speech duck
    ;

snake: sentence DOT          { snake_say((string() + $1 + '.').c_str()); free($1); }; 
bison: sentence BANG         { bison_say((string() + $1 + '!').c_str()); free($1); };
sheep: sentence QUESTIONMARK { sheep_say((string() + $1 + '?').c_str()); free($1); };

duck:  QUACK sentence BANG   {  duck_say($2); free($2); };

sentence: STRING      { $$ = strdup($1); free($1); }
    | sentence STRING { $$ = strdup((string() + $1 + $2).c_str()); free($1); free($2); }
    ;

%%
