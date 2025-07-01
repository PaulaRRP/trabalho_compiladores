# 🔤 PASSO 1: ANÁLISE LÉXICA

## Objetivo
Implementar **apenas** a análise léxica da linguagem Lang. O programa deve conseguir identificar todos os tokens da linguagem e retornar `true` se o arquivo está lexicamente correto, `false` caso contrário.

## 📁 Estrutura de Arquivos

```
lang-compiler/
├── src/parser
│   └── Lang.g4              # Gramática ANTLR (apenas regras léxicas)
├── src/examples/
│   ├── lexer_valid_1.lang   # Exemplos válidos
│   ├── lexer_valid_2.lang
│   ├── lexer_invalid_1.lang # Exemplos inválidos
│   └── lexer_invalid_2.lang
├── src/lib/
│   └── antlr-4.8-complete.jar
├── src/build/                   # Arquivos compilados
├── src/LexerTest.java          # Classe de teste
└── src/Makefile               # Automatização
```

## 🚀 Como Executar

### 1. Setup Inicial
```bash
# Criar estrutura de pastas
make setup

# Baixar ANTLR (se necessário)
make compile
```

### 2. Testar Análise Léxica

```bash
# Testar um arquivo específico
make test-lexer FILE=examples/lexer_valid_1.lang

# Testar todos os exemplos
make test-all

# Testar apenas exemplos válidos
make test-valid

# Testar apenas exemplos inválidos  
make test-invalid
```

### 3. Debug

```bash
# Ver tokens reconhecidos
make debug-tokens FILE=examples/lexer_valid_1.lang
```

## ✅ Resultado Esperado

### Exemplos Válidos (devem retornar TRUE):
- `lexer_valid_1.lang` - Tokens básicos
- `lexer_valid_2.lang` - Tokens completos
- `lexer_valid_3.lang` - Operadores e comentários
- `lexer_valid_4.lang` - Caracteres especiais

### Exemplos Inválidos (devem retornar FALSE):
- `lexer_invalid_1.lang` - Caractere inválido
- `lexer_invalid_2.lang` - Char mal formado
- `lexer_invalid_3.lang` - Float mal formado
- `lexer_invalid_4.lang` - Comentário mal formado

## 🔍 Tokens Implementados

### Palavras-chave:
`abstract`, `data`, `if`, `else`, `iterate`, `read`, `print`, `return`, `new`, `true`, `false`, `null`

### Tipos:
`Int`, `Char`, `Bool`, `Float`

### Identificadores:
- `ID`: `[a-z][a-zA-Z0-9_]*` (identificadores)
- `TYID`: `[A-Z][a-zA-Z0-9_]*` (nomes de tipos)

### Literais:
- `INT`: `[0-9]+`
- `FLOAT`: `[0-9]* '.' [0-9]+`
- `CHAR`: `'a'`, `'\n'`, `'\065'`

### Operadores:
- Aritméticos: `+`, `-`, `*`, `/`, `%`
- Lógicos: `&&`, `!`
- Relacionais: `<`, `==`, `!=`
- Atribuição: `=`

### Delimitadores:
`(`, `)`, `[`, `]`, `{`, `}`, `;`, `,`, `.`, `:`, `::`

### Comentários:
- Linha: `-- comentário`
- Bloco: `{- comentário -}`

## ⚠️ Importante

- **NÃO implementar sintática ainda** - apenas léxica
- A regra `program` é temporária para teste
- Foco em reconhecer tokens corretamente
- Validar com todos os exemplos

## ➡️ Próximo Passo

Após a léxica estar 100% funcionando, passaremos para o **Passo 2: Análise Sintática**.

## 🐛 Troubleshooting

### Erro: "Could not find or load main class"
```bash
make clean
make compile
```

### Erro: "ANTLR jar not found"
```bash
make $(ANTLR_JAR)  # Baixa automaticamente
```

### Tokens não reconhecidos
1. Verificar se estão na gramática `Lang.g4`
2. Recompilar: `make clean && make compile`
3. Testar debug: `make debug-tokens FILE=arquivo.lang`