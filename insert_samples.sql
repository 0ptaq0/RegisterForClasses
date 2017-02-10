	insert into semester values ('1','First semester, very hard, much pressure');
	insert into semester values ('2','Second semester');
	insert into semester values ('3','Third semester');	
	insert into semester values ('4','Fourth semester');	
	
	insert into student (s_lastname,s_firstname, semester_id) values ('Jack','Unknown','1');
	insert into student (s_lastname,s_firstname, semester_id) values ('Jack','Some','1');
	insert into student (s_lastname,s_firstname, semester_id) values ('Jack','Jackie','1');
	insert into student (s_lastname,s_firstname, semester_id) values ('Gorgio','Ulani','1');
	
	insert into student (s_lastname,s_firstname, semester_id) values ('Gineko','Gucci','2');
	insert into student (s_lastname,s_firstname, semester_id) values ('Paris','Platynov','2');
	insert into student (s_lastname,s_firstname, semester_id) values ('Testo','Viron','2');
	insert into student (s_lastname,s_firstname, semester_id) values ('Michael','Jaglacci','2');
	
	insert into student (s_lastname,s_firstname, semester_id) values ('Vilhelm','VonTren','3');
	insert into student (s_lastname,s_firstname, semester_id) values ('Jahne','Ahonnen','3');
	insert into student (s_lastname,s_firstname, semester_id) values ('Code','Master','3');
	insert into student (s_lastname,s_firstname, semester_id) values ('Jahne','Heikonen','3');

	insert into staff (staff_lastname,staff_firstname,staff_email) values ('Hulington','Zig','welcome2@mykingdom.com');
	insert into staff (staff_lastname,staff_firstname,staff_email) values ('Huntington','Turbo','optimal@homepage.pl');
	
	insert into location (location_id,max_students,room_nr) values ('1','3','101');
	insert into location (location_id,max_students,room_nr) values ('2','4','102');
	insert into location (location_id,max_students,room_nr) values ('3','3','103');
	
	insert into course (c_name,c_describtion,semester_id) values ('SQL','basics','1');
	insert into course (c_name,c_describtion,semester_id) values ('C#','basics','1');
	insert into course (c_name,c_describtion,semester_id) values ('C++','basics','1');
	insert into course (c_name,c_describtion,semester_id) values ('Java','basics','2');
	insert into course (c_name,c_describtion,semester_id) values ('Python','advanced','3');
	

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('1','1','1','1','1','2017-01-01','08:00:00','01:00:00','W','3');

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('2','1','1','1','1','2017-01-01','09:00:00','01:00:00','L','3');

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('3','2','1','1','2','2017-01-01','10:00:00','01:00:00','W','4');							

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('4','2','1','2','2','2017-01-01','09:00:00','01:00:00','C','4');

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('5','3','1','2','3','2017-01-01','08:00:00','01:00:00','W','3');

insert into course_section (c_section_id, c_id, semester_id, staff_id, location_id, c_section_date, c_section_time, c_section_during, c_section_type, max_students) values ('6','4','2','2','3','2017-01-01','10:00:00','01:00:00','L','3');
	
	---OK
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','1','1','1','2017-01-01','08:00:00');
	
	---OK
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','2','1','1','2017-01-01','09:00:00');
	
	---OK
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','3','2','1','2017-01-01','10:00:00');
	
	---Error
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','4','2','1','2017-01-01','09:00:00');
	
	---Error
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','5','3','1','2017-01-01','08:00:00');
	
	---Error
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('1','6','4','2','2017-01-01','10:00:00');
	
	insert into enrollment (s_id, c_section_id, c_id, semester_id, c_section_date, c_section_time) values ('5','6','4','2','2017-01-01','10:00:00');