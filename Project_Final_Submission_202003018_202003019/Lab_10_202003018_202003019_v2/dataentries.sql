insert into hospital_employees (aadhar_id) values ('240151582862');
insert into hospital_employees (aadhar_id) values ('657596761672');
insert into hospital_employees (aadhar_id) values ('115096605071');
insert into hospital_employees (aadhar_id) values ('309978348685');
insert into hospital_employees (aadhar_id) values ('220195004338');
insert into hospital_employees (aadhar_id) values ('986786537816');
insert into hospital_employees (aadhar_id) values ('131407887378');
insert into hospital_employees (aadhar_id) values ('596818320348');
insert into hospital_employees (aadhar_id) values ('540258634201');
insert into hospital_employees (aadhar_id) values ('817173284778');
insert into hospital_employees (aadhar_id) values ('928298557373');
insert into hospital_employees (aadhar_id) values ('128039820290');
insert into hospital_employees (aadhar_id) values ('500414040856');
insert into hospital_employees (aadhar_id) values ('895693505998');
insert into hospital_employees (aadhar_id) values ('929846769593');
insert into hospital_employees (aadhar_id) values ('759876212069');
insert into hospital_employees (aadhar_id) values ('226690388489');
insert into hospital_employees (aadhar_id) values ('945053266458');
insert into hospital_employees (aadhar_id) values ('885061467862');
insert into hospital_employees (aadhar_id) values ('707133308409');

insert into doctor (aadhar_id, fname,mname,lname, office_number, dob, gender, status, mobile_number, speciality) 
values 
(240151582862, 'Sena', 'Hildagarde', 'Tschierasche', 3870389, '04/10/1984', 'F', false, 4769191797, 'Dentist'), 
(657596761672, 'Callean', 'Hurlee', 'Landman', 3573075, '04/10/1968', 'F', true, 2601446114, 'Cardiologists'), 
(115096605071, 'Elissa', 'Blake', 'Outlaw', 792201, '02/10/1981', 'F', true, 6855614415, 'Dermatologists'),
(309978348685, 'Neille', 'Marys', 'Norster', 2059546, '01/10/1971', 'F', false, 4387347737, 'Dentist'), 
(220195004338, 'Vivianna', 'Preston', 'Shearstone', 3705398, '01/10/1968', 'F', true, 4999312198, 'Anesthesiologist'), 
(986786537816, 'Janeen', 'Lonee', 'Leeburn', 3348374, '03/10/1985', 'F', false, 9214236043, 'Cardiologists'), 
(131407887378, 'Darryl', 'Carlota', 'Riccardelli', 996310, '04/10/1975', 'M', false, 2045737006, 'General'), 
(596818320348, 'Jackie', 'Marcos', 'Merit', 8922088, '06/10/1979', 'M', false, 3822021788, 'Physician'), 
(540258634201, 'Blake','Bari', 'Tidd', 9631922, '05/10/1981', 'M', true, 9828929057, 'Physician'), 
(817173284778, 'Rita', 'Obediah', 'Jellings', 7142311, '07/10/1990', 'F', true, 3810618097, 'Dermatologists');

insert into staff (aadhar_id,fname,mname,lname, dob, gender, status, mobile_number, type) values 
(928298557373, 'Barnie', 'Brewer', 'Wren', '04/10/1981', 'M', false, 9688576507, 'Nurse'), 
(128039820290, 'Aigneis', 'Thornie', 'Urquhart', '06/10/1984', 'M', true, 5630555012, 'Receptionist'), 
(500414040856, 'Rosette', 'Phylys', 'Ivey', '01/10/1973', 'F', true, 1583379268, 'Nurse'), 
(895693505998, 'Marshall', 'Benoite', 'Schiefersten', '07/10/1991', 'M', false, 3019044955, 'Dietitian'), 
(929846769593, 'Elwyn', 'Katusha', 'Poetz', '03/10/1983', 'F', true, 9967472418, 'Nurse'), 
(759876212069, 'Shirlene', 'Shelia', 'Redit', '04/10/1986', 'F', false, 2402712192, 'Receptionist'), 
(226690388489, 'Georg', 'Adriane', 'Kelwick', '04/10/1984', 'M', true, 3573452569, 'Dietitian'), 
(945053266458, 'Mackenzie', 'Ian', 'Delmonti', '02/10/1976', 'M', false, 9060748641, 'Nurse'), 
(885061467862, 'Moore', 'Vincent', 'Bichener', '04/10/1978', 'M', true, 1111371852, 'Nurse'), 
(707133308409, 'Ingrim', 'Yale', 'Gullis', '02/10/1987', 'F', true, 4156005098, 'Dietitian');

