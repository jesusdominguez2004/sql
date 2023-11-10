-- funciones_propias

-- 01. contar profesores de un departamento ingresado
DELIMITER $$
create function dept_count(dept_name varchar(20))
returns int
deterministic
begin
declare d_count int;
	select count(*) into d_count
    from instructor
    where instructor.dept_name = dept_name;
return (d_count);
end $$
DELIMITER ;

-- 02. obtener nivel del profesor ingresado
-- nota: "s_ID" e "i_ID" son campos de la tabla "advisor"
DELIMITER $$
create function teacher_advisor(instructor_id varchar(5))
returns varchar(20)
deterministic
begin
declare s_count int;
declare s_level varchar(20);
    select count(s_ID) into s_count
    from advisor
    where i_ID = instructor_id
    group by i_ID;
    if s_count < 30 then
		set s_level = "Bajo";
	end if;
    if s_count >= 30 and s_count < 50 then
		set s_level = "Medio";
	end if;
    if s_count >= 50 then
		set s_level = "Alto";
	end if;
return (s_level);
end $$
DELIMITER ;

-- prueba "01. contar profesores de un departamento ingresado"
-- mostrar departamentos y número profesores
-- "order by" teachers ascendente
select distinct dept_name, dept_count(dept_name) as teachers
from department
order by teachers;

-- prueba "01. contar profesores de un departamento ingresado"
-- mostrar nombre departamento y presupuesto
-- con más de cuatro profesores
select dept_name, budget
from department
where dept_count(dept_name) > 4;

-- prueba "02. obtener nivel del profesor ingresado"
-- mostrar id, nombre y nivel de todos los profesores
select ID, name, teacher_advisor(ID) as TeacherLevel
from instructor;
