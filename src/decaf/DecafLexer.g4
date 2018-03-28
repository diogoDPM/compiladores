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

ID: (MINUS | LETTER)(LETTER | DIGIT)*;

fragment 
LETTER : ('a'..'z' | 'A'..'Z')+;

fragment 
MINUS: '-';

fragment 
PLUS: '+';

fragment 
EQUAL: '=';

ASSING_OP: EQUAL | PLUS EQUAL | MINUS EQUAL;

fragment 
DIGIT: ('0'..'9');

NUMBER: (DIGIT* | MINUS DIGIT*);

SOMA: (NUMBER PLUS NUMBER);

CTRLBARRA: '\n' | '\t' | '\\' | '\"';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'' LETTER;

STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');



