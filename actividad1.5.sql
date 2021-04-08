use blueprint 

create table tiposTarea(
  id int primary key identity(1,1) not null,
  nombre_tarea varchar(100) not null
)


create table tareas(
  id int primary key identity(1,1) not null,
  id_modulo smallint foreign key references modulos(id),
  tipo_tarea int foreign key references tiposTarea(id),
  fecha_inicio datetime null,
  fecha_fin datetime null,
  estado bit not null,
  constraint CHECK_FECHAS check (fecha_inicio<fecha_fin)
)

create table colaboraciones(
 id_tarea int  not null,
 id_colaborador smallint not null,
 horas smallint not null check(horas>0),
 valor_hora smallint not null check(valor_hora>0),
 estado bit not null 
 primary key(id_tarea, id_colaborador),
 foreign key(id_tarea) references tareas (id),
 foreign key(id_colaborador) references colaboradores (id)
)