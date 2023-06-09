use formativaHogwarts;

################################################################################## CRIACAO TABELA RESPONSAVEL ######################################################################################
create table responsavel (
	id bigint not null auto_increment,
    responsavel_fk bigint not null,
    primary key(id),
    foreign key (responsavel_fk) references usuarios(id)
);

############################################################################## INSERCAO DE DADOS DA TABELA RESPONSAVEL #############################################################################
insert into responsavel (responsavel_fk) values 
(1), (2),(3);

insert into responsavel (responsavel_fk) values 
(1), (2),(3);

##################################################################################### CRIACAO TABELA TAREFA ########################################################################################
create table tarefa (
	id bigint not null auto_increment,
    titulo varchar(35) not null,
    descrisao varchar(450) not null,
	usuarioFk bigint not null,
    responsavel_fk bigint not null,
    prazo date not null,
    locais_FK bigint not null,
    imagens mediumtext,
    primary key(id),
    foreign key(usuarioFk) references usuarios(id),
    foreign key(responsavel_fk) references responsavel(id),
    foreign key(locais_FK) references locais(id)
);

############################################################################### INSERCAO DE DADOS DA TABELA TAREFA #################################################################################
insert into tarefa (titulo,descrisao,usuarioFk,responsavel_fk,prazo,locais_FK,imagens) values
('computador','sem cabos',1,2,'2023-05-10',1,'imagem 1'),
('computador','quebrado',6,1,'2023-06-10',2,'imagem 2'),
('monitor','quebrado',4,3,'2023-07-12',5,'imagem 3'),
('monitor','falha',6,3,'2023-08-11',4,'imagem 4'),
('monitor','cabo',4,3,'2023-09-09',2,'imagem 5');

insert into tarefa (titulo,descrisao,usuarioFk,responsavel_fk,prazo,locais_FK,imagens) values
('computador','cabo',4,3,'2023-10-12',2,'imagem 6'),
('tablet','carregador',4,3,'2023-11-05',2,'imagem 7'),
('celular','fonte',4,3,'2023-01-23',3,'imagem 8'),
('luminaria','cabo',4,3,'2023-02-24',4,'imagem 9'),
('ar condicionado','tomada',4,3,'2023-03-22',5,'imagem 10');


########################################################################################### CRIACAO TABELA STATUS ##################################################################################
create table status (
	id bigint not null auto_increment,
    name varchar(135) not null,
    primary key(id)
    );
    
    ########################################################################### INSERCAO DE DADOS DA TABELA STATUS #################################################################################
    insert into status (name) values
('aberta'),('Em andamento'),('Concluida'),('Encerrada');

    ################################################################################## CRIACAO TABELA IMAGENS_STATUS ###############################################################################
    create table imagens_status (
	id bigint not null auto_increment,
    image mediumtext,
    primary key(id)
    );
    
    ######################################################################### INSERCAO DE DADOS DA TABELA IMAGENS_STATUS ###########################################################################
    insert into imagens_status (image) values
('imagem 11'),
('imagem 12'),
('imagem 13'),
('imagem 14');


    ##################################################################################### CRIACAO TABELA PROGRESOS #################################################################################
    create table progressos (
	id bigint not null auto_increment,
    descrisao varchar(135) not null,
    data datetime not null,
    imagens_status_FK bigint not null,
    tarefa_FK bigint not null,
    status_FK bigint not null,
    primary key(id),
    foreign key(tarefa_FK) references tarefa(id),
	foreign key(status_FK) references status(id),
    foreign key(imagens_status_FK) references imagens_status(id)
);

########################################################################## INSERCAO DE DADOS DA TABELA PROGRASSOS ##################################################################################

insert into progressos (descrisao,data,imagens_status_FK,tarefa_FK,status_FK) values
('pronto','2023-01-30',1,1,1),
('pronto','2023-02-12',2,1,2),
('pronto','2023-03-13',3,1,3),
('pronto','2023-04-14',3,1,4),
('pronto','2023-05-15',3,2,1);

insert into progressos (descrisao,data,imagens_status_FK,tarefa_FK,status_FK) values
('finalizando','2023-06-04',1,3,1),
('finalizando','2023-07-13',2,4,1),
('finalizando','2023-08-16',3,6,1),
('finalizando','2023-09-11',3,7,1),
('finalizando','2023-10-18',3,8,1);


################################################################################### CAMPO DE PESQUISAS #############################################################################################

#Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus respectivos envolvidos no processo;#
select * from tarefa where id not in
(select t.id from tarefa t join progressos ts on t.id = ts.tarefa_fk);


#Crie uma consulta que mostre todos os locais que tiveram associação a mais de duas tarefas;#
select l.*, count(*) from locais l join
tarefa t on l.id = t.locais_FK group by t.locais_FK having count(l.id)>2;


#Crie uma consulta que mostre todos os usuários que tiveram associação a duas tarefas no mínimo;#
select u.*,count(*) from tarefa t join responsavel r on t.id = r.responsavel_fk join usuarios u on r.responsavel_FK = u.id group by u.id having count(u.id)>=2;


#Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não foram executadas nos locais destes eventos (essa consulta ajudará a gestão visualizar se há algum problema que pode impactar os eventos);#
select e.*,t.* from tarefa t join locais l on t.locais_FK = l.id join eventos e on l.id = e.localFk join progressos ts on t.id = ts.tarefa_fk
where e.inicio > now() and ts.status_FK != '4' group by e.id,t.id;


#Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status);#
select l.*, count(*) from locais l join tarefa t on l.id = t.locais_FK group by l.id;


#Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas;#
select l.*, count(*) from locais l join tarefa t on l.id = t.locais_FK join progressos ts on t.id = ts.tarefa_fk where ts.status_FK = 4 group by l.id;


#Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente do status);#
select u.*,count(*) from usuarios u join responsavel tr on u.id = tr.responsavel_fk group by u.id;


#Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas;#
select u.*,count(*) from usuarios u join responsavel tr on u.id = tr.responsavel_fk join tarefa t on tr.responsavel_fk = t.id join progressos ts on t.id = ts.tarefa_fk where ts.status_fk = '4' group by u.id;


#Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas; • Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local;#
select *, AVG(d.qnt) from locais l join (select locais_FK, month(prazo)as mes,count(*) as qnt from tarefa group by mes,locais_FK) d on l.id = d.locais_FK group by d.mes,l.id;