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

ID: (MINUS | LETTER)(LETTER | DIGIT)*;

ASSING_OP: EQUAL | PLUS EQUAL | MINUS EQUAL;


NUMBER: (DIGIT* | MINUS DIGIT*);

SOMA: (NUMBER PLUS NUMBER);

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
DIGIT: ('0'..'9');
