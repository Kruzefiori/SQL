CREATE TABLE cliente(
	no_cliente INTEGER PRIMARY KEY,
	nome VARCHAR(200) UNIQUE NOT NULL,
	cgcj BIGINT UNIQUE NOT NULL
);

CREATE TABLE projeto(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(200) UNIQUE NOT NULL,
	no_cliente INTEGER NOT NULL,
	CONSTRAINT "FK_no_cliente" 
		FOREIGN KEY (no_cliente)
		REFERENCES public.cliente(no_cliente)
);

CREATE TABLE desenvolvedor(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(200) UNIQUE NOT NULL,
	custo FLOAT CHECK(custo >0)
);

CREATE TABLE alocacao(
	codigo INTEGER NOT NULL ,
	id INTEGER NOT NULL,
	de DATE NOT NULL,
	ate DATE NOT NULL,
	PRIMARY KEY (codigo , id , de),
	CONSTRAINT fk_projeto FOREIGN KEY(id)
	REFERENCES public.projeto(id),
	CONSTRAINT fk_dev FOREIGN KEY(codigo)
	REFERENCES public.desenvolvedor(codigo)
);