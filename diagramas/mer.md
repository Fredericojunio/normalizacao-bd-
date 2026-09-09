# Modelo Entidade-Relacionamento (MER)

> Ferramenta usada: **Mermaid** (renderiza automaticamente no GitHub). Se preferires, importa este mesmo esquema para o draw.io ou dbdiagram.io — a estrutura é idêntica.

```mermaid
erDiagram
    PROVINCIA ||--o{ CIDADE : "possui"
    CIDADE ||--o{ FUNCIONARIO : "reside em"
    CARGO ||--o{ FUNCIONARIO : "ocupa"
    FUNCAO ||--o{ FUNCIONARIO : "desempenha"
    FUNCIONARIO ||--o{ FILHO : "tem"
    FUNCIONARIO ||--o{ TELEFONE : "possui"

    PROVINCIA {
        string provincia PK
        string pais
    }
    CIDADE {
        string cidade PK
        string provincia FK
    }
    CARGO {
        string cod_cargo PK
        string designacao
    }
    FUNCAO {
        string cod_funcao PK
        string designacao
    }
    FUNCIONARIO {
        string nuit PK
        string nome
        date data_nasc
        string bi
        string email
        string via
        string numero
        string bairro
        string cidade FK
        string cod_cargo FK
        string cod_funcao FK
        string posto_trabalho
        date data_admissao
    }
    FILHO {
        int id_filho PK
        string nuit FK
        string nome_filho
    }
    TELEFONE {
        int id_telefone PK
        string nuit FK
        string numero
    }
```