insert into patient_details (aadhar_id, fname,mname,lname, dob, gender, blood_group) values 
(926722993945, 'Jakob', 'Erek', 'Downes', '08/10/1981', 'M', 'A+'),
(713964268158, 'Shelli', 'Basilio', 'Febvre', '02/10/1976', 'M', 'AB+'), 
(923692306899,'Oralla', 'Jermaine', 'Keld', '01/10/1974', 'F', 'B+'), 
(707819011547, 'Aridatha', 'Chadd', 'Erwin', '07/10/1987', 'F', 'B-'), 
(107998063737, 'Konstantine', 'Derron', 'Spadoni', '01/10/1950', 'F', 'O+'), 
(547192762998, 'Bobby', 'Kendall', 'Bumby', '04/10/1960', 'M', 'O-'), 
(760724389956, 'Jamil','Boyce', 'Avivah', '04/10/1968', 'M', 'AB+'), 
(578283562069, 'Jane', 'Aubrette', 'Metschke', '06/10/1998', 'F', 'AB-'), 
(618290147720, 'Annetta', 'Rollie', 'Dowley', '08/10/1976', 'F', 'B-'), 
(983473196869, 'Elfrieda', 'Ilyssa', 'Farish', '05/10/2000', 'M', 'A-');

insert into patient_records (aadhar_id, mobile_number, date_of_admit, type, days_admitted) values 
(926722993945, 2869721284, '04/12/2020', true, 23), 
(713964268158, 6793899088, '08/07/2021', true, 41),
(923692306899, 3151506583, '04/01/2021', false, 0), 
(707819011547, 7757485516, '03/03/2020', false,0), 
(107998063737, 8493067024, '05/09/2020', false, 0), 
(547192762998, 7838102044, '09/11/2021', false, 0), 
(760724389956, 5317231019, '06/10/2021', true, NULL), 
(578283562069, 6781158105, '01/06/2021', true, 25), 
(618290147720, 5841257919, '09/09/2021', true, NULL), 
(983473196869, 2317120945, '08/11/2020', false, 0); 

