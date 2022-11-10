create table if not exists user (
	id_user int primary key auto_increment,
	name varchar(40) not null,
	email varchar(40) not null,
	poassword varchar(20) not null
);

create table if not exists roles (
	id_roles int primary key auto_increment,
	name varchar(20) not null default "employee"
);

create table if not exists post (
	id_post int primary key auto_increment,
	title varchar(30),
	description text not null,
	id_user int,
	foreign key(id_user) references users(id_user)
);

create table if not exists user_roles (
	id_user int,
	id_roles int,
	foreign key(id_user) references users(id_user),
	foreign key(id_roles) references roles(id_roles)
);


drop table user_roles ;

alter table users 
	modify column email varchar(40) not null unique;

alter table users 
	change column poassword password varchar(20) not null unique;

desc user;
desc roles;
desc post;
desc user_roles;

alter table user rename to users;
alter table post rename to posts;

insert into users 
(name, email, password)
values 
("Kauã Filho", "kaua.filho1@gmail.com", "acesso2323.05"),
("José Antônio", "jose.antonio1@gmail.com", "acesso.santi22325"),
("Olegário Neto", "olegario.neto4@gmail.com", "neto.olegario231"),
("Aglayrton Julião", "aglayrton.juliao6@gmail.com", "aglayrtonj457"),
("Kauã Santiago", "kaua.filho11@gmail.com", "acesso111.05kjose");

insert into roles 
(name)
values 
("Admin"),
("Employee"),
("Client");



insert into posts 
(title, description, id_user)
values 
("Cisco Packet Tracer", "Agora esses gaiatos (meus alunos) sabem fazer um rede peer-to-peer e um em topologia estrela", 3),
("Banco de Dados", "Tão fácil quanto beber água!!!", 4),
("API com NODE JS", "Agora sim eu consigo fazer a bendita API que o chefe pediu!!!", 5),
("Assembly", "Então era assim que o homens das cavernas programavam?!", 2);


insert into user_roles 
(id_user, id_roles)
values
(5, 1),
(5, 2), 
(5, 3),
(3, 3),
(4, 1),
(2, 2);

 select 
 	posts.id_post, 
 	posts.title, 
 	posts.description, 
 	posts.id_user, 
 	users.id_user, 
 	users.name from posts inner join users 
 	on users.id_user = posts.id_user 
 	where users.id_user = 3;
 
  select 
 	posts.id_post, 
 	posts.title, 
 	posts.description, 
 	posts.id_user, 
 	users.id_user, 
 	users.name from posts inner join users 
 	on users.id_user = posts.id_user 
 	where users.id_user = 5;
 
delete from posts 
	where id_user = 2
	limit 1;

delete from user_roles 
	where id_user = 2
	limit 1;

delete from users 
	where id_user = 2
	limit 1;

select users.id_user, users.name, roles.id_roles roles.name from user_roles 
join users on users.id_user = user_roles.id_user 
join roles on roles.id_roles = user_roles.id_roles where roles.name = "Admin";  


select * from user_roles;

select * from users;

select * from roles;

select * from posts;