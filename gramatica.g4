lexer grammar gramatica;

fragment
ESC_SEQ	: '\\\'';

// Definicao das palavras chave
PALAVRA_CHAVE
    : 'algoritmo' | 'declare' | 'literal' | 'inteiro' | 'real' | 'logico' | 'ou' | 'nao' | 'leia' | 'se' | 'fim_se' 
    | 'senao' | 'entao' | 'falso' | 'verdadeiro' | 'caso' | 'e' | 'fim_caso' | 'escreva' | 'seja' | 'para' | 'ate' | 'faca' 
    | 'fim_para' | 'enquanto' | 'fim_enquanto' | 'registro' | 'fim_registro' | 'tipo' | 'procedimento' 
    | 'var' | 'fim_procedimento' | 'funcao' | 'fim_funcao' | 'retorne' | 'constante' | 'fim_algoritmo'
    ;

// Numeros inteiros e reais
NUM_INT 
    :   ('0'..'9')+ ;

NUM_REAL 
    :   ('0'..'9')+('.'('0'..'9')+)?
    ;

// Identificadores
IDENT
    :   ([a-zA-Z])([a-zA-Z]|'0'..'9'|'_')*
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
    :   '{' (~('\n'|'\r'|'{'|'}'))* '}' '\r'? '\n'? -> skip
    ;

COMENTARIO_NAO_FECHADO
    :   '{' (~('\n'|'\r'|'{'|'}'))* '\r'? '\n'?
    ;

CADEIA
    :   '"' ( ESC_SEQ | ~('"'|'\\'|'\n'|'\r') )* '"'
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