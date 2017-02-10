--- enables professors set course section max students independently from room capacity

create function change_max_students(int, int) RETURNS void as'
declare 
kurs ALIAS FOR $1;
max_student2 ALIAS FOR $2;
max_student int;
begin
select max_students into max_student from course_section where kurs = c_section_id;

update course_section set students = (max_student-max_student2) where kurs = c_section_id;
raise notice ''Max students changed to % at course id %'', max_student2, kurs;

end;
' language 'plpgsql';

----------------------------------------------------
--- checks if location is available and if professor does not have classes on given time

create function check_course_section() returns trigger as '

begin
IF EXISTS (SELECT location_id,c_section_date, c_section_time from course_section where new.location_id=location_id AND new.c_section_date=c_section_date AND new.c_section_time=c_section_time) THEN	
RAISE NOTICE  ''On the selected room are already conducted classes at this time'';
return null;

ELSIF EXISTS (SELECT c_section_date, c_section_time from course_section where new.c_section_date=c_section_date AND new.c_section_time=c_section_time AND new.staff_id=staff_id) 
THEN
RAISE NOTICE  ''You already have classes on this time, please check your schedule'';
Return null;

ELSE
RAISE NOTICE ''ID Class: %, Date: %, Time: %'', new.location_id, new.c_section_date, new.c_section_time;
Return new;
END IF;
END;
' language 'plpgsql';

create trigger t_check_course_section before insert on course_section for each row execute procedure check_course_section();

----------------------------------------------------
----checks if the student does not have overlapping activities and if there are any available vacancies
create function check_enrollment() returns trigger as '
declare

students_amount int;
max_students_amount int;

begin
Select students, max_students into students_amount, max_students_amount from course_section where new.c_section_id = course_section.c_section_id;

IF EXISTS (SELECT c_section_date, c_section_time from enrollment where new.c_section_date=c_section_date AND new.c_section_time=c_section_time AND new.s_id=s_id) 
THEN
RAISE NOTICE  ''You have already classes at this time'';
Return null;

ELSIF students_amount>=max_students_amount THEN
RAISE NOTICE  ''All vacancies for this classes are already taken, sorry!'';
return null;

ELSE
UPDATE course_section SET students = students + 1 where 	new.c_section_id = course_section.c_section_id;
return new;

END IF;
END;
' language 'plpgsql';

create trigger t_check_enrollment before insert on enrollment for each row execute procedure check_enrollment();

----------------------------------------------------
---checks whether a student is eligible for the course

create function check_semester() returns trigger as '
declare
semester int;
s int;
begin
Select s_id, semester_id into s, semester from student where s_id=new.s_id and semester_id=new.semester_id;
IF semester = new.semester_id AND new.s_id=s THEN	
return new;
ELSE
RAISE NOTICE  ''You can not apply for a ten course, is not provided in your semester'';
Return null;
END IF;
END;
' language 'plpgsql';

create trigger t_check_semester before insert on enrollment for each row execute procedure check_semester();