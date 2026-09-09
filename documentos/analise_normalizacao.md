# Normalização de Base de Dados — Sistema de Gestão de Funcionários

## 1. Identificação dos problemas na tabela original (0FN)

**Dados não atómicos**
- `Endereço` mistura via, número e bairro num único campo (ex.: "Av. Julius Nyerere, n.º 245, Sommerschield").

**Grupos repetitivos**
- `Filho 1`, `Filho 2`, `Filho 3`
- `Celular 1`, `Celular 2`, `Celular 3`

**Dependências funcionais identificadas** (chave candidata: `NUIT`)
- Total: `NUIT → Nome, DataNasc, BI, Email, Endereço, Cidade, Província, País, Cargo, CodCargo, Função, CodFunção, PostoTrabalho, DataAdmissão`
- Transitivas:
  - `NUIT → CodCargo → Cargo`
  - `NUIT → CodFunção → Função`
  - `NUIT → Cidade → Província → País`
  (prova: os códigos C01/F01, C02/F02, etc. repetem-se em vários funcionários com a mesma designação — redundância)
- Multivaloradas independentes: `NUIT →→ Filho` e `NUIT →→ Celular` (nenhuma relação entre qual filho corresponde a qual número).

**Anomalias resultantes**: inserção (não é possível registar um cargo sem funcionário), atualização (mudar a designação de um cargo obriga a alterar várias linhas), remoção (perder a informação de um cargo se o único funcionário associado sair).

## 2. 1.ª Forma Normal (1FN)

Eliminados os grupos repetitivos e o endereço decomposto em campos atómicos.

```
FUNCIONARIO(NUIT PK, Nome, DataNasc, BI, Email, Via, Numero, Bairro,
            Cidade, Provincia, Pais, Cargo, CodCargo, Funcao, CodFuncao,
            PostoTrabalho, DataAdmissao)
FILHO(idFilho PK, NUIT FK, NomeFilho)
TELEFONE(idTelefone PK, NUIT FK, Numero)
```

## 3. 2.ª Forma Normal (2FN)

A chave de `FUNCIONARIO` é atómica (`NUIT`), logo não há dependências parciais possíveis. Em `FILHO` e `TELEFONE`, os atributos dependem inteiramente da chave (surrogate + FK). **Nenhuma alteração estrutural necessária.**

## 4. 3.ª Forma Normal (3FN)

Eliminadas as dependências transitivas, extraindo os atributos que dependem apenas do código, não do funcionário:

```
CARGO(CodCargo PK, Designacao)
FUNCAO(CodFuncao PK, Designacao)
PROVINCIA(Provincia PK, Pais)
CIDADE(Cidade PK, Provincia FK)

FUNCIONARIO(NUIT PK, Nome, DataNasc, BI, Email, Via, Numero, Bairro,
            Cidade FK, CodCargo FK, CodFuncao FK, PostoTrabalho, DataAdmissao)
```

## 5. 4.ª Forma Normal (4FN)

A separação de `FILHO` e `TELEFONE` em tabelas distintas (já feita na 1FN) evita o produto cartesiano espúrio entre as duas dependências multivaloradas independentes. **Nenhuma alteração adicional necessária.**

## 6. Cardinalidades

| Relacionamento | Cardinalidade |
|---|---|
| CARGO — FUNCIONARIO | 1:N |
| FUNCAO — FUNCIONARIO | 1:N |
| CIDADE — FUNCIONARIO | 1:N |
| PROVINCIA — CIDADE | 1:N |
| FUNCIONARIO — FILHO | 1:N |
| FUNCIONARIO — TELEFONE | 1:N |

## 7. Esquema final (7 entidades)

| Entidade | PK | FK(s) |
|---|---|---|
| FUNCIONARIO | NUIT | Cidade, CodCargo, CodFuncao |
| CARGO | CodCargo | — |
| FUNCAO | CodFuncao | — |
| CIDADE | Cidade | Provincia |
| PROVINCIA | Provincia | — |
| FILHO | idFilho | NUIT |
| TELEFONE | idTelefone | NUIT |

Ver diagrama completo em `/diagramas/mer.md` e o script de criação em `/sql/schema.sql`.
