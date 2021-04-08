
use blueprint 

go 
 create table modulos(
   id smallint primary key identity (1,1) not null,
   nombre varchar (30) not null,
   descripcion varchar (400) null,
   id_proyecto varchar(5) not null foreign key references proyectos (id_proyecto),
   costo_estimado money not null check (costo_estimado > 0),
   tiempo_estimado smallint not null,
   fecha_inicio datetime not null,
   fecha_fin datetime not null,
   fecha_inicio_estimada datetime not null,
   constraint fechas check (fecha_inicio < fecha_fin)
 ) 

 
 go 

create table paises(
  codPais smallint primary key identity(1,1) not null,
  nombre_pais varchar(30) not null
)
go

create table ciudades(
   codCiudad int primary key identity(1,1) not null,
   nombre_ciudad varchar(30) not null,
   codPais smallint not null foreign key references paises(codPais)
)

go 
create table colaboradores(
   id smallint primary key identity (1,1) not null,
   nombre varchar(20) not null,
   apellido varchar(20) not null,
   fecha_nacimiento datetime not null check(fecha_nacimiento< getdate()),
   mail varchar(50) null,
   celular varchar(25) null,
   direccion varchar(40) null,
   codCiudad int null foreign key references ciudades(codCiudad),
   Tipo CHAR(1) NOT NULL CHECK(Tipo = 'I' OR Tipo = 'E'),
   constraint mailYcelular check(mail is not null or celular is not null)
  )  


 

