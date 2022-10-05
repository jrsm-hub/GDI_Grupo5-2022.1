-- TABELA PESSOA

CREATE TABLE tb_pessoa OF tp_pessoa(
    cpf PRIMARY KEY,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade  NOT NULL,
    endereco tp_endereco NOT NULL,

);


-- TABELA CLIENTE
CREATE TABLE tb_cliente OF tp_cliente(
    cpf PRIMARY KEY,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade NOT NULL,
    endereco tp_endereco NOT NULL,
    telefones tp_telefones NOT NULL,
    peso NOT NULL,
    altura NOT NULL,
    percentual_gordura NOT NULL,
    biotipo ,
    plano_saude NOT NULL
);


-- TABELA FUNCIONARIO

CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade NOT NULL,
    endereco NOT NULL,
    data_admissao NOT NULL,
    cargo NOT NULL,
    salario NOT NULL,
    gerente WITH ROWID REFERENCES tb_funcionario
);

-- TABELA NUTRICIONISTA

CREATE TABLE tb_nutricionista OF tp_nutricionista(
    cpf NOT NULL UNIQUE,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade NOT NULL,
    endereco NOT NULL,
    data_admissao NOT NULL,
    cargo NOT NULL,
    salario NOT NULL,
    gerente SCOPE IS tb_nutricionista,
    crn PRIMARY KEY
);

-- TABELA VENDEDOR

CREATE TABLE tb_vendedor OF tp_vendedor(
    cod_vendedor PRIMARY KEY,
    cpf NOT NULL UNIQUE,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade NOT NULL,
    endereco NOT NULL,
    data_admissao NOT NULL,
    cargo NOT NULL,
    salario NOT NULL,
    gerente SCOPE IS tb_vendedor
);

-- TABELA ATENDENTE

CREATE TABLE tb_atendente OF tp_atendente(
    Cod_Atendente PRIMARY KEY,
    cpf NOT NULL UNIQUE,
    nome NOT NULL,
    sexo NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
    idade NOT NULL,
    endereco NOT NULL,
    data_admissao NOT NULL,
    cargo NOT NULL,
    salario NOT NULL,
    gerente SCOPE IS tb_atendente
);

-- TABELA PRODUTO

CREATE TABLE tb_produto OF tp_produto(
    codigo_prod  PRIMARY KEY,
    nome_p NOT NULL,
    valor_compra NOT NULL,
    valor_revenda NOT NULL,
    estoque NOT NULL,
    data_fabricacao NOT NULL,
    data_vencimento NOT NULL
);



-- TABELA FABRICANTE

CREATE TABLE tb_fabricante OF tp_fabricante
NESTED TABLE prod_fornecido STORE AS tb_prod_fornecido;

-- TABELA CONSULTA

CREATE TABLE tb_consulta(
    cliente_consulta tp_cliente NOT NULL,
    nutricionista_consulta tp_nutricionista NOT NULL,
    prod_prescritos tp_nt_prescreve,
    data_hora_consulta TIMESTAMP
)
NESTED TABLE prod_prescritos STORE AS tb_prod_prescritos;

-- TABELA MARCAR CONSULTA

CREATE TABLE tb_MarcarConsulta(
    cliente_MarcarConsulta tp_cliente,
    atendente_MarcarConsulta tp_atendente,
    nutricionista_MarcarConsulta tp_nutricionista,
    data_hora_marcada TIMESTAMP
);

-- TABELA COMPRA

CREATE TABLE tb_compra(
    cliente_compra tp_cliente,
    vendedor_compra tp_vendedor,
    prod_comprados tp_nt_prod_compra,
    data_hora_compra TIMESTAMP
)
NESTED TABLE prod_comprados STORE AS tb_prod_comprados;

--- PODE SER QUE QUANDO FOR POVOAR SURJAM ALGUNS PROBLEMAS POR CONTA DO REF