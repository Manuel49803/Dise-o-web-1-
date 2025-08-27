use colegio2410;
show tables;

select sysdate();
select sysdate() from dual;

select sysdate(), user(), database(), current_date(), current_time();
select 5+6 AS suma, 5 - 6 AS resta, 5*6 multiplicacion, 5/6 division, ((5*6) / (5/6) - 5);

select 'Hola mundo' as saludo;

select sysdate() fecha, 8*9 operacion, (13*7) + 10 op2, 'hola' saludo;

show tables;

select * from alumnos;

select * from alumnos limit 5;

select * from alumnos;

select distinct * from alumnos;

select distinct sexo from alumnos;

select distinct ciudad from alumnos;

select distinct sexo, ciudad, colonia from alumnos order by ciudad;

select distinct nombre from alumnos order by nombre;

select * from alumnos 
WHERE sexo = '';

select * from alumnos 
WHERE sexo = 'F';

select * from alumnos 
WHERE sexo = 'M';

select * from alumnos 
WHERE sexo = 'X';

select distinct nombre from alumnos 
where sexo = 'F'
order by nombre;

select distinct nombre from alumnos 
where sexo = 'F' AND ciudad = 'QUERETARO'
order by nombre;

select nombre, ap_paterno, curp, sexo, ciudad, email
from alumnos 
where sexo = 'F' AND ciudad = 'QUERETARO'
order by nombre;

select nombre, ap_paterno, curp, sexo, ciudad, email
from alumnos 
where (sexo = 'F' OR ciudad = 'QUERETARO')
AND curp != ''
order by nombre;

select sexo from alumnos group by sexo;

-- Funciones de agregación
-- sum, max, min, avg, count

select sexo, count(*) nreg 
from alumnos 
group by sexo;

select ciudad, sexo, count(*) nreg 
from alumnos 
group by ciudad, sexo
order by ciudad, sexo;

select ciudad, sexo, count(*) nreg 
from alumnos 
group by ciudad, sexo
having count(*) > 1
order by ciudad, sexo;

select ciudad, count(*) nreg 
from alumnos 
group by ciudad
having count(*) > 1
order by ciudad;

select ciudad, count(*) nreg 
from alumnos 
group by ciudad
having count(*) = 1
order by ciudad;

select ciudad, count(*) nreg 
from alumnos 
where ciudad != 'QUERETARO'
group by ciudad
having count(*) > 1
order by ciudad;

select ciudad, count(*) nreg 
from alumnos 
where ciudad != 'QUERETARO'
group by ciudad
having count(*) > 1
order by 2 desc;

select ciudad, count(*) nreg 
from alumnos 
where ciudad != 'QUERETARO'
group by ciudad
having count(*) > 1
order by 2 desc
limit 5;

select ciudad, count(*) nreg 
from alumnos 
where ciudad != 'QUERETARO' and sexo = 'F'
group by ciudad
having count(*) > 1
order by 2 desc
limit 5;

select * from alumnos 
limit 5;

select * from alumnos 
limit 10, 5;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura from alumnos;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura 
from alumnos
where curp = ''
order by curp;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura 
from alumnos
where curp is null
order by curp;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura 
from alumnos
where (curp is NOT null AND curp != '') 
order by curp;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura 
from alumnos
where length(curp) = 18
order by curp;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where length(curp) != 18
order by curp;

select length(curp) largocurp, count(*) nreg
from alumnos
group by length(curp)
order by 1;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where  NOT (nombre = 'fernando' OR nombre = 'gabriela' OR nombre = 'abraham')
order by curp;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where nombre IN ('fernando', 'GABRIELA', 'Abraham')
order by 2;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where BINARY nombre IN ('fernando', 'GABRIELA', 'Abraham')
order by 2;

select nombre, upper(nombre), lower(nombre), email, ucase(email), lcase(email)
from alumnos
-- where BINARY nombre IN ('fernando', 'GABRIELA', 'Abraham')
order by 2;


update alumnos set email = upper(email);

update alumnos set email = upper(email)
where length(email) > 0 ;

update alumnos set email = lower(email)
where length(email) > 0 ;

show variables like '%safe%';
set sql_safe_updates = 0;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where nombre NOT IN('fernando', 'GABRIELA', 'Abraham')
order by 2;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where estatura >= 1.60 AND estatura <= 1.70
order by estatura DESC;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where estatura >= 1.60 AND estatura <= 1.70
AND sexo = 'M' AND peso >= 70
order by estatura DESC;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where estatura between 1.60 AND 1.70
order by estatura DESC;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where estatura NOT between 1.60 AND 1.70
order by estatura DESC;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where estatura > 2.50
order by estatura DESC;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where nombre between 'F' AND 'H'
order by nombre asc;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, length(curp) largocurp 
from alumnos
where nombre not between 'F' AND 'H'
order by nombre asc;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, fedita 
from alumnos
-- where nombre not between 'F' AND 'H'
order by nombre asc;


