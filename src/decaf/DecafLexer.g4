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

VIRGULA: ',';
PTVIRGULA: ';';
LPARENTS: '(';
RPARENTS: ')';
LCOLCHETE: '[';
RCOLCHETE: ']';
LCURLY : '{';
RCURLY : '}';
IF: 'if';
BOOLEAN: 'boolean';
CALLOUT: 'callout';
CLASS: 'class';
ELSE: 'else';
FALSE: 'false';
INT: 'int';
RETURN: 'return';
TRUE: 'true';
FOR: 'for';
VOID: 'void';
BREAK: 'break';
CONTINUE: 'continue'; 
NUMBER: (NUM)+;
MENOS:'-';
EXCLA:'!';
TK_CLASS: 'class Program';


WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR: '\'' (ESC|'\\\\'|'a'..'z' |'A'..'Z'| '0'..'9') '\'';

HEXA : '0x'[a-fA-F0-9]+;

STRING: '"' (ESC|IDENTIFICADOR|NUM|' '|','|'?'|'.'|'%'|':'|'!'|'\\'|',' ~('"'))* '"';

HEX_CEPTION: '0x';

ID:  IDENTIFICADOR;

ATRIBUICAO: '=';
INCREMENTO:'+=';
DECREMENTO:'-=';
ARITH: '+'|'-'|'*'|'/'|'%';
IGUALDADE: '=='|'!=';
CONDICAO: '&&'|'||';
RELACAO: '<'|'>'|'<='|'>=';
fragment
ESC :  '\\' ('n'|'t'|'\''|'"');
fragment
NUM : ('0'..'9');
fragment
IDENTIFICADOR: ('a'..'z' | 'A'..'Z' | '_' |NUM)+;
