
create database db_tomorrows_water_2023;
 
use db_tomorrows_water_2023;
 
##TABELA ONG 
create table tbl_ong(
			 id int not null auto_increment primary key,
			 nome varchar(80) not null,
			 descricao text not null,
			 email varchar(255) not null,
			 area_atuacao varchar(150) not null,
			 data_fundacao date not null
);

insert into tbl_ong(
			nome, 
            descricao, 
            email, 
            area_atuacao, 
            data_fundacao
            ) values (
            'Tomorrows Water', 
            'Fortalecer as propostas da ODS 6, baseado no bem-estar da população, com acesso à saúde por meio da água e saneamento básico.',
			'tomorrowswater@gmail.com',
             'Saneamento e água potável',
             '1987-07-01'
             );

 
##TABELA PATROCINADOR
create table tbl_patrocinador(
			 id int not null auto_increment primary key,
             razao_social varchar(80) not null,
             cnpj varchar(45) not null,
			 tipo_patrocinio varchar(45) not null,
             setor_de_atuacao varchar(45) not null,
             email varchar(255) not null,
             pessoa_juridica varchar(50) not null,
             #chave estrangeira da ong 
			 id_ong int not null,
                        
			 constraint FK_Ong_Patrocinador
			 foreign key (id_ong)
			 references tbl_ong (id),
                        
			unique index(id)
);

##TABELA RECADO
create table tbl_recado(
			 id int not null auto_increment primary key,
             nome varchar(50) not null,
             email varchar(255) not null,
             mensagem text not null,
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Recado
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
);

##TABELA DE GENERO
 create table tbl_genero(
			 id int not null auto_increment primary key,
			 nome varchar(45) not null,
			 sigla varchar(5) not null
);

insert into tbl_genero(nome, sigla) values ('Feminino', 'FEM'), ('Masculino', 'MASC');
                        
##TABELA COR
create table tbl_cor(
			 id int not null auto_increment primary key,
			 nome varchar(45) not null
);

insert into tbl_cor(nome) values ('Branco'), ('Bege'), ('Marrom'), ('Azul');

##TABELA PRODUTOS
create table tbl_produtos(
			 id int not null auto_increment primary key,
             nome varchar(100) not null,
             descricao text not null,
             preco float not null,
             imagem varchar(150) not null,
             largura varchar(50),
             comprimento varchar(50),
             tamanho_sigla varchar(5),
             peso varchar(50) not null,
             categoria varchar(80) not null,
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Produtos
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
); 

insert into tbl_produtos(nome, descricao, preco, imagem, largura, comprimento, peso, categoria, id_ong) 
			values ('Ecobag sustentável', 
					'Ecobag com logo da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
                    '47.00', 'https://i.im.ge/2023/05/24/hqDV2f.ecobag-logo.png', '25mm de largura', '35x40 cm', null, '0,15 g', 'Produtos sustentáveis', 1 ),
                    ('Ecobag sustentável', 
                    'Ecobag modelo com nome da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
                    '47,00', 'https://i.im.ge/2023/05/24/hqDZv1.ecobag-tw-preto.png', '25mm de largura', '35x40 cm', null, '0,15 g', 'Produtos sustentáveis', 1 ),
                    ('Ecobag sustentável', 
                    'Ecobag modelo com nome da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
                    '47.00', 'https://i.im.ge/2023/05/24/hqDccC.ecobag-tw-azul.png', '25mm de largura', '35x40 cm'),
                    ('Botton Tomorrows Water', 'Botton com logo da ONG', 'R$ 5.00', 'https://i.im.ge/2023/05/24/hqDf6m.botton-logo.png', '4,5x4,5 cm', '0.50cm', null, '6g', 'Acessório', 1
                    
			);
                    

##TABELA INTERMEDIÁRIA: PRODUTOS_COR
create table tbl_produtos_cor(
			 id int not null auto_increment primary key,
			 id_produtos int not null,
             id_cor int not null,
             
             #Relacionamento Produtos_ProdutosCor
             constraint FK_Produtos_ProdutosCor
             foreign key (id_produtos)
             references tbl_produtos (id),
             
			 #Relacionamento Cor_ProdutosCor
			 constraint FK_Cor_ProdutosCor
             foreign key (id_cor)
             references tbl_cor (id),
             
             unique index(id)
);

##TABELA DOADOR
 create table tbl_doador(
			 id int not null auto_increment primary key,
			 nome varchar(50) not null,
			 email varchar(255) not null,
			 cpf varchar(45) not null,
			 data_nascimento date not null
);

