create database blueprint

use blueprint 
go
create table tipos_clientes(
  idTipo_cliente smallint primary key identity(1,1) not null,
  nombreTipo_cliente varchar(30) not null
)
go
create table clientes(
  idCliente int primary key identity(1,1) not null,
  razonSocial nvarchar(60) not null,
  CUIT varchar(13) unique not null,
  tipoCliente smallint not null foreign key references tipos_clientes(idTipo_cliente),
  mail varchar(20) not null,
  telefono varchar(12) null,
  celular varchar(12)null
) 
go
create table proyectos(
   id_proyecto int primary key identity(1,1) not null,
   nombre_proyecto nvarchar(30) not null,
   id_cliente int foreign key references clientes (idCliente),
   fecha_Inicio datetime null,
   fecha_fin datetime null,
   costo money not null,
   estado varchar(8) check(estado ='vigente' or estado = 'cancelado')

)
go
create table descripcion_proyecto(
  idProyecto int not null,
  descripcion nvarchar(400) not null
  primary key(idProyecto)
  foreign key(idProyecto) references proyectos(id_proyecto)
)



--El diseño de la base de datos debe garantizar que:
--Un cliente pueda tener un código autonumérico que lo identifique.
--Un cliente deba tener una razón social y un CUIT. Este último no puede repetirse.
--Un cliente deba registrar un tipo de cliente y que el gestor de proyecto pueda definir los distintos tipos de clientes: "Estatal", "Multinacional", "Educativo privado", "Educativo público", "Sin fines de lucro", etc.
--Un cliente pueda registrar un mail, teléfono y celular de contacto.
--Un proyecto registre un nombre y pueda opcionalmente registrar una descripción larga.
--Un proyecto registre un ID que lo identifique.
--Un proyecto debe tener un cliente.
--Un cliente puede tener muchos proyectos.
--Dos o más clientes no pueden tener el mismo proyecto.
--Un proyecto debe contener una fecha de inicio y una fecha de fin. Aunque esta última debe poder suministrarse tiempo después de haber registrado el proyecto.
--Un proyecto debe registrar un costo estimado.
--Un proyecto debe contener una marca que defina si se encuentra vigente o cancelado.
