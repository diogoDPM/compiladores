parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class ID LCURLY RCURLY EOF;

program: TK_class PALAVRASRESERVADAS EOF;

program: TK_class BOOLEAN  EOF;

program: TK_class ID  EOF;

program: TK_class CHAR EOF;

program: TK_class STRING  EOF;

program: TK_class NUMEROS  EOF;

program: TK_class IGUAL EOF;

program: TK_class OP  EOF;


program: TK_class 
PREFIXOHEXA  EOF;

program: TK_class 
COTEUDOCHAR  EOF;

program: TK_class 
LETRAS  EOF;

program: TK_class 
DIGITOS EOF;

program: TK_class 
ESC  EOF;

program: TK_class  SL_COMMENT EOF;

program: TK_class  WS_ EOF;
