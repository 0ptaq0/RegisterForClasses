CREATE TABLE "semester" (
	"semester_id" serial primary key,
	"semester_describtion" varchar);
	
	
CREATE TABLE "course" (
	"c_id" serial not null,
	"c_name" varchar NOT NULL,
	"c_describtion" varchar,
	"semester_id" int,
	PRIMARY KEY (c_id, semester_id),
	FOREIGN KEY (semester_id) references semester(semester_id));


CREATE TABLE "staff" (
	"staff_id" serial primary key,
	"staff_lastname" varchar(40) NOT NULL,
	"staff_firstname" varchar(40) NOT NULL,
	"staff_email" varchar(40));

	
CREATE TABLE "student" (
	"s_id" serial PRIMARY KEY,
	"s_lastname" varchar(40) NOT NULL,
	"s_firstname" varchar(40) NOT NULL,
	"semester_id" int default '1',
	foreign key (semester_id) references semester(semester_id));

	
CREATE TABLE "location" (
	"location_id" serial,
	"room_nr" int,
	"building_id" varchar(40) DEFAULT 'D5',
	"max_students" int default '10',
	primary key (location_id, max_students));



CREATE TABLE "course_section" (
	"c_section_id" int not null,
	"c_id" int NOT NULL,
	"semester_id" int NOT NULL,
	"staff_id" int not null,
	"location_id" int not null,
	"c_section_date" DATE,
	"c_section_time" TIME default '08:00:00',
	"c_section_during" TIME default '01:30:00',
	"c_section_type" TEXT not null,
	"max_students" int not null,
	"students" int default '0',
	check(c_section_type = 'L' OR c_section_type = 'W' OR c_section_type = 'C' OR c_section_type = 'I'),
	primary key (c_section_id,c_id, c_section_date,c_section_time, semester_id),
	foreign key (c_id, semester_id) references course(c_id, semester_id),
	foreign key (staff_id) references staff(staff_id),
	foreign key (location_id, max_students) references location(location_id, max_students)
	);

	
	
CREATE TABLE "enrollment" (
	"s_id" int not null,
	"mark" int,
	"c_id" int not null,
	"c_section_id" int not null,
	"c_section_date" date not null,
	"c_section_time" time not null,
	"semester_id" int not null,	
	primary key (s_id,c_id,semester_id,c_section_id),
	foreign key (s_id) references student(s_id),
	foreign key (c_section_id,c_id, c_section_date,c_section_time, semester_id) references course_section(c_section_id,c_id, c_section_date,c_section_time, semester_id)
	);