create database db_tomorrows_water_2023;
 
use db_tomorrows_water_2023;
show tables; 
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
select * from tbl_ong;
 
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

insert into tbl_genero(nome, sigla) values ('Feminino', 'F'), ('Masculino', 'M'), ('O', 'Outros');
                        

##TABELA PRODUTOS
create table tbl_produtos(
			 id int not null auto_increment primary key,
             nome varchar(100) not null,
             descricao text not null,
             cor varchar(100) not null,
             preco float not null,
             imagem varchar(150) not null,
             altura varchar(50),
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
select * from tbl_produtos;

insert into tbl_produtos(
						nome, 
                        descricao, 
                        cor, 
                        preco, 
                        imagem, 
                        altura, 
                        largura, 
                        comprimento,
                        tamanho_sigla,
                        peso,
                        categoria,
                        id_ong) values (
                        'Camiseta TW', 
                        'Camiseta de algodão Tomorrows Water',
                        'Branco',
                        '112.50',
                        'https://i.im.ge/2023/05/24/hqDbi4.camiseta-frente.png',
                        null,
                        null,
                        null,
                        'M',
                        '200g',
                        'Roupa',
                        1
                        );

insert into tbl_produtos(
			nome, 
            descricao, 
            cor, preco, 
            imagem, altura, 
            largura, comprimento, 
            tamanho_sigla, peso, 
            categoria, id_ong
            ) values (
               'Ecobag sustentável',
               'Ecobag da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
               'Bege', '47',
               'https://i.im.ge/2023/05/24/hqDccC.ecobag-tw-azul.png','40cm', 
               '25mm','35cm',
               null, '0.15g', 
               'Produtos sustentáveis', 1
				),
                ('Garrafa Térmica Bambu TW',
                'Garrafa Térmica com revestimento em bambu e aço inox, com parede dupla e infusor para chá. além da abundância e da beleza, o bambu ainda apresenta propriedades antibacterianas, é muito resistente, é leve, é versátil, é renovável e tem uma longa vida. Ecologicamente, o bambu cumpre um papel importantíssimo na proteção de nascentes e na preservação do solo firme.',
                'Marrom', '99',
                'https://i.im.ge/2023/05/24/hqDWCP.garrafa-logo.png', '20.4cm',
                '6,9cm', '20cm',
                null, '333g',
                'Produtos para bebidas', 1
                ),
                ('Ecobag sustentável',
				'Ecobag da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
                'Bege', '47',
                'https://i.im.ge/2023/05/24/hqDZv1.ecobag-tw-preto.png', '40cm',
                '25mm', '35cm',
                null, '0.15g',
                'Produtos sustentáveis', 1
                ),
                ('Garrafa Térmica Bambu',
                'Garrafa Térmica com revestimento em bambu e aço inox, com parede dupla e infusor para chá. além da abundância e da beleza, o bambu ainda apresenta propriedades antibacterianas, é muito resistente, é leve, é versátil, é renovável e tem uma longa vida. Ecologicamente, o bambu cumpre um papel importantíssimo na proteção de nascentes e na preservação do solo firme.',
                'Marrom', '99',
                'https://i.im.ge/2023/05/24/hqDkVr.garrafa-tw.png', '20.4cm',
                '6.9cm', '20cm',
                null, '333g',
                'Produtos para as bebidas', 1
                ),
                ('Botton TW',
                'Nossos bottons são feitos com o melhor material, desde o papel até o laminação do botton, tudo feito com muito carinho e cuidado para você! Para colocar na sua roupa, mochila, boné, etc...',
                'Branco', '5',
                'https://i.im.ge/2023/05/24/hqDf6m.botton-logo.png', '3.80cm',
                '0.10cm', '3.80cm',
                null, '50g',
                'Acessórios', 1
                ), 
                ('Ecobag sustentável',
                'Ecobag com logo da ONG. Nossa ideia é que nossos clientes deixem de usar sacolas plásticas que poluem nosso planeta e troque por sacolas reutilizáveis em algodão cru. Melhorando assim a condição do meio ambiente e a sustentabilidade.',
                'Bege', '47',
                'https://i.im.ge/2023/05/24/hqDV2f.ecobag-logo.png', '40cm',
                '25mm', '35cm'
                'null', '0.15g',
                'Produtos sustentáveis', 1
                ),
                ('Botton Tomorrow',
                'Nossos bottons são feitos com o melhor material, desde o papel até o laminação do botton, tudo feito com muito carinho e cuidado para você! Para colocar na sua roupa, mochila, boné, etc...',
                'Branco', '5',
                'https://i.im.ge/2023/05/24/hdWe8m.botton-tw.png', '3.80cm',
                '0.10cm', '3.80cm',
                null, '50g',
                'Acessórios', 1
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
            
            constraint FK_Ong_Voluntarios
            foreign key (id_ong)
            references tbl_onf (id),
                        
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
select * from tbl_projetos;
insert into tbl_projetos(
			nome, descricao, imagem, id_ong
            ) values (
            'Saúde',
            'Nosso principal projeto envolvido na área da saúde é levar a água potável para as pessoas com maior careza no acesso a este bem tão precioso. Nosso foco está no munícipio do macapá onde a situação é alarmante, a distribuição das garrafinhas de água será feita por voluntários da nossa ong.',
            'imagem aqui', 1), (
            'Higiene',
            'Nesta área buscamos zelar pela higiene digna de todas as pessoas independentemente das condições em que vivem e onde vivem, para isso vamos levar postos de higienização pessoal que serão barcos com banheiros, para que a higienização seja mais acessivel e não seja um problema se tornando parte da rotina.',
            'imagem aqui', 1),
            ( 'Bem estar',
            'Buscamos trazer um local para viver digno a todos os cidadões, sem a presença de esgotos a céu aberto e outros problemas devidos a falta de saneamento básico, para sanarmos com isso vamos realizar obras de melhoria em lugares precários e esquecidos na região do macapá.',
            'imagem aqui', 1);


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
