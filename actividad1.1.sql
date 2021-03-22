
create database actividadUno

use actividadUno 

go
create table carreras(
   ID char(4) primary key not null,
   nombre nvarchar(20) not null,
   fecha_creacion datetime not null check ( fecha_creacion <= getdate()),
   mail varchar(50) not null,
   nivel varchar(15) check( nivel ='diplomatura' or nivel = 'pregrado' or nivel='grado' or nivel='posgrado')

)
create table Materias(
   ID int primary key identity(1,1) not null,
   IDcarrera char(4) not null foreign key references carreras(ID),
   nombre nvarchar(40) not null,
   carga_horaria smallint not null check (carga_horaria>0)
)

go
create table Alumnos(
   legajo int primary key identity(1000, 1) not null,
   IDcarrera char(4) not null foreign key references carreras(ID),
   nombre nvarchar(20) not null,
   apellido nvarchar(20) not null,
   mail varchar(50) unique not null,
   telefono varchar(15) null
)

/*Tener en cuenta que:

Alumnos
El legajo debe ser un número autonumérico que comienza en 1000 e incrementa de a 1.
El IDCarrera debe ser obligatorio y existir en la tabla de carreras.
Los Apellidos y Nombres son obligatorios.
La fecha de nacimiento es obligatoria y no puede ser mayor a la fecha del sistema.
El mail es obligatorio y único.
El teléfono es opcional.

Carreras
El ID debe ser único y un texto de hasta 4 caracteres.
El nombre de la carrera debe ser obligatorio.
La fecha de creación debe ser una fecha obligatoria y no puede ser mayor a la fecha del sistema.
El mail debe ser obligatorio.
El nivel debe ser 'Diplomatura', 'Pregrado', 'Grado' o 'Posgrado'.

Materias
El ID debe ser autonumérico comenzando desde 1 e incremente de a 1.
El IDCarrera debe ser obligatorio y existir en la tabla de carreras.
El Nombre debe ser obligatorio.
La carga horaria debe ser obligatoria y ser un número entero positivo. 
 */