select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, fedita 
from alumnos
where fedita NOT BETWEEN '2016-09-12 00:00:00' AND '2016-09-12 23:59:59'
order by fedita asc;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, curp, email, peso, estatura, fedita 
from alumnos
where fedita BETWEEN '2016-01-01 00:00:00' AND '2016-012-31 23:59:59'
order by fedita asc;

select count(*) from alumnos;

select * from pagos order by 1;

select distinct clave_alu from pagos;

select * 
from alumnos 
WHERE clave_alu IN(select distinct clave_alu from pagos)
order by nombre;

select * 
from alumnos 
WHERE clave_alu NOT IN(select distinct clave_alu from pagos)
order by nombre;

select * from pagos where clave_alu= 11040010;

select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre like '% % %';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre not like '%A';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre like '____';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre like '____ ____';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre like '__A%';
select nombre, ap_paterno, ap_materno, ciudad, email, curp from alumnos where email not like '%@%';
select ciudad, count(*) nreg from alumnos group by ciudad order by 1;
select * from (
select nombre, ap_paterno, ap_materno, ciudad, email, curp, if(ciudad like '%quer%' or ciudad like '%qro%', 'QUERETARO', ciudad) ciudad_normalizada from alumnos) x order by 7;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre rlike '^jose';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre rlike '(jose|adrian|ale)';
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where ciudad rlike '(quer|qro)' order by nombre;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre rlike '(^juan|maria$|jose)' order by nombre;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where ciudad not rlike '([ACD])' order by nombre;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre  rlike '(^[ACD])' order by nombre;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre  rlike '([ROZ])$' order by nombre;
select nombre, ap_paterno, ap_materno, ciudad, email from alumnos where nombre  rlike '^.{4}$' order by nombre;

use colegio2410;
select sysdate(), current_date(), current_time(), current_timestamp();
select * from alumnos;

select sysdate(),
 date_format(sysdate(),  'Hoy es el dia %j de 365') f1,
 date_format(sysdate(),  'Semana no %u') f2,
 date_format(sysdate(),  'Año %Y mes %b dia %D %W') f3;
 
 show variables like '%time_name%';
 set lc_time_names = 'es_Mex';

desc alumnos;
select * from alumnos;
select sysdate(), 
date_format(sysdate(), 'Hoy es el dia %j de 365') f1, 
date_format(sysdate(), 'Semana no %u') f2,
date_format(sysdate(), 'Año %Y mes %b dia %D %W') f3;

select fedita,
date_format(fedita, '%Y') anio,
date_format(fedita, '%m') mes,
date_format(fedita, '%M') nombre_mes,
date_format(fedita, '%d') dia,
date_format(fedita, '%W') nombre_dia,
date_format(fedita, '%u') semana,
date_format(fedita, '%j') no_dia,
date_format(fedita, '%H') hora,
date_format(fedita, '%i') minuto,
date_format(fedita, '%s') segundo,
date_format(fedita, '%p') ampa
from alumnos
where date_format(fedita, '%Y') ;

show variables like '%time_name';
set lc_time_names = 'es_Mex';

select fedita, year(fedita) anio, month(fedita) mes, monthname(fedita) mes, day(fedita) dia, 
dayname(fedita) ndia, dayofweek(fedita) diasemana, dayofyear(fedita) dianio, hour(fedita)  hora,
 minute(fedita) min, second(fedita) segundo, week(fedita) semana, quarter(fedita) trimestre from alumnos; 

select fedita, extract(year from fedita) anio, extract(year_month from fedita) mes,
extract(hour_second from fedita) dia from alumnos;

select month(fedita) no_mes, monthname(fedita) nmes, count(*) nreg from alumnos group by monthname(fedita) order by 1;

select year(fedita) anio, count(*) nreg from alumnos group by year(fedita) order by 1;

select  year(fedita) anio, month(fedita) no_mes, monthname(fedita) nmes, 
count(*) nreg from alumnos group by year(fedita), month(fedita), monthname(fedita) order by 2;

select no_mes, nmes mes, 
SUM(if(anio = '2016', nreg, 0))'2016',
SUM(if(anio = '2017', nreg, 0))'2017',
SUM(if(anio = '2018', nreg, 0))'2018',
SUM(if(anio = '2019', nreg, 0))'2019'
 from
 (select  year(fedita) anio, month(fedita) no_mes, monthname(fedita) nmes, 
count(*) nreg 
from alumnos 
group by year(fedita), month(fedita), monthname(fedita)) x
group by no_names, nmes
order by 1;