##TABELA DOACAO
create table tbl_doacao(
			 id int not null auto_increment primary key,
             data_doacao date not null,
             forma_pagamento varchar(45) not null,
             valor float not null,
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Doacao
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
);

##TABELA INTERMEDIÁRIA: DOACAO_DOADOR
create table tbl_daocao_doador(
			 id int not null auto_increment primary key,
			 id_doacao int not null,
             id_doador int not null,
             
             #Relacionamento Doacao_DoacaoDoador
             constraint FK_Daocao_DoacaoDoador
             foreign key (id_doacao)
             references tbl_doacao (id),
             
			 #Relacionamento Doador_DoacaoDoador
			 constraint FK_Doador_DoacaoDoador
             foreign key (id_doador)
             references tbl_doador (id),
             
             unique index(id)
);


##TABELA VOLUNTÁRIOS
create table tbl_voluntarios(
			 id int not null auto_increment primary key,
			 nome varchar(50) not null,
			 email varchar(255) not null,
			 data_nascimento date not null,
			 cpf varchar(45) not null,
			 #chave estrangeira de genero
			 id_genero int not null,
                        
			constraint FK_Genero_Voluntarios
			foreign key (id_genero)
			references tbl_genero (id),
                        
			unique index(id)
);

##TABELA PROJETOS
create table tbl_projetos(
			 id int not null auto_increment primary key,
			 nome varchar(150) not null,
			 descricao text not null,
			 imagem varchar(150), 
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Projetos
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
);

##TABELA CIDADE
create table tbl_cidade(
			 id int not null auto_increment primary key,
			 nome varchar(80) not null,
			 sigla varchar(5) not null,
			 #chave estrangeira de estado 
			 id_estado int not null,
                        
			 constraint FK_Estado_Cidade
			 foreign key (id_estado)
			 references tbl_estado (id),
                        
			 unique index(id)
);

##TABELA ESTADO
 create table tbl_estado(
						id int not null auto_increment primary key,
                        nome varchar(45) not null,
                        sigla varchar(2) not null
);
 
##TABELA TIPO TELEFONE
 create table tbl_tipo_telefone(
								id int not null auto_increment primary key,
                                tipo varchar(45) not null,
                                sigla varchar(5)
);

##TABELA TELEFONE
create table tbl_telefone(
			 id int not null auto_increment primary key,
             numero varchar(25) not null,
             #chaves estrangeiras
             id_recado int not null,
             id_doador int not null,
             id_patrocinador int not null,
             id_voluntarios int not null,
             id_ong int not null,
             id_tipo_telefone int not null,
            ##RECADO
            constraint FK_Recado_Telefone
            foreign key (id_recado)
            references tbl_recado (id),
            
			##DOADOR
            constraint FK_Doador_Telefone
            foreign key (id_doador)
            references tbl_doador (id),
            
            ##PATROCINADOR
            constraint FK_Patrocinador_Telefone
            foreign key (id_patrocinador)
            references tbl_patrocinador (id),
            
            ##VOLUNTARIOS
            constraint FK_Voluntarios_Telefone
            foreign key (id_voluntarios)
            references tbl_voluntarios (id),
            
			##ONG
			constraint FK_Ong_Telefone
			foreign key (id_ong)
			references tbl_ong (id),
            
            ##TIPO TELEFONE
            constraint FK_TipoTelefone_Telefone
            foreign key (id_tipo_telefone)
            references tbl_tipo_telefone (id),
            
            unique index(id)
);

##TABELA ENDEREÇO
create table tbl_endereco(
			 id int not null auto_increment primary key,
             logradouro varchar(50) not null,
             cep varchar(45) not null,
             numero varchar(45) not null,
             complemento varchar(100),
			 #chaves estrangeiras
			 id_ong int not null,
             id_cidade int not null,
             id_voluntarios int not null,
             id_doador int not null,
            
            ##ONG
			constraint FK_Ong_Endereco
			foreign key (id_ong)
			references tbl_ong (id),
            
            ##CIDADE
            constraint FK_Cidade_Endereco
            foreign key (id_cidade)
            references tbl_cidade (id),
            
            ##VOLUNTARIOS
            constraint FK_Voluntarios_Endereco
            foreign key (id_voluntarios)
            references tbl_voluntarios (id),
            
            ##DOADOR
            constraint FK_Doador_Endereco
            foreign key (id_doador)
            references tbl_doador (id),
                    
			unique index(id)
);

##TABELA DASHBOARD ##PERGUNTAR SOBRE
create table tbl_login(
			 id int not null auto_increment primary key,
             email varchar(255) not null,
             senha varchar(50) not null
);


