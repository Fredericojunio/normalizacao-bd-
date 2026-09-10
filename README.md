# Normalização de Base de Dados — Sistema de Gestão de Funcionários

Trabalho Prático II — Tecnologia De BASE de DADOS — Licenciatura em Informática, Universidade Licungo.

Normalização de uma tabela não normalizada de funcionários (1FN → 4FN), culminando num modelo relacional bem desenhado.

## Estrutura do repositório

```
/documentos   → análise e justificação de cada forma normal (1FN a 4FN)
/diagramas    → Modelo Entidade-Relacionamento (MER), em Mermaid
/sql          → script DDL (schema.sql) e queries de exemplo com JOIN (queries.sql)
README.md     → este ficheiro
```

## Como consultar

1. **Análise da normalização**: `documentos/analise_normalizacao.md`
2. **Diagrama MER**: `diagramas/mer.md` (o GitHub renderiza o diagrama Mermaid automaticamente)
3. **Base de dados**: correr `sql/schema.sql` para criar as tabelas e inserir os dados de referência, depois `sql/queries.sql` para ver a reconstituição da informação original

## Resumo do esquema final

7 entidades: `FUNCIONARIO`, `CARGO`, `FUNCAO`, `CIDADE`, `PROVINCIA`, `FILHO`, `TELEFONE`, todas relacionadas em cardinalidade 1:N.
