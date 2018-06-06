lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
LPARENT:'(';
RPARENT:')';
LBRACKET:'[';
RBRACKET:']';
PONTOVIR:';';
VIRGULA :',';
MULT:'*';
DIV:'/';
SUB: '-';
SUM: '+';
EXP:'^';
REST:'%';
EXCL:'!';
AND: '&&';
OR: '||';
IGUALDADE:'==';
DIFERENTE:'!=';
MAIOR: '>';
MENOR: '<';
MAIORIG:'>=';
MENORIG: '<=';
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';
PROGRAMA:'Program'; 
BOOLEANO:'boolean'; 
CHAMAR:'callout';
CLASSE:'class';
SENAO:'else';
FALSO:'false' ;
SE:'if';
INTEIRO:'int';
RETORNO:'return';
VERDADEIRO:'true';
VOID:'void';
PARA:'for';
FORPAR:'forpar';
BREAK:'break';
CONTINUA: 'continue';

ESPECIAIS:'#'|'$'|'&'|'.'|':'|'?'|'@'|'_'|'`'|'|'|'~';

HEX: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
NUMEROPOSITIVO:[0-9]+;

CHARLITERAL: '\''(ESC|CHAR|ESPECIAIS)'\'';
STRING: '"' (ESC|CHAR|RCURLY|LPARENT|RPARENT|
LBRACKET|
RBRACKET|
PONTOVIR|	
VIRGULA|
MULT|
DIV|
SUB|
SUM|
EXP|
REST|
EXCL|
AND|
OR|
IGUALDADE|
DIFERENTE|
MAIOR| 
MENOR|
MAIORIG|
MENORIG|
INCREMENTO|
DECREMENTO|
ATRIBUICAO|
PROGRAMA| 
BOOLEANO| 
CHAMAR|
CLASSE|
SENAO|
FALSO|
SE|
INTEIRO|
RETORNO|
VERDADEIRO|
VOID|
PARA|
FORPAR|
BREAK|
CONTINUA|
ESPECIAIS|
HEX|
NUMEROPOSITIVO|
LCURLY|'\\'|~('"'))*'"';
INTEGER_LITERAL: HEX|NUMEROPOSITIVO;
TIPOS: BOOLEANO|INTEIRO;
ID: [_a-zA-Z][0-9_a-zA-Z]*;

WS_ : (' '|'\n'|'\t'|'\r')+ -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;	

fragment CHAR:('a'..'z'|'A'..'Z'|'0'..'9');
fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
