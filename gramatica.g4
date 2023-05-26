lexer grammar gramatica;

fragment
ESC_SEQ	: '\\\'';

// Definicao das palavras chave
PALAVRA_CHAVE
    : 'algoritmo' | 'fim_algoritmo'| 'declare' | 'literal' | 'inteiro' | 'real' | 'logico' | 'ou' | 'nao' | 'leia' | 'se' | 'fim_se' 
    | 'senao' | 'entao' | 'falso' | 'verdadeiro' | 'caso' | 'fim_caso' | 'e' | 'escreva' | 'seja' | 'para' | 'fim_para' | 'ate' | 'faca' 
    | 'enquanto' | 'fim_enquanto' | 'registro' | 'fim_registro' | 'tipo' | 'procedimento' | 'fim_procedimento' 
    | 'var' | 'funcao' | 'fim_funcao' | 'retorne' | 'constante' 
    ;

// Numeros inteiros e reais
NUM_INT 
    :   ('0'..'9')+ ;

NUM_REAL 
    :   ('0'..'9')+('.'('0'..'9')+)?
    ;

// Identificadores
IDENT
    :   [a-zA-Z][a-zA-Z0-9_]*
    ;

// Ignorando White Space
WS  
    :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) -> skip
    ;

// Ignorando comentario, mas acusando erro de comentario nao fechado
COMENTARIO
    :   '{' ~[\r\n{}]* '}' [\r]? [\n]? -> skip
    ;

COMENTARIO_NAO_FECHADO
    :   '{' (~('\n'|'\r'|'{'|'}'))* '\r'? '\n'?
    ;

CADEIA
    :   '"' (~["\\\r\n] | ESC_SEQ)* '"'
	;

// Acusando erro de cadeia literal nao fechada
CADEIA_LITERAL_NAO_FECHADA
    :   '"' ( ESC_SEQ | ~('"'|'\\') )* '\r'? '\n'?
    ;

DOIS_PONTOS: ':' | '..';

ABRE_PARENTESES: '(' | '[';

FECHA_PARENTESES: ')' | ']';

VIRGULA: ',' ;

// Operadores
OP_RELACIONAL	:	'>' | '>=' | '<' | '<=' | '<>' | '=';

OP_ATRIBUICAO : '<-';

OP_ACESSO: '.';

OP_ARITMETICO	:	'+' | '-' | '*' | '/' | '%' | '^' | '&';

// Simbolos nao reconhecidos
NAO_RECONHECIDO : ~('a');