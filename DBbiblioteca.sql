create database biblioteca
use biblioteca

/*creando la tabla libros*/
create table libros(
idlibro int not null,
isbn varchar(13) null,
titulo varchar(30) null,
precio int not null,
Noedicion varchar(10) null,
fechaedicion varchar(10) null,
comentarios varchar(50) null,
id_categoria int not null, 
coeditorial int not null
);

/*creando la tabla autores*/
create table autores
(
id_autor varchar(3) not null,
autor_nombre varchar(25) null,
autor_pais varchar(15) null
);

/*creando la tablaeditoriales*/
create table editoriales
(
coeditorial int not null,
nombre_editorial varchar(25) null,
tel_editorial varchar(20) null
);

/*creando tabla categorias*/
create table categorias
(
id_categoria int not null, 
categoria_nombre varchar(25) null
);

/*creacion de la tabla autor_libros*/
create table autor_libros
(
idlibro int not null,
idautor varchar(3) null
);

/*creando llaves foraneas*/
alter table libros add constraint PK_libros primary key (idlibro);
alter table autores alter column id_autor varchar(3) not null;
alter table autores add constraint PK_autores primary key (id_autor);
alter table editoriales add constraint PK_editoriales primary key (coeditorial);
alter table categorias add constraint PK_categorias primary key (id_categoria);

alter table libros add constraint FK_libros_categorias foreign key(id_categoria) references categorias(id_categoria) on update cascade on delete no action;
alter table libros add constraint FK_libros_coeditorial foreign key(coeditorial) references editoriales(coeditorial) on update cascade on delete no action;
alter table autor_libros add constraint FK_libros_autores foreign key(idlibro) references libros(idlibro) on update cascade on delete no action;
alter table autor_libros add constraint FK_autores_libros foreign key(idautor) references autores(id_autor) on update cascade on delete no action;
