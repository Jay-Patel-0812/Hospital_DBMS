CREATE SCHEMA hospital; 
SET SEARCH_PATH TO hospital; 

CREATE TABLE hospital_employees ( 
hospital_emp_id SERIAL,
PRIMARY KEY (hospital_emp_id) 
); 

 
CREATE TABLE staff (
name VARCHAR(50) NOT NULL, 
aadhaar_id NUMERIC(12,0), 
type VARCHAR(30) NOT NULL, 
dob DATE NOT NULL, 
gender CHAR(1) CHECK (gender in (‘M’,’F’,’O’)), 
status BOOLEAN NOT NULL, 
mobile_number BIGINT NOT NULL, 
employee_id INT NOT NULL,

PRIMARY KEY (aadhaar_id),
FOREIGN KEY (employee_id) REFERENCES hospital_employees(hospital_emp_id)
ON  DELETE CASCADE ON  UPDATE CASCADE
); 


CREATE TABLE doctor (
aadhaar_id NUMERIC(12,0), 
name VARCHAR(50) NOT NULL, 
speciality VARCHAR(30) NOT NULL, 
office_number INT NOT NULL, 
dob DATE NOT NULL, 
gender CHAR(1) CHECK (gender in (‘M’,’F’,’O’)), 
status BOOLEAN NOT NULL, 
mobile_number BIGINT NOT NULL, 
employee_id INT NOT NULL,  

PRIMARY KEY (aadhaar_id), 
FOREIGN KEY (employee_id) REFERENCES hospital_employees(hospital_emp_id) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 

CREATE TABLE patient ( 
name VARCHAR(50) NOT NULL, 
aadhaar_id NUMERIC(12,0), 
dob DATE NOT NULL, 
gender CHAR(1) CHECK (gender in (‘M’,’F’,’O’)), 
mobile_number BIGINT NOT NULL, 
date_of_admit DATE , 
type BOOLEAN NOT NULL, 
blood_group VARCHAR(3), 
date_of_discharge DATE,   

PRIMARY KEY (aadhaar_id, date_of_admit) 
);  

CREATE TABLE medicines( 
medicine_id SERIAL, 
medicine_name VARCHAR(40) NOT NULL, 
cost_per_unit DECIMAL(8,2) NOT NULL, 
amount_in_unit SMALLINT NOT NULL, 
amount_available INT NOT NULL, 
company_name VARCHAR(40) NOT NULL,  

PRIMARY KEY (medicine_id) 
);  

CREATE TABLE prescription ( 
patient_id NUMERIC(12,0), 
date_of_admit DATE, 
doctor_aadhaar_id NUMERIC(12,0), 
medicine_id INT, 
from_date DATE, 
to_date DATE NOT NULL, 
morning_dose VARCHAR(10) NOT NULL, 
noon_dose VARCHAR(10) NOT NULL, 
night_dose VARCHAR(10) NOT NULL, 

PRIMARY KEY (patient_id, doctor_aadhaar_id, medicine_id, from_date), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (doctor_aadhaar_id) REFERENCES doctor(aadhaar_id) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 


CREATE TABLE bill ( 
patient_id NUMERIC(12,0), 
date_of_admit DATE, 
date_time TIMESTAMP, 
medicine_charges DECIMAL(10,2) NOT NULL, 
blood_t_charges DECIMAL(10,2) NOT NULL, 
operation_charges DECIMAL(10,2) NOT NULL, 
lab_charges DECIMAL(10,2) NOT NULL, 
service_charges DECIMAL(10,2) NOT NULL,  

PRIMARY KEY (patient_id, date_time), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 

CREATE TABLE lab_reports ( 
date_time TIMESTAMP, 
date_of_admit DATE, 
patient_id NUMERIC(12,0), 
type VARCHAR(30), 
lab_number SMALLINT NOT NULL,  

PRIMARY KEY (date_time, patient_id, type), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 

CREATE TABLE patient_disease ( 
disease VARCHAR(30), 
date_of_admit DATE, 
patient_id NUMERIC(12,0),  

PRIMARY KEY (patient_id, disease), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
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

PRIMARY KEY (patient_id, room_no), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (room_no) REFERENCES room(room_no) 
ON DELETE RESTRICT ON UPDATE CASCADE 
);  

CREATE TABLE blood_bank ( 
date DATE, 
A_pos_ml INT NOT NULL, 
A_neg_ml INT NOT NULL, 
B_pos_ml INT NOT NULL, 
B_neg_ml INT NOT NULL, 
O_pos_ml INT NOT NULL, 
O_neg_ml INT NOT NULL, 
AB_pos_ml INT NOT NULL, 
AB_neg_ml INT NOT NULL,  

PRIMARY KEY (date) 
); 

CREATE TABLE blood_transfusion ( 
date DATE, 
time TIME, 
date_of_admit DATE,  
patient_id NUMERIC(12,0), 
blood_gp VARCHAR(3) NOT NULL, 
amount_ml INT NOT NULL,  

PRIMARY KEY (date, time, patient_id), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (date) REFERENCES blood_bank(date) 
ON DELETE RESTRICT ON UPDATE CASCADE 
);  

CREATE TABLE operation ( 
operation_id SERIAL, 
date_of_admit DATE, 
patient_id NUMERIC(12,0) NOT NULL, 
begin_date_time TIMESTAMP NOT NULL, 
end_date_time TIMESTAMP NOT NULL, 
type VARCHAR(20) NOT NULL, 
	
PRIMARY KEY (operation_id), 
FOREIGN KEY (patient_id, date_of_admit) REFERENCES patient(aadhaar_id, date_of_admit) 
ON DELETE RESTRICT ON UPDATE CASCADE 
);  

CREATE TABLE operation_by (
operation_id INT, 
doctor_aadhaar_id NUMERIC(12,0),  

PRIMARY KEY (operation_id, doctor_aadhaar_id), 
FOREIGN KEY (doctor_aadhaar_id) REFERENCES doctor(aadhaar_id) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (operation_id) REFERENCES operation(operation_id) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 
