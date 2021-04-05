
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
   fecha_fin datetime not null,
   fecha_inicio_estimada datetime not null,
   constraint fechas check (fecha_inicio < fecha_fin)
 ) 

 
 go 

create table paises(
  codPais char(2) primary key not null,
  nombre_pais varchar(30)
)
go

create table ciudades(
   codCiudad int primary key identity(1,1) not null,
   nombre_ciudad varchar(30) not null,
   codPais char(2) foreign key references paises (codPais) not null
)

go 
create table colaboradores(
   id smallint primary key identity (1,1) not null,
   nombre varchar(20) not null,
   apellido varchar(20) not null,
   fecha_nacimiento datetime not null,
   mail varchar(50) null,
   celular varchar(25) null,
   direccion varchar(40) null,
   codCiudad int null foreign key references ciudades(codCiudad),
   tipo_colaborador bit not null,
   constraint mailYcelular check(mail is not null or celular is not null)
  ) 

