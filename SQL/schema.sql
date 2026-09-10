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

-- Funcionários (16 registos, extraídos da tabela original)
INSERT INTO funcionario (nuit, nome, data_nasc, bi, email, via, numero, bairro, cidade, cod_cargo, cod_funcao, posto_trabalho, data_admissao) VALUES
('100234567','Amélia Fernanda Cossa','1985-03-12','110100123456A','amelia.cossa@empresa.co.mz','Av. Julius Nyerere','245','Sommerschield','Maputo','C01','F01','Sede Maputo','2015-02-05'),
('100345678','Bernardo Alfredo Machava','1979-07-22','110100234567B','bernardo.machava@empresa.co.mz','Rua da Resistência','8','Polana Caniço','Maputo','C02','F02','Sede Maputo','2010-09-14'),
('100456789','Celina Armando Sitoe','1990-11-03','110200345678C','celina.sitoe@empresa.co.mz','Av. Samora Machel','12','Fomento','Matola','C08','F08','Delegação Matola','2018-06-01'),
('100567890','Domingos Paulo Nhantumbo','1982-01-30','110300456789D','domingos.nhantumbo@empresa.co.mz','Rua 3','56','Chókwè-Sede','Chókwè','C06','F06','Delegação Gaza','2012-03-10'),
('100678901','Eugénia Marta Muchanga','1988-05-18','110400567890E','eugenia.muchanga@empresa.co.mz','Av. Eduardo Mondlane','301','Maxixe-Sede','Maxixe','C04','F04','Delegação Inhambane','2016-08-20'),
('100789012','Fernando José Macuácua','1975-09-25','110500678901F','fernando.macuacua@empresa.co.mz','Av. Poder Popular','77','Macuti','Beira','C03','F03','Delegação Beira','2008-01-15'),
('100890123','Graça Isabel Zunguze','1992-12-07','110600789012G','graca.zunguze@empresa.co.mz','Rua da Frescura','19','Ponta Gêa','Beira','C05','F05','Delegação Beira','2019-02-02'),
('100901234','Hélder António Cuamba','1980-04-14','110700890123H','helder.cuamba@empresa.co.mz','Av. 25 de Setembro','150','Alto Maé','Maputo','C07','F07','Sede Maputo','2011-11-11'),
('101012345','Ivete Sara Chirindza','1995-06-29','110800901234I','ivete.chirindza@empresa.co.mz','Rua do Bagamoyo','5','Muhipiti','Nampula','C01','F01','Delegação Nampula','2020-07-03'),
('101123456','João Baptista Nhaca','1978-08-09','110900012345J','joao.nhaca@empresa.co.mz','Av. Josina Machel','200','Namahera','Nampula','C02','F02','Delegação Nampula','2009-05-25'),
('101234567','Lúcia Ermelinda Bila','1991-02-16','111000123456K','lucia.bila@empresa.co.mz','Rua da Base','33','Chaimite','Beira','C08','F08','Delegação Beira','2017-09-19'),
('101345678','Marcelino Inácio Tembe','1983-10-21','111100234567L','marcelino.tembe@empresa.co.mz','Av. Kwame Nkrumah','410','Coop','Maputo','C03','F03','Sede Maputo','2013-04-08'),
('101456789','Noémia Alzira Massingue','1987-03-04','111200345678M','noemia.massingue@empresa.co.mz','Rua de Chimoio','67','Chingussura','Chimoio','C04','F04','Delegação Manica','2014-12-12'),
('101567890','Osvaldo Simião Ubisse','1976-07-27','111300456789N','osvaldo.ubisse@empresa.co.mz','Av. 7 de Setembro','90','Matundo','Tete','C06','F06','Delegação Tete','2006-10-30'),
('101678901','Paulina Fátima Uache','1993-01-15','111400567890O','paulina.uache@empresa.co.mz','Rua da Missão','24','Chalaua','Quelimane','C05','F05','Delegação Zambézia','2021-09-09'),
('101789012','Ricardo Manuel Come','1981-06-02','111500678901P','ricardo.come@empresa.co.mz','Av. Franqueza','18','Chuwaula','Pemba','C07','F07','Delegação Cabo Delgado','2010-07-17');

-- Filhos (grupo repetitivo eliminado na 1FN)
INSERT INTO filho (nuit, nome_filho) VALUES
('100234567','Cátia Cossa'),
('100345678','Nelson Machava'),('100345678','Ivete Machava'),('100345678','Suzana Machava'),
('100567890','Paulo Nhantumbo Jr'),('100567890','Alzira Nhantumbo'),
('100678901','Marta Muchanga'),
('100789012','José Macuácua'),('100789012','Beatriz Macuácua'),('100789012','Adriano Macuácua'),
('100901234','António Cuamba Jr'),('100901234','Filomena Cuamba'),
('101123456','Baptista Nhaca Jr'),
('101234567','Ermelinda Bila'),
('101345678','Inácio Tembe Jr'),('101345678','Rosa Tembe'),
('101567890','Simião Ubisse Jr'),('101567890','Alcinda Ubisse'),('101567890','Custódio Ubisse'),
('101789012','Manuel Come Jr');

-- Telefones (grupo repetitivo eliminado na 1FN)
INSERT INTO telefone (nuit, numero) VALUES
('100234567','841234567'),('100234567','821234567'),
('100345678','845678901'),
('100456789','861122334'),
('100567890','847890123'),('100567890','878901234'),
('100678901','849012345'),
('100789012','823456789'),('100789012','843456789'),('100789012','863456789'),
('100890123','844567890'),('100890123','824567890'),
('100901234','825678901'),
('101012345','846789012'),
('101123456','827890123'),('101123456','847890124'),
('101234567','848901234'),
('101345678','829012345'),('101345678','849012346'),('101345678','869012347'),
('101456789','841122334'),
('101567890','822233445'),('101567890','842233445'),
('101678901','843344556'),
('101789012','824455667'),('101789012','844455667');

