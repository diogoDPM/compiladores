lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

RESERVADAS : 'boolean' | 'break' | 'callout' | 'class' | 'continue' | 
'else' | 'for' | 'int' | 'return' | 'void' | 'if';

BOOLEAN : 'true'|'false';

LCURLY : '{';
RCURLY : '}';

ID: (MINUS | LETTER)(LETTER | DIGITO)*;

OPERADOR: EQUAL | PLUS EQUAL | MINUS EQUAL;


NUMERO: (DIGITO* | MINUS DIGITO*);

SOMA: (NUMERO PLUS NUMERO);

CTRLBARRA: '\n' | '\t' | '\\' | '\"';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'' LETTER;

STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');

fragment 
LETTER : ('a'..'z' | 'A'..'Z')+;

fragment 
MINUS: '-';

fragment 
PLUS: '+';

fragment 
EQUAL: '=';

fragment 
DIGITO: ('0'..'9');
