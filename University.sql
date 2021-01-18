

  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
  SET AUTOCOMMIT = 0;
  START TRANSACTION;
  SET time_zone = "+00:00";

CREATE database university;
COMMIT;
use university;
  -- Table structure for table `Department`
  CREATE TABLE Department (department_id INT PRIMARY KEY AUTO_INCREMENT, 
  department_name VARCHAR(255) NOT NULL
  );

  -- Table structure for table `Professor`
  CREATE TABLE Professor (professor_id INT PRIMARY KEY AUTO_INCREMENT, 
  professor_name VARCHAR(255) NOT NULL
);

  -- Table structure for table `Course`
  CREATE TABLE Course (course_id INT PRIMARY KEY AUTO_INCREMENT, 
  course_name VARCHAR(255) NOT NULL,
  course_description VARCHAR(255) NOT NULL,
  department_id INT,
  professor_id INT,
   FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
   FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
COMMIT;



INSERT INTO `Department`(`department_name`) VALUES ("Coumputer");
INSERT INTO `Department`(`department_name`) VALUES ("communication");
INSERT INTO `Department`(`department_name`) VALUES ("math");
INSERT INTO `Department`(`department_name`) VALUES ("Finance");
INSERT INTO `Department`(`department_name`) VALUES ("Digital marketing");
INSERT INTO `Department`(`department_name`) VALUES ("FesabilityStudies");
INSERT INTO `Department`(`department_name`) VALUES ("Accounting");

COMMIT;

INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Ahmed mohamed");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Ahmed Hassa");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Ismail aly");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. ezzat abo ouf");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Tamer hagras");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Mai azab");
INSERT INTO `Professor`(`professor_name`) VALUES ("Dr. Ismail younes");
COMMIT;


INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Data base','computer science',7,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Data science','big data science',2,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Data_structurs','computer science',3,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Accounting','humanity',6,4);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('marketing','computer humanity',1,3);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('finance','computer humanity',4,6);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('ethis','computer humanity',4,3);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('history','computer humanity',1,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('maths','computer science',4,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('physics','computer science',1,4);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Data stuctures2','computer science',1,7);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('biology','science',3,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('organization','computer science',6,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('architecture','computer science',7,5);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('statistics','marketing',5,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES (' graph','term1 computer science',5,5);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('chemistery','computer science',2,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('physic2','computer science',4,4);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('math2','computer science',1,5);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Discrete','computer science',3,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('discrete2','computer science',4,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('math3','computer science term3',1,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES (' numerical','math ',4,4);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('analog','communication ',1,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('digital ','communication ',5,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Digital marketing','Marketing ',1,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('Big data',' Coursera',5,5);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('deep learning','cousera ',1,2);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('artifitial intelligence','Udemy ',3,3);
INSERT INTO `Course`( `course_name`, `course_description`, `department_id`, `professor_id`) VALUES ('feasability','humanity ',1,2);


  COMMIT;




