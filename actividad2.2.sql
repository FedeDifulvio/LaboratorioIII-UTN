
--1 Por cada cliente listar razón social, cuit y nombre del tipo de cliente.

    select CL.razonSocial, CL.cuit,TP.nombre AS tipo  from clientes as CL inner join tiposCliente AS TP on CL.IDtipo = TP.id


--2 Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Sólo de aquellos clientes que posean ciudad y país.

    select CL.razonSocial, CL.cuit, CIU.Nombre as ciudad, P.Nombre as Pais 
	from clientes as CL inner join ciudades as CIU on CL.IDCiudad = CIU.ID 
	inner join paises as P on CIU.IDPais = P.ID


--3 Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Listar también los datos de aquellos clientes que no tengan ciudad relacionada.

    select CL.razonSocial, CL.cuit, CIU.Nombre as ciudad, P.Nombre as Pais 
	from clientes as CL left join ciudades as CIU on CL.IDCiudad = CIU.ID 
	left join paises as P on CIU.IDPais = P.ID


--4 Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Listar también los datos de aquellas ciudades y países que no tengan clientes relacionados.

     select CL.razonSocial, CL.cuit, CIU.Nombre as ciudad, P.Nombre as Pais 
	from clientes as CL right join ciudades as CIU on CL.IDCiudad = CIU.ID 
	right join paises as P on CIU.IDPais = P.ID


--5 Listar los nombres de las ciudades que no tengan clientes asociados. Listar también el nombre del país al que pertenece la ciudad.

     select CIU.Nombre, P.Nombre from clientes as CL right join ciudades CIU on CL.IDCiudad = CIU.ID 
	 inner join paises as P on CIU.IDPais = P.ID
	 where CL.ID is null


--6 listar para cada proyecto el nombre del proyecto, el costo, la razón social del cliente, el nombre del tipo de cliente y 
--el nombre de la ciudad (si la tiene registrada) de aquellos clientes cuyo tipo de cliente sea 'Extranjero' o 'Unicornio'. 

     select PR.Nombre, PR.CostoEstimado, CL.RazonSocial, TP.Nombre as Tipo_Cliente, CIU.Nombre as Ciudad
	 from proyectos as PR inner join clientes as CL on PR.IDCliente = CL.ID
	 inner join tiposCliente AS TP on CL.IDtipo = TP.id
	 inner join Ciudades as CIU on CL.IDCiudad = CIU.ID
	 where TP.Nombre = 'Extranjero' or TP.Nombre = 'Unicornio'


--7 Listar los nombre de los proyectos de aquellos clientes que sean de los países 'Argentina' o 'Italia'.
     select PR.Nombre, P.Nombre 
	 from proyectos as PR inner join Clientes as CL on PR.IDCliente = CL.ID 
	 inner join Ciudades as CIU on CL.IDCiudad = CIU.ID 
	 inner join Paises as P on CIU.IDPais = P.ID
	 where P.nombre in( 'Argentina', 'Italia')
--8 Listar para cada módulo el nombre del módulo, el costo estimado del módulo, el nombre del proyecto, la descripción del proyecto y el costo estimado del proyecto de todos aquellos proyectos que hayan finalizado.

     select MO.Nombre as modulo, P.Nombre as proyect, MO.CostoEstimado, P.Descripcion, P.CostoEstimado
	 from modulos as MO inner join proyectos as P on MO.IDProyecto = P.ID 
	 where P.FechaFin < getdate()  

	
--9 Listar los nombres de los módulos y el nombre del proyecto de aquellos módulos cuyo tiempo estimado de realización sea de más de 100 horas.

     select MD.nombre as Modulo, P.Nombre as Proyecto from modulos MD inner join Proyectos P on MD.IDProyecto = P.ID where MD.TiempoEstimado > 100


--10 Listar nombres de módulos, nombre del proyecto, descripción y tiempo estimado de aquellos módulos cuya fecha estimada de fin sea mayor a la fecha real de fin y el costo estimado del proyecto sea mayor a cien mil.

    select MD.nombre as Modulo, MD.Descripcion, P.Nombre as Proyecto, MD.TiempoEstimado  from modulos MD inner join Proyectos P on MD.IDProyecto = P.ID 
	 where MD.FechaEstimadaFin > MD.FechaFin and P.CostoEstimado >100000

--11 Listar nombre de proyectos, sin repetir, que registren módulos que hayan finalizado antes que el tiempo estimado.

      select distinct P.Nombre from proyectos P inner join Modulos M on P.ID = M.IDProyecto where M.FechaFin < M.FechaEstimadaFin 

--12 Listar nombre de ciudades, sin repetir, que no registren clientes pero sí colaboradores.

       select DISTINCT CIU.Nombre from ciudades CIU 
	   left join clientes CL on CIU.ID = CL.IDCiudad 
	   inner join colaboradores COL on COL.IDCiudad = CIU.ID
	   where CL.ID is null and COL.ID is not null 

