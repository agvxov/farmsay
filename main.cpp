#include <stdio.h>
#include <string.h>

#include "farmsay.tab.h"

inline
void line(const char c, const int n) {
    putc(' ', stdout);
    for (int i = 0; i < n-2; i++) {
        putc(c, stdout);
    }
    putc('\n', stdout);
}

void frame(const char f, const int b, const char * s) {
    const int WIDTH = 24;

    line(f, WIDTH);

    const int l = strlen(s);
    for (int i = 0; i < (l / (WIDTH-4)) + 1; i++) {
        printf("%c %-20.20s %c\n", f, s + (i*(WIDTH-4)), f);
    }
    
    line(f, WIDTH);

    for (int i = 0; i < b; i++) {
        putc(' ', stdout);
    }

    fputs("|/\n", stdout);
}

void bison_say(const char * const s) {
    const char * const BISON =
        " .xxx###;=>\n"
        ":xxxx####> \n"
        " L    p    \n"
    ;
    fputs("\033[31m", stdout);
    frame('*', 12, s);
    puts(BISON);
    fputs("\033[0m", stdout);
}

void snake_say(const char * const s) {
    const char * const SNAKE =
        "  .~-\n"
        "  '. \n"
        " :..;\n"
    ;
    fputs("\033[32m", stdout);
    frame(';', 7, s);
    puts(SNAKE);
    fputs("\033[0m", stdout);
}

void sheep_say(const char * const s) {
    const char * const SHEEP =
        "  ____ o=\n"
        ",######[ \n"
        "  l  l   \n"
    ;
    fputs("\033[33m", stdout);
    frame('o', 10, s);
    puts(SHEEP);
    fputs("\033[0m", stdout);
}


signed main(int argc, char * * argv) {
    yyparse();
    return 0;
}
