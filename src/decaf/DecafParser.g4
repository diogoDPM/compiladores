parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_CLASS LCURLY field_decl* method_decl* RCURLY;


field: type ID|type ID LCOLCHETE int_literal RCOLCHETE;


field_decl: field (VIRGULA field)* PTVIRGULA;

decl: VIRGULA type ID;
method_decl: (type|VOID) ID LPARENTS (type ID)? (type ID decl)* RPARENTS block;

block: LCURLY var_decl* statement* RCURLY;

var: type ID;
var_decl: var (VIRGULA var)* PTVIRGULA;

type: INT|BOOLEAN;	

statement: location assign_op expr PTVIRGULA
	| method_call PTVIRGULA
	|IF LPARENTS expr RPARENTS block (ELSE block)*
	|FOR ID assign_op expr VIRGULA expr block
	| RETURN (expr)* PTVIRGULA
	|BREAK PTVIRGULA;

assign_op: ATRIBUICAO|DECREMENTO|INCREMENTO;

call: VIRGULA expr;
method_call: ID LPARENTS expr* (expr call)* RPARENTS
	|CALLOUT LPARENTS string_literal (VIRGULA callout_arg)* RPARENTS;


location: ID|ID LCOLCHETE expr RCOLCHETE;

expr: location 
	|method_call 
	|literal 
	|MENOS expr 
	|expr (bin_op|MENOS) expr
	|FOR expr (VIRGULA ID)*
	|LPARENTS expr RPARENTS;

callout_arg: expr|string_literal;

bin_op: ARITH
	|RELACAO
	|IGUALDADE
	|CONDICAO;


literal:int_literal
	|CHAR
	|bool_literal;


int_literal:NUMBER|HEXA;

callout: string_literal (VIRGULA callout)*;


string_literal: STRING;

bool_literal:TRUE|FALSE;