--13 Listar el nombre del proyecto y nombre de módulos de aquellos módulos que contengan la palabra 'login' en su nombre o descripción.
  
     select P.Nombre as Proyecto, M.Nombre as Modulo from proyectos P 
	 inner join modulos M on P.id = M.IDProyecto
	 where M.Nombre = 'login' or M.Descripcion like '%login%'

	 select * from tareas

--14 Listar el nombre del proyecto y el nombre y apellido de todos los colaboradores que hayan realizado algún tipo de tarea cuyo nombre contenga 'Programación' o 'Testing'.
--Ordenarlo por nombre de proyecto de manera ascendente.

  select P.Nombre as Proyectos, COLA.Nombre, COLA.Apellido from proyectos P 
  inner join modulos M on P.ID = M.IDProyecto 
  inner join tareas T on M.ID = T.IDModulo 
  inner join colaboraciones COL on T.ID = COL.IDTarea 
  inner join colaboradores COLA on COL.IDColaborador = COLA.ID
  inner join tiposTarea TT on T.IDTipo = TT.ID
  where TT.Nombre like '%Programación%' or TT.Nombre like '%Testing%' 
  order by P.Nombre ASC


--15 Listar nombre y apellido del colaborador, nombre del módulo, nombre del tipo de tarea, precio hora de la colaboración y precio hora base 
--de aquellos colaboradores que hayan cobrado su valor hora de colaboración más del 50% del valor hora base.

  select COL.Nombre, COL.Apellido, M.Nombre AS Modulo, TT.Nombre as Tipo_Tarea, COLA.PrecioHora AS Precioi_hora_base 
  from colaboradores COL inner join colaboraciones COLA on COL.ID = COLA.IDColaborador 
  inner join tareas T on COLA.IDTarea = T.ID 
  inner join modulos M on T.IDModulo = M.ID
  inner join TiposTarea TT on T.IDTipo = TT.ID
  where COLA.PrecioHora > TT.PrecioHoraBase * 1.50


--16 Listar nombres y apellidos de las tres colaboraciones de colaboradores externos que más hayan demorado en realizar alguna tarea cuyo nombre de tipo de tarea contenga 'Testing'.

  select TOP(3) CONCAT(COL.Nombre,' ', COL.Apellido) as Nombre from colaboraciones COLA 
  inner join colaboradores COL on COLA.IDColaborador = COL.ID
  inner join tareas T on COLA.IDTarea = T.ID 
  inner join TiposTarea TT on T.IDTipo = TT.ID 
  where COL.Tipo ='E' and TT.Nombre LIKE '%Testing%'
  order by COLA.Tiempo desc


--17 Listar apellido, nombre y mail de los colaboradores argentinos que sean internos y cuyo mail no contenga '.com'.

    select concat (COL.Nombre,' ', COL.Apellido) as 'Nombre y Apellido', COL.EMail from colaboradores COL 
	inner join ciudades C on COL.IDCiudad = C.ID 
	inner join paises P on C.IDPais = P.ID
	where COL.Tipo ='i' and p.Nombre ='Argentina'  and COL.EMail NOT LIKE '%.com%'


--18 Listar nombre del proyecto, nombre del módulo y tipo de tarea de aquellas tareas realizadas por colaboradores externos. 

   select P.Nombre as Proyecto, M.Nombre as Modulo, TT.nombre as 'Tipo de tarea' from  proyectos P
   inner join modulos M on M.IDProyecto = P.ID 
   inner join tareas T on T.IDModulo = M.ID 
   inner join TiposTarea TT on TT.ID = T.IDTipo 
   inner join colaboraciones COLA on COLA.IDTarea = T.ID
   inner join Colaboradores COL on col.ID = COLA.IDColaborador 
   where  COL.Tipo = 'E'

--19 Listar nombre de proyectos que no hayan registrado tareas. 

     select P.Nombre from proyectos P 
	 inner join Modulos M on P.ID = M.IDProyecto 
	 left join Tareas T on T.IDModulo = M.ID 
	 where T.ID is null 

--20 Listar apellidos y nombres, sin repeticiones, de aquellos colaboradores que hayan trabajado en algún proyecto que aún no haya finalizado. 

     select DISTINCT concat (COL.Apellido, col.Nombre) as COLABORADOR from colaboradores COL 
	 inner join colaboraciones COLA on COL.ID = COLA.IDColaborador
	 inner join tareas T on COLA.IDTarea = t.ID
	 inner join modulos M on T.IDModulo = M.ID 
	 inner join proyectos P on P.ID = M.IDProyecto 
	 where P.FechaFin is null 
