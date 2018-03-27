lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

BOOLEAN: 'boolean';

BREAK: 'break';

CALLOUT: 'callout';

CLASS: 'class';

CONTINUE: 'continue';

ELSE: 'else';

FALSE: 'false';

FOR: 'for';

INT: 'int';

RETURN: 'return';

TRUE: 'true';

VOID: 'void';

LCURLY : '{';
RCURLY : '}';

fragment LETTER : ('a'..'z' | 'A'..'Z')+;

fragment MINUS: '-';

fragment PLUS: '+';

fragment DIGIT: ('0'..'9');

NUMBER: DIGIT | MINUS DIGIT;

SOMA: (NUMBER PLUS NUMBER);

ID: (MINUS | LETTER)(LETTER | DIGIT)*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'';

STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');



