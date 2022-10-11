%{
#include <iostream>
#include <string>
using namespace std;

#include "Lexer.hpp"
#undef YY_DECL
#define YY_DECL int Lexer::yylex()

%}

%option c++
%option outfile="Lexer.cpp"
%option yyclass="Lexer"


%%

\n          { line++; }
.           { cout<<"Error lexíco: "<<yytext<<" en la  línea "<<yylineno<<endl; return -1;}

%%
/*Sección de código de usuario*/
int yyFlexLexer::yywrap(){
    return 1;
}

int Lexer::getLine(){
    return line;
}

string Lexer::getTokVal(){
    return yytext;
}
