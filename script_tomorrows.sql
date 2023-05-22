
 create database db_tomorrows_water_2023;
 
 use db_tomorrows_water_2023;
 
##TABELA ONG 
create table tbl_ong(
			 id int not null auto_increment primary key,
			 nome varchar(80) not null,
			 descricao text not null,
			 email varchar(255) not null,
			 area_atuacao varchar(150) not null,
			 data_fundacao date not null,
			 site varchar(200)
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

##TABELA NOTICIAS
create table tbl_noticias(
			 id int not null auto_increment primary key,
             titulo varchar(200) not null,
             data_postagem date not null,
             imagem varchar(150) not null,
             texto text not null,
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Noticias
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
                        
##TABELA COR
create table tbl_cor(
			 id int not null auto_increment primary key,
			 nome varchar(45) not null
);

##TABELA PRODUTOS
create table tbl_produtos(
			 id int not null auto_increment primary key,
             nome varchar(100) not null,
             descricao text not null,
             preco float not null,
             imagem varchar(150) not null,
             largura varchar(50) not null,
             comprimento varchar(50) not null,
             peso varchar(50) not null,
             categoria varchar(80) not null,
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Produtos
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
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
             data date not null,
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

##TABELA EQUIPES
create table tbl_equipes(
			 id int not null auto_increment primary key,
			 nome varchar(100) not null,
			 quantidade_voluntarios int not null,
			 descricao text not null
);

##TABELA INTERMEDIÁRIA: EQUIPES_VOLUNTARIOS 
create table tbl_equipes_voluntarios(
			 id int not null auto_increment primary key,
			 id_equipes int not null,
             id_voluntarios int not null,
             
             #Relacionamento Equipes_EquipesVoluntarios
             constraint FK_Equipes_EquipesVoluntarios
             foreign key (id_equipes)
             references tbl_equipes (id),
             
			 #Relacionamento Voluntarios_EquipesVoluntarios
			 constraint FK_Voluntarios_EquipesVoluntarios
             foreign key (id_voluntarios)
             references tbl_voluntarios (id),
             
             unique index(id)
);

##TABELA PROJETOS
create table tbl_projetos(
			 id int not null auto_increment primary key,
			 nome varchar(150) not null,
			 descricao text not null,
			 orcamento float not null,
			 ##status varchar(45),
			 imagem varchar(150), 
			 #chave estrangeira da ong 
			 id_ong int not null,
                        
			constraint FK_Ong_Projetos
			foreign key (id_ong)
			references tbl_ong (id),
                        
			unique index(id)
);

##TABELA INTERMEDIÁRIA: EQUIPES_PROJETOS
create table tbl_equipes_projetos(
			 id int not null auto_increment primary key,
			 id_equipes int not null,
             id_projetos int not null,
             
             #Relacionamento Equipes_EquipesProjetos
             constraint FK_Equipes_EquipesProjetos
             foreign key (id_equipes)
             references tbl_equipes (id),
             
			 #Relacionamento Projetos_EquipesProjetos
			 constraint FK_Projetos_EquipesProjetos
             foreign key (id_projetos)
             references tbl_projetos (id),
             
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
create table tbl_dashboard(
			 id int not null auto_increment primary key,
             email varchar(255) not null,
             senha varchar(50) not null
);

##TABELA SUPERVISOR ##PERGUNTAR SOBRE

