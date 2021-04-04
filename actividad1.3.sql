create database blueprint

use blueprint 
go
create table tipos_clientes(
  idTipo_cliente smallint primary key identity(1,1) not null,
  nombreTipo_cliente varchar(40) not null
)
go
create table clientes(
  idCliente int primary key identity(1,1) not null,
  razonSocial nvarchar(60) not null unique,
  CUIT varchar(13) unique not null,
  tipoCliente smallint not null foreign key references tipos_clientes(idTipo_cliente),
  mail varchar(20) not null,
  telefono varchar(12) null,
  celular varchar(12)null
) 
go
create table proyectos(
   id_proyecto int primary key identity(1,1) not null,
   nombre_proyecto nvarchar(50) not null,
   descripcion varchar(400)null,
   id_cliente int foreign key references clientes (idCliente),
   fecha_Inicio datetime  not null,
   fecha_fin datetime null,
   costo money not null check(costo > 0),
   estado bit not null default (1) 

)





