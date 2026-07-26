create database SmartClinicDB;
use SmartClinicDB;

create table Patient (
PatientID int primary key,
Fname varchar (15) not null,
Lname varchar (15)not null,
Age int not null,
Phone varchar (11)unique,
Gender varchar (8)
);

create table Clinic (
ClinicID int primary key ,
ClinicName varchar (100) not null,
Address varchar (100) 
);

create table Doctor (
DoctorID int primary key,
Fname varchar (15) not null,
Lname varchar (15)not null,
Phone varchar (11) unique,
Gender varchar (8),
Specialty varchar (100) not null,
ClinicID int,
foreign key (ClinicID)
references Clinic (ClinicID)
);

create table General_Doctor (
DoctorID int primary key,
Department varchar (100) not null,
foreign key (DoctorID)
references Doctor (DoctorID)
);

create table Specialist_Doctor (
DoctorID int primary key,
SubSpecialty varchar (100) not null,
foreign key (DoctorID)
references Doctor(DoctorID)
);

create table Appointment (
AppointmentID int primary key,
AppointmentDate date not null,
PatientID int ,
foreign key (PatientID)
references  Patient(PatientID),
DoctorID int ,
foreign key (DoctorID)
references Doctor(DoctorID)
);

create table Treatment (
TreatmentID int primary key,
Cost int not null ,
Name varchar(100) not null,
AppointmentID int,
foreign key (AppointmentID)
references Appointment (AppointmentID)
);

create table Medicine (
MedicineID  int primary key,
Name varchar (100) not null,
Status varchar (120) not null,
Price int not null
);

create table Treatment_Medicine(
MedicineID int,
TreatmentID int ,
primary key (TreatmentID,MedicineID),
foreign key (TreatmentID)
references Treatment (TreatmentID),
foreign key (MedicineID)
references Medicine(MedicineID)
);

create table Payment (
PaymentID int primary key, 
Amount int not null,
Method varchar (50) not null,
AppointmentID int,
foreign key (AppointmentID)
references Appointment (AppointmentID)
);

create table Room (
RoomNumber int primary key,
RoomType varchar (150) not null,
ClinicID int,
foreign key (ClinicID)
references Clinic(ClinicID)
);

insert into Patient 
values
(001, 'Anhar','Alasfour',25,'05550011023','Female'),
(002, 'Salem','Mohammed',30,'05599911023','Male'),
(003, 'Ghada','Nasser',16,'0568378975','Female'),
(004, 'Nourah','Nasser',10,'0538398975','Female'),
(005, 'Saad','Khalid',13,'0586543247','Male');
select * from Patient;

insert into Clinic 
values
(0111,'DentalClinic','Jeddah'),
(0222,'DermatoligyClinic','Jeddah'),
(0443,'GenralConsultingClinic','Jeddah'),
(0115,'DentalClinic','Abha'),
(0224,'DermatoligyClinic','Abha'),
(0336,'GenralConsultingClinic','Riyadh');
select * from Clinic;

insert into Doctor
values
(01211,'Khaled','Alanizi','0559939339','male','PediatricDentistry',0111),
(02211,'Raghad','Alzhrani','0547788824','female','PediatricDentistry',0111),
(02311,'Rajaa','Mohammed','0563336873','female','Dermatoligy',0222),
(02411,'Yosef','Salah','0523445677','male','Dermatoligy',0222),
(02611,'Nader','Emad','0556845677','male','GeneralMedicineConsultant',0336),
(02711,'Afnan','Rasheed','0587646780','female','GeneralMedicineConsultant',0443);
select * from Doctor;

insert into General_Doctor
values
(02611,'General Medicine'),
(02711,'General Medicine');
select * from General_Doctor;

insert into Specialist_Doctor
values
(01211,'Pediatric Dentistry'),
(02211,'Pediatric Dentistry'),
(02311,'Dermatology'),
(02411,'Dermatology');

select * from Specialist_Doctor;

insert into Appointment
values
(1, '2026-07-26', 5, 02711),
(2, '2026-07-26', 2, 02311),
(3, '2026-07-27', 3, 02611),
(4, '2026-07-28', 1, 02211),
(5, '2026-07-29', 4, 01211);
select * from  Appointment;

insert into Treatment
values
(1, 500, 'Root Canal', 1),
(2, 120, 'Teeth Cleaning', 2),
(3, 80, 'X-Ray', 3),
(4, 700, 'Crown Placement', 4),
(5, 200, 'Tooth Extraction', 5);

select * from Treatment;

insert into Medicine
values
(1, 'Paracetamol', 'Available', 5),
(2, 'Amoxicillin', 'Available', 12),
(3, 'Ibuprofen', 'Available', 8),
(4, 'Metronidazole', 'Available', 10),
(5, 'Cetirizine', 'Available', 6);
select * from Medicine;

insert into Treatment_Medicine
values
(1, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5);
select * from Treatment_Medicine;

insert into Payment
values 
(1, 500, 'Cash', 1),
(2, 120, 'Credit Card', 2),
(3, 80, 'Debit Card', 3),
(4, 700, 'Insurance', 4),
(5, 200, 'Cash', 5);
select * from Payment;

insert into Room
values 
(1, 'Pediatric Dentistry Room', 0111),
(2, 'Dermatology Treatment Room', 0222),
(3, 'General Medicine Consulting Room', 0336),
(4, 'Dental Surgery Room', 0115),
(5, 'Dermatology Laser Room', 0224);
select * from Room;