CREATE TABLE usuario (
    id       SERIAL PRIMARY KEY,
    nome     VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL UNIQUE,
    senha    VARCHAR(255) NOT NULL,
    username VARCHAR(50)  NOT NULL UNIQUE
);

CREATE TABLE cliente (
    id            VARCHAR(20)  PRIMARY KEY,
    nome_fantasia VARCHAR(255),
    razao_social  VARCHAR(255) NOT NULL,
    cpf_cnpj      VARCHAR(14)  NOT NULL UNIQUE,
    tipo          VARCHAR(8)   NOT NULL CHECK (tipo IN ('FISICO', 'JURIDICO')),
    email         VARCHAR(255),
    CHECK (
        (tipo = 'FISICO'   AND cpf_cnpj ~ '^[0-9]{11}$') OR
        (tipo = 'JURIDICO' AND cpf_cnpj ~ '^[0-9A-Z]{12}[0-9]{2}$')
    )
);

CREATE TABLE produto (
    id            SERIAL PRIMARY KEY,
    descricao     VARCHAR(255)  NOT NULL,
    departamento  VARCHAR(100),
    codigo_barras CHAR(13)      UNIQUE CHECK (codigo_barras ~ '^[0-9]{13}$'),
    preco         NUMERIC(10,2) NOT NULL CHECK (preco >= 0)
);
