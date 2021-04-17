Use blueprint
--  1) Listado de todos los clientes.
        select * from clientes
--  2) Listado de todos los proyectos.
       select * from proyectos
--  3) Listado con nombre, descripci�n, costo, fecha de inicio y de fin de todos los proyectos.
       Select nombre,descripcion,costoEstimado,fechainicio, fechafin From Proyectos
--  4) Listado con nombre, descripci�n, costo y fecha de inicio de todos los proyectos con costo mayor a cien mil pesos.
       Select nombre,descripcion,costoEstimado,fechainicio from proyectos where costoEstimado > 100000 
--  5) Listado con nombre, descripci�n, costo y fecha de inicio de todos los proyectos con costo menor a cincuenta mil pesos .
       Select nombre,descripcion,costoEstimado,fechainicio from proyectos where costoEstimado < 50000
--  6) Listado con todos los datos de todos los proyectos que comiencen en el a�o 2020.
       Select * From Proyectos Where Year(fechainicio) = 2020 
--  7) Listado con nombre, descripci�n y costo de los proyectos que comiencen en el a�o 2020 y cuesten m�s de cien mil pesos.
       Select nombre, Descripcion, costoestimado From Proyectos Where Year(fechainicio) = 2020 AND CostoEstimado > 100000
--  8) Listado con nombre del proyecto, costo y a�o de inicio del proyecto.
       select nombre, costoEstimado, year(fechainicio) as a�o from proyectos
--  9) Listado con nombre del proyecto, costo, fecha de inicio, fecha de fin y d�as de duraci�n de los proyectos.
       select nombre, costoEstimado,fechainicio, fechafin, DATEDIFF(day, fechainicio, fechafin) as duracion_dias from proyectos 
-- 10) Listado con raz�n social, cuit y tel�fono de todos los clientes cuyo IDTipo sea 1, 3, 5 o 6
       select  razonSocial, CUIT, telefono from clientes where id in (1,3,5,6) 
-- 11) Listado con nombre del proyecto, costo, fecha de inicio y fin de todos los proyectos que no pertenezcan a los clientes 1, 5 ni 10.
       select nombre, costoEstimado, fechainicio, fechafin from proyectos where id not in (1,5,10)
-- 12) Listado con nombre del proyecto, costo y descripci�n de aquellos proyectos que hayan comenzado entre el 1/1/2018 y el 24/6/2018.
       select nombre, costoEstimado, descripcion from proyectos where fechainicio between '1/1/2018' and '24/6/2018' 
-- 13) Listado con nombre del proyecto, costo y descripci�n de aquellos proyectos que hayan finalizado entre el 1/1/2019 y el 12/12/2019.
       select nombre, costoEstimado, descripcion from proyectos where fechafin between '1/1/2019' and '12/12/2019' 
-- 14) Listado con nombre de proyecto y descripci�n de aquellos proyectos que a�n no hayan finalizado.
       select nombre, fechafin, descripcion from proyectos where fechafin > getdate()
-- 15) Listado con nombre de proyecto y descripci�n de aquellos proyectos que a�n no hayan comenzado.
       select fechainicio, nombre, descripcion from proyectos where fechainicio > getdate()
-- 16) Listado de clientes cuya raz�n social comience con letra vocal.
       select * from clientes where razonSocial like '[aeiou]%'
-- 17) Listado de clientes cuya raz�n social finalice con vocal.
       select * from clientes where razonSocial like '%[aeiou]'
-- 18) Listado de clientes cuya raz�n social finalice con la palabra 'Inc'
       select * from clientes where razonSocial like '%inc' 
-- 19) Listado de clientes cuya raz�n social no finalice con vocal.
       select * from clientes where razonSocial not like '%[aeiou]' 
-- 20) Listado de clientes cuya raz�n social no contenga espacios.
-- 21) Listado de clientes cuya raz�n social contenga m�s de un espacio.
-- 22) Listado de raz�n social, cuit, email y celular de aquellos clientes que tengan mail pero no tel�fono.
-- 23) Listado de raz�n social, cuit, email y celular de aquellos clientes que no tengan mail pero s� tel�fono.
-- 24) Listado de raz�n social, cuit, email, tel�fono o celular de aquellos clientes que tengan mail o tel�fono o celular .
-- 25) Listado de raz�n social, cuit y mail. Si no dispone de mail debe aparecer el texto "Sin mail".
-- 26) Listado de raz�n social, cuit y una columna llamada Contacto con el mail, si no posee mail, con el n�mero de celular y si no posee n�mero de celular con un texto que diga "Incontactable". 

