lexer grammar gramatica;

PALAVRA_CHAVE
    : 'algoritmo' | 'declare' | 'literal' | 'inteiro' | 'real' | 'logico' | 'ou' | 'nao' | 'leia' | 'se' | 'fim_se' 
    | 'senao' | 'entao' | 'falso' | 'verdadeiro' | 'caso' | 'e' | 'fim_caso' | 'escreva' | 'seja' | 'para' | 'ate' | 'faca' 
    | 'fim_para' | 'enquanto' | 'fim_enquanto' | 'registro' | 'fim_registro' | 'tipo' | 'procedimento' 
    | 'var' | 'fim_procedimento' | 'funcao' | 'fim_funcao' | 'retorne' | 'constante' | 'fim_algoritmo'
    ;

NUM_INT : ('0'..'9')+ ;

NUM_REAL : ('0'..'9')+('.'('0'..'9')+)?;

IDENT
    : [A-Za-z_][A-Za-z0-9_]*
    ;

CADEIA
    : '"' ( ESC_SEQ | ~('\''|'\\') )* '"'
	;

fragment
ESC_SEQ	: '\\\'';


COMENTARIO
    :   '{' ~('\n'|'\r')* '\r'? '}' '\n' -> skip
    ;

WS  
    :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) -> skip
    ;

DOIS_PONTOS: ':' ;

ABRE_PARENTESES: '(' | '[';

FECHA_PARENTESES: ')' | ']';

VIRGULA: ',' ;

OP_RELACIONAL	:	'>' | '>=' | '<' | '<=' | '<>' | '=';

OP_ATRIBUICAO : '<-';

OP_ACESSO: '.';

OP_ARITMETICO	:	'+' | '-' | '*' | '/' | '%' | '^' | '&';

ERR : ~('a');