parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}



program: CLASSE PROGRAMA LCURLY (field_decl|method_decl)* RCURLY EOF;

field_decl: type ID (VIRGULA parametro)* PONTOVIR
            |type ID LBRACKET int_literal RBRACKET (VIRGULA parametro LBRACKET int_literal RBRACKET)* PONTOVIR;
            
          

            
method_decl: (type|VOID) ID LPARENT(parametro(VIRGULA parametro)*)? RPARENT block;
parametro: type ID;
block: LCURLY (var_decl|statement)* RCURLY;

assign_op:ATRIBUICAO
         |DECREMENTO
         |INCREMENTO;

//var_decl: type ID PONTOVIR
//          |type VIRGULA ID * PONTOVIR;
var_decl: type ID(variaveis)*PONTOVIR;
variaveis: VIRGULA ID;

type: INTEIRO|BOOLEANO;
statement:location assign_op expr PONTOVIR
         |method_call PONTOVIR
         |SE LPARENT expr RPARENT block (SENAO block)?
         |PARA ID assign_op expr VIRGULA expr block 
         |RETORNO (expr)? PONTOVIR
         |BREAK PONTOVIR
         |CONTINUA PONTOVIR
         |block; 

method_call:method_name LPARENT (expr(VIRGULA expr)*)? RPARENT
           |CHAMAR LPARENT(string_literal(VIRGULA call_arg(VIRGULA call_arg)*)?) RPARENT;
location: ID|ID LBRACKET expr RBRACKET;  

expr:location
      |method_call
      |literal
      |expr bin_op expr
      |SUB expr
      |EXCL expr
      |LPARENT expr RPARENT;

method_name:ID;
call_arg: expr|string_literal;
bin_op: aritmeticos|rel_op|eq_op|cond_op;
aritmeticos:MULT|DIV|SUB|SUM|REST|EXP;
rel_op:MAIOR|MENOR|MAIORIG|MENORIG;
eq_op: IGUALDADE|DIFERENTE;
cond_op:AND|OR;

literal:int_literal|char_literal|bool_literal;

int_literal: decimal_literal|hex_literal;
decimal_literal: NUMEROPOSITIVO;
hex_literal: HEX;
bool_literal: VERDADEIRO|FALSO;
char_literal: CHARLITERAL;
string_literal:STRING;