insert into blood_bank (date, A_neg_ml, B_neg_ml, O_neg_ml, AB_neg_ml, A_pos_ml, B_pos_ml, 
O_pos_ml, AB_pos_ml) values 
('08/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('09/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('10/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('11/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('12/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('13/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('14/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('15/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('16/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000), 
('17/12/2020', 7000,8000,6000,5000,4000,5000,6000,4000);

insert into blood_transfusion (date,patient_id,amount_ml,time) values
('08/12/2020',926722993945,200, '7:06 PM'),
('08/12/2020',713964268158,300, '10:30 PM'),
('09/12/2020',760724389956,150, '1:09 AM'),
('11/12/2020',578283562069,400, '5:05 PM'),
('12/12/2020',618290147720,250, '7:06 PM'),
('14/12/2020',107998063737,200, '1:06 PM'),
('14/12/2020',707819011547,300, '8:06 PM'),
('15/12/2020',618290147720,200, '5:06 PM'),
('16/12/2020',107998063737,400, '7:06 PM'),
('17/12/2020',926722993945,200, '8:06 PM');

insert into donor_details (fname, mname, lname, aadhar_id, dob, gender, blood_group) values 
('Marti', 'Pippo', 'Binnall', '369422530023', '6-3-1973', 'f', 'B+'),
('Tiffi', 'Alec', 'Padfield', '446999549810', '11-7-1990', 'f', 'A-'),
('Sara-ann', 'Tyrone', 'Flahive', '461561570401', '7-2-1981', 'f', 'AB-'),
('Kimbell', 'Nathanael', 'Juszkiewicz', '561918813625', '9-1-1976', 'f', 'B+'),
('Joseito', 'Art', 'Sivill', '788384900786', '2-1-1973', 'm', 'A+'),
('Marina', 'Cedric', 'Costin', '751522725908', '9-1-1977', 'm', 'O-'),
('Frederic', 'Launce', 'Leithgoe', '767876482873', '3-1-1994', 'm', 'AB+'),
('Angele', 'Whitaker', 'Monteath', '839545953005', '9-9-1961', 'f', 'O+'),
('Alena', 'Reinhold', 'De Brett', '406536948991', '14-2-1980', 'f', 'B-'),
('Cathie', 'Teodoor', 'Kinmond', '274524469955', '6-4-1966', 'f', 'A+');

insert into donor_record (aadhar_id, date, mobile_number, amount_donated_ml) values 
('369422530023', '08/12/2020', '78575541289', '470'),
('446999549810', '09/12/2020', '7854965235', '470'),
('461561570401', '09/12/2020', '8549856752', '470'),
('561918813625', '10/12/2020', '7848579562', '470'),
('788384900786', '11/12/2020', '9895687854', '470'),
('751522725908', '12/12/2020', '9685356258', '470'),
('369422530023', '12/12/2020', '78575541289', '470'),
('767876482873', '12/12/2020', '9854523150', '470'),
('839545953005', '15/12/2020', '9620312045', '470'),
('406536948991', '16/12/2020', '8575410658', '470'),
('274524469955', '16/12/2020', '9752682150', '470');

insert into patient_disease (disease, date_of_admit, patient_id) values 
('Malaria', '04/12/2020',926722993945), 
('Cancer','08/07/2021', 713964268158), 
('Dengue','04/01/2021',923692306899), 
('Fever','03/03/2020',707819011547), 
('Pneumonia','05/09/2020',107998063737), 
('Typhoid','09/11/2021',547192762998), 
('Cough','06/10/2021',760724389956), 
('Dengue','01/06/2021',578283562069), 
('Cough','09/09/2021',618290147720), 
('Malaria','08/11/2020',983473196869);

insert into medicines (medicine_id, medicine_name, cost_per_unit, amount_in_unit, amount_available, 
company_name) values 
(1, 'Lithium Carbonate', 185, 10, 56, 'Krajcik Inc'), 
(2, 'Staples Instant Hand Sanitizer', 715, 20, 65, 'Osinski Group'), 
(3, 'Hand Cleanser', 236, 20, 43, 'Heller Group'), 
(4, 'Dexilant', 275, 5, 100, 'Bins-Jacobi'), 
(5, 'Naproxen', 460, 10, 49, 'Leuschke and Sons'), 
(6, 'MICRELL Sp', 200, 12, 25, 'Aufderhar Inc'), 
(7, 'Less Relief', 590, 10, 67, 'Lehner-Thompson'), 
(8, 'Levofloxacin', 920, 5, 49, 'Hayes LLC'), 
(9, 'hyoscyamine sulfate', 975, 5, 87, 'Kreiger-Greenholt'), 
(10, 'METFORMIN HYDROCHLORIDE', 200, 10, 50, 'Hauck, Lowe and Steuber');

insert into room (room_no, number_of_beds, number_of_beds_occupied) values 
(1, 40, 30), 
(2, 80, 12), 
(3, 15, 5), 
(4, 20, 8), 
(5, 77, 40);

insert into admitted_patients_ids (room_no,patient_id,date_of_admit) values 
(1,926722993945, '04/12/2020'), 
(2,713964268158, '08/07/2021'), 
(5,760724389956, '06/10/2021'), 
(3,578283562069, '01/06/2021');

insert into prescription (patient_id, doctor_id, medicine_id, from_date, to_date, morning_dose, noon_dose, night_dose) values
('926722993945', '131407887378', '5', '04/12/2020', '22/12/2020', '7', '6', '3'),
('923692306899', '131407887378', '7', '04/01/2021', '27/01/2021', '0', '1', '5'),
('926722993945', '986786537816', '4', '04/12/2020', '10/12/2020', '0', '9', '7'),
('707819011547', '131407887378', '1', '03/03/2020', '12/03/2020', '7', '9', '4'),
('578283562069', '540258634201', '2', '10/06/2021', '20/06/2021', '3', '3', '8'),
('926722993945', '540258634201', '8', '10/12/2020', '20/12/2020', '7', '3', '0'),
('107998063737', '131407887378', '6', '05/09/2020', '12/09/2020', '8', '6', '7'),
('926722993945', '131407887378', '6', '04/12/2020', '12/12/2020', '7', '2', '6'),
('107998063737', '596818320348', '8', '05/09/2020', '25/09/2020', '7', '2', '3'),
('713964268158', '596818320348', '9', '10/07/2021', '20/07/2021', '5', '1', '4');

insert into lab_reports (date_time, patient_id, type, lab_number) values 
('04/12/2020 10:30:00', '926722993945', 'Blood Test', '20'),
('08/07/2021 12:10:00', '713964268158', 'Blood Test', '21'),
('08/07/2021 12:20:00', '713964268158', 'Urine Test', '51'),
('04/12/2020 10:00:00', '926722993945', 'Urine Test', '51'),
('04/01/2021 12:03:00', '923692306899', 'Blood Test', '20'),
('03/03/2020 14:08:00', '707819011547', 'MRI', '2'),
('05/09/2020 15:10:00', '107998063737', 'X-ray', '25'),
('01/06/2021 11:12:00', '578283562069', 'Blood Test', '12'),
('09/11/2021 10:10:00', '547192762998', 'X-ray', '14'),
('09/09/2021 13:20:00', '618290147720', 'CT Scan', '16'),
('08/11/2020 14:09:00', '983473196869', 'MRI', '1'),
('08/11/2020 09:07:00', '983473196869', 'Blood Test', '5');

insert into bill (date_time, patient_id, operation_charges, medicine_charges, blood_t_charges, lab_charges, service_charges, status) values 
('9/1/2021 10:30:00', '926722993945', '0', '9000', '4069', '2400', '6300', true),
('15/08/2021 09:00:00', '713964268158', '125000', '10000', '2500', '8700', '70036', true),
('4/1/2021 12:00:00', '923692306899', '0', '5000', '4445', '2500', '0', true),
('03/03/2020 13:30:00', '707819011547', '0', '6000', '6859', '0', '0', true),
('05/09/2020 15:30:00', '107998063737', '0', '8000', '3352', '0', '0', true),
('9/11/2021 14:30:00', '547192762998', '0', '0', '9065', '98528', '0', true),
('17/10/2021 11:15:00', '760724389956', '0', '2340', '9784', '800', '9000', false),
('29/06/2021 18:30:00', '578283562069', '0', '2540', '6648', '0', '9700', true),
('20/10/2021 20:30:00', '618290147720', '0', '8504', '1839', '0', '3000', false),
('23/10/2021 19:10:00', '618290147720', '0', '0', '1000', '0', '5500', false),
('10/10/2021 19:10:00', '618290147720', '0', '5000', '2500', '0', '7000', false),
('5/10/2021 19:10:00', '618290147720', '0', '600', '500', '0', '7000', true),
('9/9/2020 8:30:00', '983473196869', '0', '4860', '0187', '0', '0', true);

insert into operation (begin_date_time, patient_id, duration, type, doctor_id) values 
('7/4/2021 09:00:00', '713964268158', '5:24:00', 'Cancer', '657596761672'),
('7/4/2021 09:00:00', '713964268158', '5:24:00', 'Cancer', '131407887378'),
('7/4/2021 09:00:00', '713964268158', '5:24:00', 'Cancer', '220195004338'),
('04/12/2020 12:00:00', '107998063737', '5:40:00', 'Lungs', '131407887378'),
('04/12/2020 12:00:00', '107998063737', '4:20:00', 'Lungs', '540258634201'),
('04/12/2020 12:00:00', '107998063737', '6:00:00', 'Lungs', '220195004338'),
('8/4/2021 09:00:00', '713964268158', '5:24:00', 'Kidney stones', '220195004338'),

('23/12/2020 08:00:00', '760724389956', '2:40:00', 'Cancer', '240151582862'),
('15/12/2020 07:00:00', '547192762998', '4:40:00', 'Lungs', '115096605071'),
('24/12/2020 06:00:00', '983473196869', '5:40:00', 'Cancer', '986786537816'),
('9/12/2020 05:00:00', '983473196869', '3:40:00', 'Lungs', '115096605071'),

('05/12/2020 06:00:00', '713964268158', '4:40:00', 'Kidney stones', '240151582862'),
('05/12/2020 06:00:00', '713964268158', '4:40:00', 'Kidney stones', '220195004338'),
('05/12/2020 06:00:00', '713964268158', '4:40:00', 'Kidney stones', '986786537816');


