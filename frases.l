%{
// Reconhecedor de uma linguagem simplificada
#include <iostream>
using std::cout;
#include "frases.tab.h"
%}

%option noyywrap
delim	[ \\n]
space   {delim}+
letter	[A-Za-z_]
digit	[0-9]   
num	    {digit}+(\.{digit}+)?(E[+-]?{digit}+)?
comp    <|>|<>|=
chav    \{|\}
virg    \,
prts    \(|\)
pprt    has[A-Z]{letter}*|is[A-Z]{letter}*Of
card    {num}|xsd:integer\[{comp}+{num}\]
class   [A-Z]{letter}*
defin   Class:
sub     SubClassOf:
disj    DisjointClasses:
equiv   EquivalentTo:

%%
{space}	; // Não realizar nenhuma ação
some		return  SOME; 
all		    return ALL;
value		return VALUE;
min		    return MIN;
max		    return MAX;
exactly		return EXACTLY;
that		return THAT;
only        return ONLY;
not		    return NOT;
and		    return AND;
or		    return OR;
{chav}      return CHAVES;
{virg}      return VIRGULA;
{prts}      return PARENTHESIS;
{card}      return CARDINAL;
{pprt}      return PROPERTY;
{class}     return CLASS;
{defin}     return DEFIN;
{disj}      return DISJ;
{sub}       return SUB;
{equiv}     return EQUIV;
.           cout << "Erro léxico: \"" << yytext << "\" não reconhecido\n"; 
%%

// nenhuma função auxiliar é necessária
