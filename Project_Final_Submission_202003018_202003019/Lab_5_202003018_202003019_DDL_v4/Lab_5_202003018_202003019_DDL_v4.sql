CREATE SCHEMA hospital;  

SET SEARCH_PATH TO hospital;  

  

CREATE TABLE hospital_employees (  

aadhar_id NUMERIC(12,0), 

PRIMARY KEY (aadhar_id)  

);  

  

  

CREATE TABLE staff ( 

fname VARCHAR(20) NOT NULL,  

mname VARCHAR(20) NOT NULL,  

lname VARCHAR(20) NOT NULL,  

aadhar_id NUMERIC(12,0),  

type VARCHAR(30) NOT NULL,  

dob DATE NOT NULL,  

gender CHAR(1) CHECK (gender in ('M','F','O')),  

status BOOLEAN NOT NULL,  

mobile_number BIGINT NOT NULL,  

  

PRIMARY KEY (aadhar_id), 

FOREIGN KEY (aadhar_id) REFERENCES hospital_employees(aadhar_id) 

ON  DELETE CASCADE ON  UPDATE CASCADE 

);  

  

  

CREATE TABLE doctor ( 

aadhar_id NUMERIC(12,0),  

fname VARCHAR(20) NOT NULL,  

mname VARCHAR(20) NOT NULL,  

lname VARCHAR(20) NOT NULL,  

speciality VARCHAR(30) NOT NULL,  

office_number INT NOT NULL,  

dob DATE NOT NULL,  

gender CHAR(1) CHECK (gender in ('M','F','O')),  

status BOOLEAN NOT NULL,  

mobile_number BIGINT NOT NULL,  

  

PRIMARY KEY (aadhar_id),  

FOREIGN KEY (aadhar_id) REFERENCES hospital_employees(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE  

);  

  

CREATE TABLE patient_details(  

aadhar_id NUMERIC(12,0),  

dob DATE NOT NULL,  

gender CHAR(1) CHECK (gender in ('M','F','O')),  

fname VARCHAR(20) NOT NULL,  

mname VARCHAR(20) NOT NULL,  

lname VARCHAR(20) NOT NULL,  

blood_group VARCHAR(3),  

  

PRIMARY KEY (aadhar_id) 

);   

 

CREATE TABLE patient_records (  

aadhar_id NUMERIC(12,0),  

mobile_number BIGINT NOT NULL,  

date_of_admit DATE ,  

type BOOLEAN NOT NULL,  

days_admitted INT,    

  

PRIMARY KEY (aadhar_id, date_of_admit),

FOREIGN KEY (aadhar_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE 

);   

 

  

CREATE TABLE medicines(  

medicine_id SERIAL,  

medicine_name VARCHAR(40) NOT NULL,  

cost_per_unit DECIMAL(8,2) NOT NULL,  

amount_in_unit SMALLINT NOT NULL,  

amount_available INT NOT NULL CHECK (amount_available > 0),  

company_name VARCHAR(40) NOT NULL,   

  

PRIMARY KEY (medicine_id)  

);   

  

CREATE TABLE prescription (  

patient_id NUMERIC(12,0),  

doctor_id NUMERIC(12,0),  

medicine_id INT,  

from_date DATE,  

to_date DATE NOT NULL,  

morning_dose VARCHAR(10) NOT NULL,  

noon_dose VARCHAR(10) NOT NULL,  

night_dose VARCHAR(10) NOT NULL,  

  

PRIMARY KEY (patient_id, doctor_id, medicine_id, from_date),  

FOREIGN KEY (patient_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE,  

FOREIGN KEY (doctor_id) REFERENCES hospital_employees(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE,  

FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)  

ON DELETE RESTRICT ON UPDATE CASCADE  

);  

  

  

CREATE TABLE bill (  

patient_id NUMERIC(12,0),  

date_time TIMESTAMP,  

status BOOLEAN NOT NULL,  

medicine_charges DECIMAL(10,2) NOT NULL,  

blood_t_charges DECIMAL(10,2) NOT NULL,  

operation_charges DECIMAL(10,2) NOT NULL,  

lab_charges DECIMAL(10,2) NOT NULL,  

service_charges DECIMAL(10,2) NOT NULL,   

  

PRIMARY KEY (patient_id, date_time),  

FOREIGN KEY (patient_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE  

);  

  

CREATE TABLE lab_reports (  

date_time TIMESTAMP,  

patient_id NUMERIC(12,0),  

type VARCHAR(30),  

lab_number SMALLINT NOT NULL,   

  

PRIMARY KEY (date_time, patient_id, type),  

FOREIGN KEY (patient_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE  

);  

  

CREATE TABLE patient_disease (  

disease VARCHAR(30),  

date_of_admit DATE,  

patient_id NUMERIC(12,0),   

  

PRIMARY KEY (patient_id, disease,date_of_admit), 
FOREIGN KEY (patient_id,date_of_admit) REFERENCES patient_records(aadhar_id,date_of_admit)  
ON DELETE RESTRICT ON UPDATE CASCADE 

);  

  

CREATE TABLE room (  

room_no SERIAL,  

number_of_beds SMALLINT NOT NULL,  

number_of_beds_occupied SMALLINT NOT NULL,   

  

PRIMARY KEY (room_no)  

);   

  

CREATE TABLE admitted_patients_ids (  

room_no INT,  

date_of_admit DATE,  

patient_id NUMERIC(12,0),   

  

PRIMARY KEY (patient_id, room_no,date_of_admit),  

FOREIGN KEY (patient_id,date_of_admit) REFERENCES patient_records(aadhar_id,date_of_admit)  
ON DELETE RESTRICT ON UPDATE CASCADE, 

FOREIGN KEY (room_no) REFERENCES room(room_no)  

ON DELETE RESTRICT ON UPDATE CASCADE  

);   

  

CREATE TABLE blood_bank (  

date DATE,  

A_pos_ml INT NOT NULL CHECK (A_pos_ml > 0),  

A_neg_ml INT NOT NULL CHECK (A_neg_ml > 0),  

B_pos_ml INT NOT NULL CHECK (B_pos_ml > 0),  

B_neg_ml INT NOT NULL CHECK (B_neg_ml > 0),  

O_pos_ml INT NOT NULL CHECK (O_pos_ml > 0),  

O_neg_ml INT NOT NULL CHECK (O_neg_ml > 0),  

AB_pos_ml INT NOT NULL CHECK (AB_pos_ml > 0),  

AB_neg_ml INT NOT NULL CHECK (AB_neg_ml > 0),   

  

PRIMARY KEY (date)  

);  

  

CREATE TABLE blood_transfusion (  

date DATE,  

time TIME,  

patient_id NUMERIC(12,0),  

amount_ml INT NOT NULL,   

  

PRIMARY KEY (date, time, patient_id),  

FOREIGN KEY (patient_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE, 

FOREIGN KEY (date) REFERENCES blood_bank(date)  

ON DELETE RESTRICT ON UPDATE RESTRICT  

);   

CREATE TABLE donor_details(

fname VARCHAR(20) NOT NULL,  

mname VARCHAR(20) NOT NULL,  

lname VARCHAR(20) NOT NULL,  

aadhar_id NUMERIC(12,0),  

dob DATE NOT NULL,  

gender CHAR(1) CHECK (gender in ('M','F','O')),

blood_group VARCHAR(3),

PRIMARY KEY (aadhar_id)

);

CREATE TABLE donor_record(

date DATE,

aadhar_id NUMERIC(12,0),  

mobile_number BIGINT NOT NULL,  

amount_donated_ml INT NOT NULL,

  
PRIMARY KEY (aadhar_id, date),

FOREIGN KEY (aadhar_id) REFERENCES donor_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE,

FOREIGN KEY (date) REFERENCES blood_bank(date)

ON DELETE RESTRICT ON UPDATE RESTRICT

);

  

CREATE TABLE operation (  

patient_id NUMERIC(12,0) NOT NULL,  

begin_date_time TIMESTAMP NOT NULL,  

duration TIME NOT NULL,  

type VARCHAR(20) NOT NULL,  

doctor_id NUMERIC(12,0),   
	 

PRIMARY KEY (patient_id,begin_date_time,doctor_id),  

FOREIGN KEY (doctor_id) REFERENCES hospital_employees(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE,  

FOREIGN KEY (patient_id) REFERENCES patient_details(aadhar_id)  

ON DELETE RESTRICT ON UPDATE CASCADE 

);   

  


			 

		 

	 