-- date add() date_sub()
select sysdate(), date_add(sysdate(), interval 1 hour) hcn,
date_sub(sysdate(), interval 1 hour) hyj;

select sysdate(), date_sub(sysdate(), interval -1 hour) htj,
date_sub(sysdate(), interval -1 hour) hcun;

set @mihora = '2024-12-31 23:59:59';

select @mihora,
date_add(@mihora, interval 1 second) seg,
date_add(@mihora, interval 1 minute) min,
date_add(@mihora, interval 1 hour) hr,
date_add(@mihora, interval 1 month) mes,
date_add(@mihora, interval 1 year) anio,
date_add(@mihora, interval 1 week) semana,
date_add(@mihora, interval 1 quarter)  trim;

select fedita, date_add(date_add(date_add(fedita, interval 3 day), interval 3 month), interval 3 month) nfecha from alumnos;

-- datediff()

select fedita, now(), datediff(now(), fedita) difdias from alumnos;

select fedita, now(), datediff(now(), fedita) difdias from alumnos where datediff(now(), fedita)>3000;

select fedita, now(), datediff(now(), fedita) difdias, 
if(datediff(now(), fedita)>3000, 'Tienes mas de 3K dias', 'Aun estas a tiempo') msg from alumnos;

select fedita, now(), datediff(now(), fedita) difdias,
(datediff(now(), fedita)/365) difanios,
(datediff(now(), fedita)*24) difhrs,
timestampdiff(year, fedita, now()) danio,
timestampdiff(hour, fedita, now()) dhr,
timestampdiff(second, fedita, now()) drseg,
timestampdiff(week, fedita, now()) dseman
 from alumnos;


select * from pagos order by 1;
select * from cursos;
select * from estados;


 select count(*) from alumnos a, pagos p, cursos c, estados e order by 1 limit 20;

 select count(*) from alumnos a, pagos p order by 1 limit 20;

-- join

  select * from alumnos a, pagos p where a.clave_alu = p.clave_alu;
  
    select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  nombre) alumno, id_estado, pago, fecha_pago, ref_alfanumerica, id_curso from alumnos a, pagos p
    where a.clave_alu = p.clave_alu order by 1;

    select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre) alumno, e.id_estado, pago, fecha_pago, ref_alfanumerica, c.id_curso, c.abreviatura curso
    from alumnos a, pagos p, cursos c, estados e
    where a.clave_alu = p.clave_alu and c.id_curso = p.id_curso and e.id_estado = a.id_estado order by 1;
    
      select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre) alumno, e.id_estado, pago, fecha_pago, ref_alfanumerica, c.id_curso, c.abreviatura curso
    from alumnos a, pagos p, cursos c, estados e
    where a.clave_alu = p.clave_alu and c.id_curso = p.id_curso and e.id_estado = a.id_estado and pago > 3000 order by 1;
    
    select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre) alumno, estado, sum(pago) tpago, count(*) npagos
    from alumnos a, pagos p, cursos c, estados e
    where a.clave_alu = p.clave_alu and c.id_curso = p.id_curso and e.id_estado = a.id_estado group by  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre), estado  order by 1;
    
     select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre) alumno, estado, sum(pago) tpago, count(*) npagos
    from alumnos a, pagos p, cursos c, estados e
    where a.clave_alu = p.clave_alu and c.id_curso = p.id_curso and e.id_estado = a.id_estado and sexo = 'F' 
    group by  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre), estado having sum(pago) >= 30000 order by 1;
    
	select  estado, sum(pago) tpago, count(*) npagos, 
	truncate(avg(pago), 2) prompago
    from alumnos a, pagos p, cursos c, estados e
    where a.clave_alu = p.clave_alu and c.id_curso = p.id_curso and e.id_estado = a.id_estado
    group by  estado  order by 1;
     
	select  a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre) alumno, sum(pago) tpago, count(*) npagos, avg(pago) pagoprom
    from alumnos a
    left join pagos p ON (a.clave_alu = p.clave_alu)
    group by a.clave_alu, concat_ws('', ap_paterno, ap_materno,  a.nombre)  order by 2;
    
    -- union 
    select * from niveles
     union
    select * from grados;
    
    select * from niveles
     union
    select * from grados
    union 
	select clave_mat, nombre from materias;
    
   select  id_nivel id, nombre concepto from niveles
     union
  select clave_mat, nombre from materias
    order by 2;
    
    select * from alumnos;
    select * from profesores;

select clave_alu clave, ap_paterno paterno, ap_materno materno, nombre, curp, sexo, ciudad, 'alumno' tipo 
from alumnos
union
select clave_ prof, ap_paterno, ap_materno, nombre, curp, sexo, ciudad, 'profesor' tipo 
from profesores;

