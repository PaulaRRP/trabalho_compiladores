grammar lang;

@parser::header
{
    package parser;
}

@lexer::header
{
    package parser;
}

/* Regras da gramática */

prog: (stmt ';')+;

stmt :
 ID '=' expr
|
 expr '?' '[' stmt ']' ':' '[' stmt ']'
|
 expr '?' '[' stmt ']'
|
 expr
;

expr:
 term '+' expr
|
 term
;

term:
 factor '*' term
|
 factor
;

factor:
 ID
|
 INT
;

/* Regras léxicas */

ABSTRACT: 'abstract';
DATA: 'data';
IF: 'if';
ELSE: 'else';
ITERATE: 'iterate';
READ: 'read';
PRINT: 'print';
RETURN: 'return';
NEW: 'new';
TRUE: 'true';
FALSE: 'false';
NULL: 'null';
INT_TYPE: 'Int';
CHAR_TYPE: 'Char';
BOOL_TYPE: 'Bool';
FLOAT_TYPE: 'Float';

DOUBLE_COLON: '::';
EQUAL: '==';
NOT_EQUAL: '!=';
AND: '&&';

LPAREN: '(';
RPAREN: ')';
LBRACKET: '[';
RBRACKET: ']';
LBRACE: '{';
RBRACE: '}';
LT: '<';
GT: '>';
SEMICOLON: ';';
COLON: ':';
DOT: '.';
COMMA: ',';
ASSIGN: '=';
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
MODULO: '%';
NOT: '!';

TYID: [A-Z][a-zA-Z0-9_]*;
ID: [a-zA-Z_][a-zA-Z0-9_]*;

INT: [0-9]+;
FLOAT: [0-9]+ '.' [0-9]+;
CHAR: '\'' (
    ~['\\]
    | '\\' [ntrb\\']
    | '\\' [0-9][0-9][0-9]
) '\'';

NEWLINE: '\r'? '\n' -> skip;
WS : [ \t]+ -> skip;
LINE_COMMENT : '--' ~('\r' | '\n')* NEWLINE -> skip;
COMMENT: '{-' .*? '-}' -> skip;

