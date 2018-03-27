lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}


LCURLY : '{';
RCURLY : '}';

fragment LETTER : ('a'..'z' | 'A'..'Z')+;

NUMBER: DIGIT* | MINUS DIGIT*;

fragment MINUS: '-';

fragment Plus: '+';

fragment DIGIT: ('0'..'9');

ID: (MINUS | LETTER)(LETTER | DIGIT)*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'';

STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');



