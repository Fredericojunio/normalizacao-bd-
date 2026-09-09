-- Esquema normalizado (4FN) — Sistema de Gestão de Funcionários

CREATE TABLE provincia (
    provincia   VARCHAR(50) PRIMARY KEY,
    pais        VARCHAR(50) NOT NULL
);

CREATE TABLE cidade (
    cidade      VARCHAR(50) PRIMARY KEY,
    provincia   VARCHAR(50) NOT NULL,
    FOREIGN KEY (provincia) REFERENCES provincia(provincia)
);

CREATE TABLE cargo (
    cod_cargo   VARCHAR(5) PRIMARY KEY,
    designacao  VARCHAR(100) NOT NULL
);

CREATE TABLE funcao (
    cod_funcao  VARCHAR(5) PRIMARY KEY,
    designacao  VARCHAR(100) NOT NULL
);

CREATE TABLE funcionario (
    nuit            VARCHAR(15) PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    data_nasc       DATE NOT NULL,
    bi              VARCHAR(20) NOT NULL UNIQUE,
    email           VARCHAR(150) NOT NULL UNIQUE,
    via             VARCHAR(150),
    numero          VARCHAR(20),
    bairro          VARCHAR(100),
    cidade          VARCHAR(50) NOT NULL,
    cod_cargo       VARCHAR(5) NOT NULL,
    cod_funcao      VARCHAR(5) NOT NULL,
    posto_trabalho  VARCHAR(100),
    data_admissao   DATE NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(cidade),
    FOREIGN KEY (cod_cargo) REFERENCES cargo(cod_cargo),
    FOREIGN KEY (cod_funcao) REFERENCES funcao(cod_funcao)
);

CREATE TABLE filho (
    id_filho    INT AUTO_INCREMENT PRIMARY KEY,
    nuit        VARCHAR(15) NOT NULL,
    nome_filho  VARCHAR(150) NOT NULL,
    FOREIGN KEY (nuit) REFERENCES funcionario(nuit)
);

CREATE TABLE telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    nuit        VARCHAR(15) NOT NULL,
    numero      VARCHAR(20) NOT NULL,
    FOREIGN KEY (nuit) REFERENCES funcionario(nuit)
);

-- Dados de referência (extraídos da tabela original)
INSERT INTO provincia VALUES
('Maputo Cidade','Moçambique'),('Maputo Província','Moçambique'),
('Gaza','Moçambique'),('Inhambane','Moçambique'),('Sofala','Moçambique'),
('Manica','Moçambique'),('Tete','Moçambique'),('Zambézia','Moçambique'),
('Cabo Delgado','Moçambique'),('Nampula','Moçambique');

INSERT INTO cidade VALUES
('Maputo','Maputo Cidade'),('Matola','Maputo Província'),
('Chókwè','Gaza'),('Maxixe','Inhambane'),('Beira','Sofala'),
('Chimoio','Manica'),('Tete','Tete'),('Quelimane','Zambézia'),
('Pemba','Cabo Delgado'),('Nampula','Nampula');

INSERT INTO cargo VALUES
('C01','Técnico de Informática'),('C02','Contabilista'),
('C03','Engenheiro Civil'),('C04','Enfermeiro'),('C05','Professor'),
('C06','Motorista'),('C07','Gestor de Recursos Humanos'),
('C08','Assistente Administrativo');

INSERT INTO funcao VALUES
('F01','Tecnologias de Informação'),('F02','Finanças'),
('F03','Engenharia'),('F04','Saúde'),('F05','Educação'),
('F06','Logística'),('F07','Recursos Humanos'),('F08','Administração');
