%{
	/* 
	Hugo Brink 2016227204
	Madalena Santos 2016226726
	*/
	#include <stdio.h>
	#include <string.h>
	int yylex(void);
	int yylex_destroy();
	void yyerror(const char *s);
	int error = 0, printflag = 0;
%}

%union {
	char * string;
	//definir nó
}

%token SEMICOLON BLANKID PACKAGE RETURN AND ASSIGN STAR COMMA DIV EQ GE GT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PLUS RBRACE RPAR RSQ ELSE FOR IF VAR INT FLOAT32 BOOL STRING PRINT PARSEINT FUNC CMDARGS
%token <string> RESERVED STRLIT INTLIT ID REALLIT

%%
Program: PACKAGE ID SEMICOLON Declarations											{;};
Declarations: (VarDeclaration SEMICOLON)* | (FuncDeclaration SEMICOLON)* 			{;};
Type: INT | FLOAT32 | BOOL | STRING													{;};
VarDeclaration: VAR VarSpec															{;};
VarDeclaration: VAR LPAR VarSpec SEMICOLON RPAR										{;};
VarSpec: ID (COMMA ID)* Type														{;};





%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (strcmp(argv[1], "-l") == 0) {
            printflag = 1;
			yylex();
        }

		if (strcmp(argv[1], "-t") == 0) {
			printflag = 0;
			yyparse();
			if (!error) {
				//printtree();
			}
		}
    }

	else {
		printflag = 0;
		yyparse();
	}
	yylex_destroy();
    return 0;
}

void yyerror(const char * s) {
	printf("%s\n", s);
}