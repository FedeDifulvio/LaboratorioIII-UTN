
use blueprint 

go 
 create table modulos(
   id smallint primary key identity (1,1) not null,
   nombre varchar (30) not null,
   descripcion varchar (400) null,
   id_proyecto int not null foreign key references proyectos (id_proyecto),
   costo_estimado money not null check (costo_estimado > 0),
   tiempo_estimado smallint not null,
   fecha_inicio datetime not null,
   fecha_fin datetime not null check (fecha_fin > fecha_inicio),
   fecha_inicio_estimada datetime not null
 ) 

 
 go 

create table provincias(
  codProvincia tinyint primary key identity(1,1),
  provincia varchar(30)
)
go

create table ciudades(
   codPostal smallint primary key not null,
   ciudad varchar(30) not null,
   codProvincia tinyint foreign key references provincias(codProvincia) not null
)

go 
  create table colaboradores(
     id smallint primary key identity (1,1) not null,
	 nombre varchar(20) not null,
	 apellido varchar(20) not null,
	 fecha_nacimiento datetime not null,
     mail varchar(50) null,
	 celular varchar(25) null check(mail is not null),
	 direccion varchar(40) null,
	 codPostal smallint null foreign key references ciudades(codPostal),
	 tipo_colaborador bit not null
	 constraint mailYcelular check((mail is null and celular is not null) 
	                               or (mail is not  null and celular is null)
							       or (mail is not  null and celular is  not null))

  ) 