select * from (select clave_alu clave, ap_paterno paterno, ap_materno materno, nombre, curp, sexo, ciudad, 'alumno' tipo 
from alumnos
union
select clave_ prof, ap_paterno, ap_materno, nombre, curp, sexo, ciudad, 'profesor' tipo 
from profesores) x where sexo='F'
 order by 2, 3, 4;
 
 create database test2410;
 create table test2410.alumno as select * from colegio2410.alumnos;
 
 select clave_alu clave, ap_paterno paterno, ap_materno materno, nombre, curp, sexo, ciudad, 'alumno' tipo 
from alumnos
union
select clave_ prof, ap_paterno, ap_materno, nombre, curp, sexo, ciudad, 'profesor' tipo 
from profesores;

create or replace view estudiantes as select * from alumnos;

desc estudiantes;
 show full tables;

select * from estudiantes;

create or replace view inscritos as
select clave_alu matricula, concat_ws('', ap_paterno, ap_materno, nombre) alumno,
if(ciudad rlike '(quer|qro)', 'QUERETARO', ciudad) cd, estatura * 100 altocm from alumnos;

desc inscritos;

select distinct  cd from inscritos order by 1;

select * from inscritos where cd = 'QUERETARO';
select * from alumnos where ciudad = 'QUERETARO';

create or replace view alumnas as select* from alumnos where sexo = 'F';
select * from alumnas; 

select *from alumnas where ciudad = 'QUERETARO';

create temporary table alumnos_tmp like alumnos;
insert into alumnos_tmp select * from alumnos;

select * from alumnos_tmp;

truncate table alumnos;

select * from inscritos;

drop table alumnos;
create table alumnos like alumnos_tmp;

insert into alumnos select *from alumnos_tmp; 
select * from alumnos;

select matricula , alumno, ifnull(sum(pago), 0) tpago, count(pago) npagos
 from inscritos i
 left join pagos p ON(i.matricula = p.clave_alu) group by matricula, alumno;
 
 select * from alumnos_pagos where tpago >= 3000;
 

-- Alexis Arredondo Fernandez 
-- Juan Manuel Portuguez Gonzalez 

CREATE TABLE info_alumno (
		clave_alu INT not NULL,
		fecha_registro DATETIME NOT NULL,
        campo1 varchar(100),
        campo2 varchar(100),
        campo3 varchar(100),
        campo4 varchar(100),
        primary key(clave_alu)
);

DELIMITER $$
CREATE TRIGGER after_insert_alumno
AFTER INSERT ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO info_alumno (clave_alu,fecha_registro,info1, info2, info3, info4) VALUES (NEW.clave_alu,NOW(),'', NULL, NULL, NULL);
END$$
DELIMITER ;

CREATE TABLE bitacora (
    clave_alu INT,
    usuario VARCHAR(100),
    fecha_modificacion DATETIME,
    descripcion TEXT
);

DELIMITER $$

CREATE TRIGGER before_update_alumno
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    DECLARE cambio TEXT;

    IF NEW.curp <> OLD.curp OR NEW.email <> OLD.email THEN
        SET cambio = CONCAT('CURP: ', OLD.curp, ' -> ', NEW.curp, ' | ','Email: ', OLD.email, ' -> ', NEW.email);
        INSERT INTO bitacora (clave_alu, usuario, fecha_modificacion, descripcion)
        VALUES (OLD.clave_alu, CURRENT_USER(),
		NOW(),cambio);
        
    END IF;
    SET NEW.nombre = UPPER(NEW.nombre);
    SET NEW.ap_paterno = UPPER(NEW.ap_paterno);
    SET NEW.ap_materno = UPPER(NEW.ap_materno);
    SET NEW.curp = UPPER(NEW.curp);
END$$

DELIMITER ;

select * from info_alumno;

DELIMITER $$

CREATE TRIGGER before_delete_alumno
BEFORE DELETE ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO bitacora(
        clave_alu,
        usuario,
        fecha_modificacion,
        descripcion
    ) VALUES (OLD.clave_alu,URRENT_USER(),NOW(),
        CONCAT('Alumno eliminado: ', UPPER(OLD.nombre), ' ', UPPER(OLD.ap_paterno), ' ', UPPER(OLD.ap_materno),', CURP: ', UPPER(OLD.curp), ', por ', CURRENT_USER())
    );
END$$

DELIMITER ;
select * from bitacora;
 
INSERT INTO alumnos (
    clave_alu, clave_admin, ap_paterno, ap_materno, nombre,
    sexo, curp, direccion, colonia, cp, ciudad, id_estado, delegacion
) VALUES (9999, 1234, 'PORTUGUEZ','GONZALEZ','JUAN MANUEL','H', 'POGJ010101HDFRNL01', 'AVENIDA DEL MAESTRO','COL. UNIVERSITARIA',54321,'QUERETARO',22,'QUERETARO CENTRO');