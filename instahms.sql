
DROP SCHEMA IF EXISTS instahms;
CREATE SCHEMA IF NOT EXISTS instahms;
USE instahms;

######################################################## TABLE CREATION ##################################################################
--
-- Table structure for table `Appointment_T`
--

DROP TABLE IF EXISTS Appointment_T;

CREATE TABLE Appointment_T (
  AppointmentID int NOT NULL,
  PatientID int DEFAULT NULL,
  DoctorID int DEFAULT NULL,
  AppointmentDate date DEFAULT NULL,
  AppointmentTime time DEFAULT NULL,
  ReasonForVisit varchar(255) DEFAULT NULL,
  AppointmentStatus varchar(20) DEFAULT NULL,
  PRIMARY KEY (AppointmentID)
) ;


--
-- Table structure for table `Billing_T`
--

DROP TABLE IF EXISTS Billing_T;
CREATE TABLE Billing_T (
  BillingID int NOT NULL AUTO_INCREMENT,
  PatientID int DEFAULT NULL,
  RecordID int DEFAULT NULL,
  TotalCost int DEFAULT NULL,
  BillingDate date DEFAULT NULL,
  PaymentInformation varchar(24) DEFAULT NULL,
  PRIMARY KEY (BillingID)
) ;


--
-- Table structure for table `Department_REF_T`
--

DROP TABLE IF EXISTS Department_REF_T;

CREATE TABLE Department_REF_T (
  DepartmentID int NOT NULL AUTO_INCREMENT,
  DepartmentName varchar(50) DEFAULT NULL,
  DepartmentDescription varchar(150) DEFAULT NULL,
  PRIMARY KEY (DepartmentID)
) ;


--
-- Table structure for table `Doctor_T`
--

DROP TABLE IF EXISTS Doctor_T;

CREATE TABLE Doctor_T (
  DoctorID int NOT NULL AUTO_INCREMENT,
  UserID int DEFAULT NULL,
  Specialization varchar(54) DEFAULT NULL,
  LicenseInformation varchar(24) DEFAULT NULL,
  AppointmentSchedule varchar(54) DEFAULT NULL,
  PRIMARY KEY (DoctorID)
) ;

--
-- Table structure for table `Employee_T`
--

DROP TABLE IF EXISTS Employee_T;

CREATE TABLE Employee_T (
  EmployeeID int NOT NULL AUTO_INCREMENT,
  UserID int DEFAULT NULL,
  DepartmentID int DEFAULT NULL,
  EmployeePosition varchar(40) DEFAULT NULL,
  Salary int DEFAULT NULL,
  HireDate date DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
) ;


--
-- Table structure for table `Imaging_T`
--

DROP TABLE IF EXISTS Imaging_T;

CREATE TABLE Imaging_T (
  ImagingID int NOT NULL AUTO_INCREMENT,
  PatientID int DEFAULT NULL,
  DoctorID int DEFAULT NULL,
  ImagingType varchar(54) DEFAULT NULL,
  ImagingDate date DEFAULT NULL,
  ImagingResults varchar(512) DEFAULT NULL,
  ImagingCenter varchar(100) DEFAULT NULL,
  PRIMARY KEY (ImagingID)
) ;



--
-- Table structure for table `Insurance_T`
--

DROP TABLE IF EXISTS Insurance_T;

CREATE TABLE Insurance_T (
  InsuranceID int NOT NULL AUTO_INCREMENT,
  PatientID int DEFAULT NULL,
  PolicyNumber varchar(16) DEFAULT NULL,
  ProviderName varchar(50) DEFAULT NULL,
  PolicyStartDate date DEFAULT NULL,
  PolicyEndDate date DEFAULT NULL,
  PRIMARY KEY (InsuranceID)
) ;


--
-- Table structure for table `Inventory_T`
--

DROP TABLE IF EXISTS Inventory_T;

CREATE TABLE Inventory_T (
  InventoryID int NOT NULL AUTO_INCREMENT,
  ItemName varchar(100) NOT NULL,
  ItemDescription varchar(512) DEFAULT NULL,
  Quantity int NOT NULL,
  Cost decimal(7,2) NOT NULL,
  SupplierInformation varchar(512) DEFAULT NULL,
  PRIMARY KEY (InventoryID)
) ;


--
-- Table structure for table `LabResult_T`
--

DROP TABLE IF EXISTS LabResult_T;

CREATE TABLE LabResult_T (
  ResultID int NOT NULL AUTO_INCREMENT,
  TestID int NOT NULL,
  ResultDate date DEFAULT NULL,
  ResultValue varchar(56) DEFAULT NULL,
  PRIMARY KEY (ResultID)
) ;


--
-- Table structure for table `LabTest_T`
--

DROP TABLE IF EXISTS LabTest_T;

CREATE TABLE LabTest_T (
  TestID int NOT NULL AUTO_INCREMENT,
  PatientID int DEFAULT NULL,
  DoctorID int DEFAULT NULL,
  TestName varchar(56) DEFAULT NULL,
  TestDate date DEFAULT NULL,
  TestResults varchar(512) DEFAULT NULL,
  LabName varchar(104) DEFAULT NULL,
  PRIMARY KEY (TestID)
) ;


--
-- Table structure for table `MedicalRecord_T`
--

DROP TABLE IF EXISTS MedicalRecord_T;

CREATE TABLE MedicalRecord_T (
  RecordID int NOT NULL AUTO_INCREMENT,
  PatientID int NOT NULL,
  DoctorID int NOT NULL,
  RecordDate date NOT NULL,
  Diagnosis varchar(512) NOT NULL,
  TreatmentPlan varchar(512) NOT NULL,
  MedicationInformation varchar(512) NOT NULL,
  PRIMARY KEY (RecordID)
) ;




--
-- Table structure for table `Nurse_T`
--

DROP TABLE IF EXISTS Nurse_T;

CREATE TABLE Nurse_T (
  NurseID int NOT NULL,
  UserID int NOT NULL,
  DepartmentID int DEFAULT NULL,
  ShiftDescription varchar(50) DEFAULT NULL,
  MondayShift varchar(20) DEFAULT NULL,
  TuesdayShift varchar(20) DEFAULT NULL,
  WednesdayShift varchar(20) DEFAULT NULL,
  ThursdayShift varchar(20) DEFAULT NULL,
  FridayShift varchar(20) DEFAULT NULL,
  SaturdayShift varchar(20) DEFAULT NULL,
  SundayShift varchar(20) DEFAULT NULL,
  PRIMARY KEY (NurseID)
) ;


--
-- Table structure for table `Patient_T`
--

DROP TABLE IF EXISTS Patient_T;

CREATE TABLE Patient_T (
  PatientID int NOT NULL AUTO_INCREMENT,
  UserID int NOT NULL,
  DateofBirth date DEFAULT NULL,
  Gender varchar(12) DEFAULT NULL,
  Address varchar(100) DEFAULT NULL,
  EmergencyContactInformation varchar(100) DEFAULT NULL,
  PRIMARY KEY (PatientID)
) ;


--
-- Table structure for table `Prescription_T`
--

DROP TABLE IF EXISTS Prescription_T;

CREATE TABLE Prescription_T (
  PrescriptionID int NOT NULL AUTO_INCREMENT,
  RecordID int NOT NULL,
  DoctorID int DEFAULT NULL,
  MedicationName varchar(100) DEFAULT NULL,
  DosageInstructions varchar(100) DEFAULT NULL,
  PharmacyInformation varchar(100) DEFAULT NULL,
  PRIMARY KEY (PrescriptionID)
) ;


--
-- Table structure for table `Request_Status_REF_T`
--

DROP TABLE IF EXISTS Request_Status_REF_T;

CREATE TABLE Request_Status_REF_T (
  RequestStatusID int NOT NULL,
  RequestStatusDescription varchar(512) DEFAULT NULL,
  PRIMARY KEY (RequestStatusID)
) ;


--
-- Table structure for table `Room_T`
--

DROP TABLE IF EXISTS Room_T;

CREATE TABLE Room_T (
  RoomID INT NOT NULL AUTO_INCREMENT,
  RoomNumber INT DEFAULT NULL,
  RoomType VARCHAR(12) DEFAULT NULL,
  RoomDescription VARCHAR(60) DEFAULT NULL,
  OccupancyStatus VARCHAR(16) DEFAULT NULL,
  PatientID INT DEFAULT NULL,
  PRIMARY KEY (RoomID)
) ;



--
-- Table structure for table `Shift_Timings_T`
--

DROP TABLE IF EXISTS Shift_Timings_T;

CREATE TABLE Shift_Timings_T (
  ShiftID int NOT NULL AUTO_INCREMENT,
  EmployeeID int NOT NULL,
  StartTime time NOT NULL,
  EndTime time NOT NULL,
  DayOfTheWeek int NOT NULL,
  PRIMARY KEY (ShiftID)
) ;


--
-- Table structure for table `Supply_Request_T`
--

DROP TABLE IF EXISTS Supply_Request_T;

CREATE TABLE Supply_Request_T (
  RequestID int NOT NULL AUTO_INCREMENT,
  InventoryID int NOT NULL,
  EmployeeID int NOT NULL,
  QuantityRequested int NOT NULL,
  DateRequested date NOT NULL,
  RequestStatusID int NOT NULL,
  PRIMARY KEY (RequestID)
) ;


--
-- Table structure for table `Surgery_T`
--

DROP TABLE IF EXISTS Surgery_T;

CREATE TABLE Surgery_T (
  SurgeryID int NOT NULL AUTO_INCREMENT,
  PatientID int NOT NULL,
  DoctorID int DEFAULT NULL,
  SurgeryType varchar(50) DEFAULT NULL,
  SurgeryDate date DEFAULT NULL,
  AnesthesiaInformation varchar(20) DEFAULT NULL,
  PostOpCareInstructions varchar(100) DEFAULT NULL,
  PRIMARY KEY (SurgeryID)
);


--
-- Table structure for table `User_T`
--

DROP TABLE IF EXISTS User_T;

CREATE TABLE User_T (
  UserID int NOT NULL AUTO_INCREMENT,
  Username varchar(24) DEFAULT NULL,
  UserPassword varchar(120) DEFAULT NULL,
  FirstName varchar(54) DEFAULT NULL,
  LastName varchar(54) DEFAULT NULL,
  Email varchar(54) DEFAULT NULL,
  PhoneNumber varchar(16) DEFAULT NULL,
  UserRole varchar(24) DEFAULT NULL,
  PRIMARY KEY (UserID)
) ;

#ALTER TABLE user_t MODIFY COLUMN userPassword VARCHAR(100);



####################################################### ADDING FOREIGN KEYS ########################################################################


	#================================================  Employee_T  =========================================================
	
	ALTER TABLE Employee_T ADD CONSTRAINT UserID_User_FK FOREIGN KEY(UserID) REFERENCES User_T(UserID);
	ALTER TABLE Employee_T ADD CONSTRAINT DepartmentID_User_FK FOREIGN KEY(DepartmentID) REFERENCES Department_REF_T(DepartmentID);


	#==========================================   Department_REF_T   =========================================================

	#================================================  Surgery  =========================================================
		
		ALTER TABLE Surgery_T 
		ADD CONSTRAINT DoctorID_Surgery_FK FOREIGN KEY(DoctorID) REFERENCES Doctor_T(DoctorID);
		ALTER TABLE Surgery_T 
		ADD CONSTRAINT PatientID_Surgery_FK FOREIGN KEY(PatientID) REFERENCES Patient_T(PatientID);
		
        
	#=================================================   Room   ============================================================#------------------------------------------------------Room_T----------------------------------------------------------------------------
		
        ALTER TABLE Room_T
		ADD CONSTRAINT PatientID_Room_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);


	#=============================================  Inventory_T   ============================================================
	# ==================================================Shift timing =========================================================

		ALTER TABLE Shift_Timings_T
		ADD CONSTRAINT EmployeeID_Shift_Timings_FK FOREIGN KEY (EmployeeID) REFERENCES Employee_T(EmployeeID);

	#=====================================================Supply Request=========================================================

		ALTER TABLE Supply_Request_T
		ADD CONSTRAINT InventoryID_Supply_Request_FK FOREIGN KEY (InventoryID) REFERENCES Inventory_T(InventoryID);
		ALTER TABLE Supply_Request_T
		ADD CONSTRAINT EmployeeID_Supply_Request_FK FOREIGN KEY (EmployeeID) REFERENCES Employee_T(EmployeeID);
		ALTER TABLE Supply_Request_T
		ADD CONSTRAINT RequestStatusID_Supply_Request_FK FOREIGN KEY (RequestStatusID) REFERENCES Request_Status_REF_T(RequestStatusID);

	#==================================================Request Status=========================================================

	#================================================== Billing_T =============================================================

		ALTER TABLE Billing_T
		ADD CONSTRAINT Patient_Billing_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);
		#Run only after adding data to MedicalRecord_T
		ALTER TABLE Billing_T
		ADD CONSTRAINT Record_Billing_FK FOREIGN KEY (RecordID) REFERENCES MedicalRecord_T(RecordID);
		
	#==================================================  Insurance  ===========================================================
		
		ALTER TABLE Insurance_T
		ADD CONSTRAINT PatientID_Insurance_T FOREIGN KEY(PatientID) REFERENCES Patient_T (PatientID);

	#================================================  Prescription_T  =======================================================
		
		ALTER TABLE Prescription_T
		ADD CONSTRAINT Doctor_Prescription_FK FOREIGN KEY (DoctorID) REFERENCES Doctor_T(DoctorID);
		#Run only after adding data to MedicalRecord_T
		ALTER TABLE Prescription_T
		ADD CONSTRAINT Record_Prescription_FK FOREIGN KEY (RecordID) REFERENCES MedicalRecord_T(RecordID);

	#========================================================  User  =============================================================

	#=====================================================  Patient_T  ==========================================================

		ALTER TABLE Patient_T
		ADD CONSTRAINT UserID_Patient_FK FOREIGN KEY (UserID) REFERENCES User_T(UserID);
		
	#------------------------------------------------------Doctor_T------------------------------------------------------------

		ALTER TABLE Doctor_T 
		ADD CONSTRAINT UserID_Doctor_FK FOREIGN KEY (UserID) REFERENCES User_T(UserID);
		
	#======================================================= LabTest_T ==========================================================
		
		ALTER TABLE LabTest_T 
		ADD CONSTRAINT PatientID_LabTest_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);
		ALTER TABLE LabTest_T
		ADD CONSTRAINT DoctorID_LabTest_FK FOREIGN KEY(DoctorID) REFERENCES Doctor_T(DoctorID);

	#====================================================== lab_results_t ======================================================

		ALTER TABLE LabResult_T
		ADD CONSTRAINT TestID_LabResult_FK FOREIGN KEY (TestID) REFERENCES LabTest_T (TestID);

	#======================================================= Imaging_T  =======================================================
		
		ALTER TABLE Imaging_T
		ADD CONSTRAINT PatientID_Imaging_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);
		ALTER TABLE Imaging_T
		ADD CONSTRAINT DoctorID_Imaging_FK FOREIGN KEY(DoctorID) REFERENCES Doctor_T(DoctorID);

	#======================================================= Nurse_T  =======================================================

		ALTER TABLE Nurse_T
		ADD CONSTRAINT UserID_Nurse_FK FOREIGN KEY (UserID) REFERENCES User_T(UserID);
		ALTER TABLE Nurse_T
		ADD CONSTRAINT DepartmentID_Nurse_FK FOREIGN KEY (DepartmentID) REFERENCES Department_REF_T(DepartmentID);

	#======================================================= Appointment_T =======================================================

		ALTER TABLE Appointment_T
		ADD CONSTRAINT PatientID_Appointment_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);
		ALTER TABLE Appointment_T
		ADD CONSTRAINT DoctorID_Appointment_FK FOREIGN KEY (DoctorID) REFERENCES Doctor_T(DoctorID);


	#======================================================= MedicalRecord_T  =======================================================

		ALTER TABLE MedicalRecord_T
		ADD CONSTRAINT PatientID_MedicalRecord_FK FOREIGN KEY (PatientID) REFERENCES Patient_T(PatientID);
		ALTER TABLE MedicalRecord_T
		ADD CONSTRAINT DoctorID_MedicalRecord_FK FOREIGN KEY (DoctorID) REFERENCES Doctor_T(DoctorID);
		


####################################################### Inserting the data ########################################################################

	
    #Tables which has no foreign keys
		--
		-- Dumping data for table `Department_REF_T`
		--

		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (1,'Cardiology','Department of heart diseases and cardiovascular care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (2,'Neurology','Department of neurological disorders and diseases');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (3,'Oncology','Department of cancer treatment and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (4,'Orthopedics','Department of musculoskeletal injuries and diseases');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (5,'Pediatrics','Department of healthcare for children');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (6,'Dermatology','Department of skin disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (7,'Ophthalmology','Department of eye and vision care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (8,'Gastroenterology','Department of digestive disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (9,'Obstetrics and Gynecology','Department of women\'s reproductive health');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (10,'Psychiatry','Department of mental health and disorders');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (11,'Radiology','Department of imaging and diagnostic procedures');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (12,'Anesthesiology','Department of anesthesia and pain management');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (13,'Emergency Medicine','Department of emergency medical care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (14,'Endocrinology','Department of endocrine disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (15,'Hematology','Department of blood disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (16,'Infectious Diseases','Department of infectious diseases and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (17,'Nephrology','Department of kidney diseases and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (18,'Pulmonology','Department of lung diseases and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (19,'Rheumatology','Department of joint disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (20,'Urology','Department of urinary tract and reproductive care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (21,'Pathology','Department of laboratory testing and diagnostics');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (22,'Nutrition','Department of nutrition and dietetics');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (23,'Rehabilitation','Department of physical and occupational therapy');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (24,'Oncologic Surgery','Department of cancer-related surgeries');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (25,'Plastic Surgery','Department of reconstructive and cosmetic surgeries');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (26,'Transplant Surgery','Department of organ transplant surgeries');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (27,'Neurosurgery','Department of surgical treatment for neurological disorders');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (28,'Trauma Surgery','Department of emergency surgical procedures');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (29,'Cardiothoracic Surgery','Department of heart and lung surgeries');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (30,'Vascular Surgery','Department of vascular surgeries and procedures');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (31,'Pain Management','Department of pain management and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (32,'Sleep Medicine','Department of sleep disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (33,'Allergy and Immunology','Department of allergy and immune system disorders and care');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (34,'Cardiac Rehabilitation','Department of cardiac rehabilitation programs');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (35,'Diagnostic Radiology','Department of diagnostic imaging procedures');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (36,'Interventional Radiology','Department of minimally invasive diagnostic and therapeutic procedures');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (37,'Nuclear Medicine','Department of diagnostic and therapeutic uses of radioactive substances');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (38,'Pediatrics Hematology/Oncology','Department of cancer and blood disorder treatment for children');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (39,'Pediatric Cardiology','Department of heart and cardiovascular care for children');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (40,'Pediatric Endocrinology','Department of endocrine disorders and care for children');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (41,'Pediatric Gastroenterology','Department of digestive disorders and care for children');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (42,'Pediatric Nephrology','Department of kidney diseases');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (43,'Internal Medicine','Department of internal medicine');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (44,'Otolaryngology','Department of ear, nose, and throat disorders');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (45,'Infectious Disease Control','Department focused on preventing and controlling the spread of infectious diseases');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (46,'Hematopathology','Department specializing in the diagnosis and treatment of blood diseases and disorders');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (47,'Geriatrics','Department focused on the care of elderly patients and management of age-related diseases');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (48,'Cancer Pain Management Clinic','Department specializing in managing pain related to cancer treatments and cancer-related conditions.');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (49,'Sports Medicine','Department focused on the treatment and prevention of sports-related injuries');
		INSERT INTO Department_REF_T (DepartmentID, DepartmentName, DepartmentDescription) VALUES (50,'Palliative Care','Department focused on providing comfort and relief for patients with serious illnesses and end-of-life care.');

		
		--
		-- Dumping data for table `Request_Status_REF_T`
		--

		INSERT INTO Request_Status_REF_T (RequestStatusID, RequestStatusDescription) VALUES (1,'Approved');
		INSERT INTO Request_Status_REF_T (RequestStatusID, RequestStatusDescription) VALUES (2,'Pending');
		INSERT INTO Request_Status_REF_T (RequestStatusID, RequestStatusDescription) VALUES (3,'Denied');

		--
		-- Dumping data for table `Inventory_T`
		--

		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (1,'Syringes','5ml, sterile, disposable',500,0.25,'ABC Medical Supplies, 123 Main St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (2,'Surgical Masks','3-ply, disposable, earloop',1000,0.10,'XYZ Medical Supply Co., 456 Oak St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (3,'Exam Gloves','Latex-free, medium, powder-free',1000,0.20,'DEF Medical Supply Inc., 789 Maple St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (4,'Isopropyl Alcohol','70%, 1 gallon bottle',10,20.00,'GHI Medical Supply Corp., 321 Elm St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (5,'Digital Thermometer','Oral, waterproof, battery-powered',50,15.00,'JKL Medical Equipment Co., 789 Birch St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (6,'Blood Pressure Cuff','Adult, manual, latex-free',20,40.00,'MNO Medical Supplies LLC, 234 Pine St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (7,'Gauze Pads','4\" x 4\", sterile, non-woven',500,0.15,'PQR Medical Supply Co., 567 Cedar St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (8,'IV Catheters','20 gauge, 1.5 inch, with wings',200,2.50,'STU Medical Supplies Inc., 890 Maple St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (9,'Electrode Pads','Adult, 2\" x 2\", disposable',100,5.00,'VWX Medical Equipment Co., 123 Birch St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (10,'Oxygen Tanks','Portable, aluminum, with regulator',10,200.00,'YZA Medical Supply Corp., 456 Oak St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (11,'Wheelchair','Foldable, lightweight, with footrests',5,300.00,'ABC Medical Equipment Co., 789 Pine St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (12,'IV Poles','Adjustable, with hooks and wheels',2,100.00,'XYZ Medical Supply Inc., 234 Elm St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (13,'Splint','18\" x 3\", malleable, reusable',10,15.00,'DEF Medical Supplies LLC, 567 Birch St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (14,'Suture Kit','Disposable, sterile, with needle',50,10.00,'GHI Medical Supply Co., 123 Pine St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (15,'Bedside Table','Adjustable, with wheels and drawers',2,150.00,'JKL Medical Supplies Inc., 456 Cedar St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (16,'Nebulizer','Portable, battery-powered, with mask',3,50.00,'MNO Medical Supply Corp., 789 Oak St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (17,'Pillows','Standard size, hypoallergenic',100,5.00,'PQR Medical Equipment Co., 234 Maple St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (18,'Blankets','Twin size, cotton, washable',50,20.00,'STU Medical Supplies LLC, 567 Pine St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (19,'Mattress','Hospital-grade, foam, waterproof',5,500.00,'VWX Medical Supply Co., 890 Cedar St, Anytown USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (20,'Wound Dressing','4\" x 4\",',100,2.50,'SafeCare Medical Products, 520 Main St, Richardson, Texas, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (21,'Disposable gown','A disposable gown made of non-woven material',200,4.50,'Supplier: ABC Medical Supplies, Contact: John Smith, Email: john.smith@abcmed.com, Phone: 555-123-4567');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (22,'N95 Mask','A filtering facepiece respirator mask',500,2.00,'Supplier: XYZ Medical Supplies, Contact: Sarah Lee, Email: sarah.lee@xyzmed.com, Phone: 555-987-6543');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (23,'Blood pressure monitor','A machine used to measure blood pressure',50,100.00,'Supplier: JKL Medical Supplies, Contact: Susan Kim, Email: susan.kim@jklmed.com, Phone: 555-234-5678');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (24,'Scalpels','Disposable surgical scalpels for incisions',100,15.00,'Supplier: ABC Medical Supplies, Contact: John Smith, Email: john.smith@abcmed.com, Phone: 555-123-4567');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (25,'Disposable Bed Pans','Disposable bed pans for patient use',150,3.00,'Supplier: GHI Medical Supplies, Contact: Tom Johnson, Email: tom.johnson@ghimed.com, Phone: 555-234-5678');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (26,'Incontinence pads','Disposable pads for patients with urinary incontinence',200,5.00,'SafeCare Medical Products, 520 Main St, Richardson, Texas, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (27,'Surgical Gloves','Powder-free latex gloves for surgical use',1000,12.00,'Supplier: DEF Medical Supplies, Contact: Jane Doe, Email: jane.doe@defmed.com, Phone: 555-345-6789');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (28,'Bandages','Adhesive bandages for wound care',1000,0.10,'XYZ Medical Products, 456 Elm Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (29,'Antibacterial Soap','Antibacterial soap for hand hygiene',1000,1.00,'ABC Medical Supplies, 123 Main Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (30,'Sanitizer Gel','Hand sanitizer gel for hand hygiene',1000,1.50,'LMN Medical Solutions, 789 Oak Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (31,'Digital Scale','Electronic digital scale for measuring weight',20,50.00,'PQR Medical Equipment, 101 Maple Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (32,'Stethoscope','Acoustic stethoscope for listening to heart and lung sounds',50,75.00,'RST Medical Devices, 222 Pine Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (33,'Blood Glucose Monitor','Electronic blood glucose monitor for measuring blood glucose levels',100,50.00,'UVW Medical Technologies, 333 Cedar Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (34,'Oxygen Concentrator','Electronic oxygen concentrator for respiratory support',5,500.00,'ABC Medical Supplies, 123 Main Street, Anytown, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (35,'Inhaler','',200,10.00,'SafeCare Medical Products, 520 Main St, Richardson, Texas, USA');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (36,'Surgical Sponges','Sterile, absorbent sponges for surgical procedures',1000,30.00,'STU Medical Supplies, Inc.');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (37,'Hospital Beds','Adjustable hospital beds for patient care',10,2000.00,'VWX Medical Equipment, Inc.');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (38,'Ventilators','Mechanical ventilators for respiratory support',2,20000.00,'EFG Medical Devices, LLC');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (39,'Ultrasound Machines','Portable ultrasound machines for diagnostic imaging',1,50000.00,'HIJ Medical Equipment, Inc.');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (40,'X-ray Machines','Fixed X-ray machines for diagnostic imaging',1,10000.00,'KLM Medical Devices, LLC');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (41,'MRI Machines','Large MRI machines for diagnostic imaging',1,15000.00,'NOP Medical Equipment, Inc.');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (42,'EKG Machines','Electrocardiogram machines for measuring heart activity',2,10000.00,'WXY Medical Devices, LLC');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (43,'Defibrillators','Automated external defibr',5,10000.00,'Medline Industries, 222 Rosewood Ave, Anyplace USA, Phone: 555-777-2222');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (44,'Pulse Oximeters','Non-invasive devices for measuring blood oxygen levels',10,100.00,'TUV Medical Equipment, Inc.');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (45,'CT scanner','Medical',2,10000.00,'Medline Industries, 222 Rosewood Ave, Anyplace USA, Phone: 555-777-2222');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (46,'Aspirin','Pain relief medication',1000,10.00,'Pfizer, 123 Main St, New York, NY 10001, 800-123-4567');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (47,'Urine bags','Collection bags for urine samples',100,25.00,'Hollister Incorporated, 2000 Hollister Dr, Libertyville, IL 60048, 888-740-8999');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (48,'EKG Electrodes','Disposable EKG Electrodes, Adult, 10-pack',100,50.00,'Medline Industries, 222 Rosewood Ave, Anyplace USA, Phone: 555-777-2222');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (49,'Isopropyl Alcohol','70% Isopropyl Alcohol, 16 oz Bottle',50,8.00,'Best Medical Distributors, 321 Pine St, Nowhere USA, Phone: 555-111-2222');
		INSERT INTO Inventory_T (InventoryID, ItemName, ItemDescription, Quantity, Cost, SupplierInformation) VALUES (50,'Alcohol Swabs','Sterile Alcohol Prep Pads, Medium, 2-ply',1000,20.00,'Acme Medical Supplies, 789 Elm St, Somewhere USA, Phone: 555-555-5555');


		--
		-- Dumping data for table `User_T`
		--

		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (1,'jdoe','jdoe123','John','Doe','johndoe@email.com','+1 123-456-7890','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (2,'lsmith','p@ssword','Lisa','Smith','lsmith@gmail.com','+1 234-567-8901','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (3,'mmiller','secret','Michael','Miller','michaelmiller@yahoo.com','+1 345-678-9012','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (4,'jparker','pa$$w0rd','Jane','Parker','janeparker@hotmail.com','+1 456-789-0123','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (5,'rjones','password','Robert','Jones','robertjones@outlook.com','+1 567-890-1234','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (6,'mgonzal','abc123','Maria','Gonzalez','mariagonzalez@gmail.com','+1 678-901-2345','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (7,'dlee','lee123','David','Lee','davidlee@hotmail.com','+1 789-012-3456','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (8,'jcole','cole123','Jessica','Cole','jessicacole@outlook.com','+1 890-123-4567','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (9,'kchen','kchen123','Kevin','Chen','kevinchen@gmail.com','+1 901-234-5678','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (10,'tnguyen','passw0rd','Thanh','Nguyen','thanhnguyen@yahoo.com','+1 012-345-6789','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (11,'msanchez','qwerty','Maria','Sanchez','mariasanchez@hotmail.com','+1 123-456-7890','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (12,'jchang','ch@ng3s3','James','Chang','jameschang@outlook.com','+1 234-567-8901','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (13,'jgarcia','jgarcia1','Jose','Garcia','josegarcia@gmail.com','+1 345-678-9012','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (14,'bmiller','m1ll3r','Brian','Miller','brianmiller@yahoo.com','+1 456-789-0123','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (15,'sbrown','br0wnie','Sarah','Brown','sarahbrown@hotmail.com','+1 567-890-1234','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (16,'ljohnson','p@ssword','Laura','Johnson','laurajohnson@outlook.com','+1 678-901-2345','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (17,'john123','password123','John','Smith','johnsmith@example.com','123-456-7890','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (18,'sara456','password456','Sara','Johnson','sarajohnson@example.com','234-567-8901','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (19,'mike789','password789','Mike','Brown','mikebrown@example.com','345-678-9012','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (20,'amy345','password345','Amy','Davis','amydavis@example.com','456-789-0123','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (21,'jason678','password678','Jason','Lee','jasonlee@example.com','567-890-1234','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (22,'jessica12','password12','Jessica','Hernandez','jessicah@example.com','678-901-2345','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (23,'david456','password456','David','Rodriguez','davidrodriguez@example.com','789-012-3456','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (24,'laura789','password789','Laura','Perez','lauraperez@example.com','890-123-4567','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (25,'brian234','password234','Brian','Garcia','briangarcia@example.com','901-234-5678','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (26,'emily567','password567','Emily','Martinez','emilymartinez@example.com','012-345-6789','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (27,'kevin123','password123','Kevin','Smith','kevinsmith@example.com','123-456-7890','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (28,'melissa56','password56','Melissa','Johnson','melissajohnson@example.com','234-567-8901','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (29,'sean789','password789','Sean','Brown','seanbrown@example.com','345-678-9012','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (30,'diana345','password345','Diana','Davis','dianadavis@example.com','456-789-0123','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (31,'jessie678','password678','Jessie','Lee','jessielee@example.com','567-890-1234','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (32,'juan12','password12','Juan','Hernandez','juanhernandez@example.com','678-901-2345','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (33,'sam456','password456','Sam','Rodriguez','samrodriguez@example.com','789-012-3456','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (34,'lisa789','password789','Lisa','Perez','lisaperez@example.com','890-123-4567','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (35,'jdoe','password','John','Doe','jdoe@example.com','555-1234','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (36,'ssmith','secret','Sarah','Smith','ssmith@example.com','555-5678','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (37,'ajones','123456','Alice','Jones','ajones@example.com','555-8765','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (38,'bsmith','letmein','Bob','Smith','bsmith@example.com','555-4321','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (39,'jsmith','qwerty','Jane','Smith','jsmith@example.com','555-9876','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (40,'jdoe2','pass123','Jim','Doe','jdoe2@example.com','555-3456','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (41,'msmith','abc123','Mary','Smith','msmith@example.com','555-6789','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (42,'jbloggs','changeme','Joe','Bloggs','jbloggs@example.com','555-2345','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (43,'ksmith','p@ssword','Kate','Smith','ksmith@example.com','555-8901','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (44,'jdavis','987654','James','Davis','jdavis@example.com','555-4321','Admin');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (45,'tsmith','password1','Tom','Smith','tsmith@example.com','555-6789','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (46,'lsmith','letmein1','Lisa','Smith','lsmith@example.com','555-1234','Nurse');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (47,'jdawson','qwertyui','John','Dawson','jdawson@example.com','555-4321','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (48,'mgreen','asdfgh','Mike','Green','mgreen@example.com','555-5678','Doctor');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (49,'jsmith2','12345678','Jessica','Smith','jsmith2@example.com','555-9876','Patient');
		INSERT INTO User_T (UserID, Username, UserPassword, FirstName, LastName, Email, PhoneNumber, UserRole) VALUES (50,'klee','trustno1','Karen','Lee','klee@example.com','555-3456','Nurse');

		--
		-- Dumping data for table `Room_T`
		--

		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (1,101,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (2,102,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (3,103,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (4,104,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (5,105,'General','Two-bed Patient room with shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (6,106,'General','Two-bed Patient room with shared bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (7,107,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (8,108,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (9,109,'ER','Emergency room with attached resuscitation unit','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (10,110,'ER','Emergency room with attached resuscitation unit','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (11,111,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (12,112,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (13,113,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (14,114,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (15,115,'General','Two-bed Patient room with shared bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (16,116,'General','Two-bed Patient room with shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (17,117,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (18,118,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (19,119,'ER','Emergency room with attached resuscitation unit','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (20,120,'ER','Emergency room with attached resuscitation unit','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (21,121,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (22,122,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (23,123,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (24,124,'ICU','Intensive care unit with attached ventilator','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (25,125,'General','Two-bed Patient room with shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (26,126,'General','Two-bed Patient room with shared bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (27,127,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (28,128,'General','Single Patient room with attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (29,129,'ER','Emergency room with attached resuscitation unit','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (30,130,'ER','Emergency room with attached resuscitation','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (31,131,'General','A standard room with two beds and a shared bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (32,132,'Private','A single occupancy room with an attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (33,133,'ICU','A specialized room equipped with advanced medical equipment','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (34,134,'General','A standard room with two beds and a shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (35,135,'Private','A single occupancy room with an attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (36,136,'General','A standard room with two beds and a shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (37,137,'ICU','A specialized room equipped with advanced medical equipment','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (38,138,'Private','A single occupancy room with an attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (39,139,'General','A standard room with two beds and a shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (40,140,'Private','A single occupancy room with an attached bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (41,141,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (42,142,'ICU','Intensive care unit with attached ventilator','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (43,143,'General','Two-bed Patient room with shared bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (44,144,'General','Two-bed Patient room with shared bathroom','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (45,145,'General','Single Patient room with attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (46,146,'Private','A single occupancy room with an attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (47,147,'ER','Emergency room with attached resuscitation unit','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (48,148,'ER','Emergency room with attached resuscitation unit','Available');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (49,149,'Private','A single occupancy room with an attached bathroom','Occupied');
		INSERT INTO Room_T (RoomID, RoomNumber, RoomType, RoomDescription, OccupancyStatus) VALUES (50,150,'Private','A single occupancy room with an attached bathroom','Available');

#Tables with one or more foreign key
--
-- Dumping data for table `Employee_T`
--

INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (1,1,1,'Cardiologist',150000,'2020-01-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (2,2,1,'Cardiology Fellow',80000,'2021-03-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (3,3,2,'Neurologist',175000,'2019-07-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (4,4,2,'Neurology Resident',60000,'2022-01-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (5,5,3,'Oncologist',200000,'2018-05-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (6,6,3,'Oncology Nurse',55000,'2022-02-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (7,7,4,'Orthopedic Surgeon',225000,'2017-09-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (8,8,4,'Orthopedics Resident',65000,'2022-06-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (9,9,5,'Pediatrician',175000,'2019-01-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (10,10,5,'Pediatric Nurse',55000,'2022-05-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (11,11,6,'Dermatologist',180000,'2018-02-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (12,12,6,'Dermatology Fellow',75000,'2021-07-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (13,13,7,'Ophthalmologist',190000,'2019-08-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (14,14,7,'Ophthalmology Resident',65000,'2022-03-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (15,15,8,'Gastroenterologist',195000,'2017-10-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (16,16,8,'Gastroenterology Fellow',80000,'2021-01-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (17,17,9,'Obstetrician/Gynecologist',220000,'2018-03-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (18,18,9,'OBGYN Resident',60000,'2022-01-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (19,19,10,'Psychiatrist',200000,'2019-02-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (20,20,10,'Psychiatry Resident',55000,'2022-06-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (21,21,11,'Radiologist',210000,'2017-11-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (22,22,11,'Radiology Fellow',80000,'2021-04-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (23,23,12,'Anesthesiologist',220000,'2019-01-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (24,24,12,'Resident',70000,'2020-11-23');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (25,25,18,'Pulmonology Resident',60000,'2019-03-05');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (26,26,19,'Surgeon',300000,'2019-09-02');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (27,27,19,'Resident',50000,'2022-01-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (28,28,19,'Physician',220000,'2017-07-30');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (29,29,20,'Urologist',250000,'2018-03-12');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (30,30,20,'Nurse',75000,'2020-06-20');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (31,31,20,'Urologist',280000,'2019-11-05');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (32,32,21,'Pathologist',270000,'2018-08-15');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (33,33,21,'Lab Technician',55000,'2021-05-28');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (34,34,21,'Pathologist',300000,'2019-02-14');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (35,35,22,'Dietitian',70000,'2020-09-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (36,36,22,'Nutritionist',60000,'2021-11-11');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (37,37,22,'Dietitian',80000,'2017-10-27');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (38,38,23,'Physical Therapist',90000,'2021-03-17');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (39,39,23,'Occupational Therapist',85000,'2019-08-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (40,40,23,'Speech Therapist',80000,'2022-02-24');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (41,41,24,'Oncologic Surgeon',400000,'2018-09-10');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (42,42,24,'Resident',50000,'2021-07-13');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (43,43,24,'Surgical Nurse',75000,'2019-05-08');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (44,44,25,'Plastic Surgeon',350000,'2020-11-30');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (45,45,25,'Resident',50000,'2022-03-01');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (46,46,25,'Plastic Surgeon',375000,'2017-12-19');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (47,47,26,'Transplant Surgeon',450000,'2019-04-05');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (48,48,26,'Anesthesiologist',280000,'2021-07-23');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (49,49,26,'Transplant Surgeon',550000,'2019-04-07');
INSERT INTO Employee_T (EmployeeID, UserID, DepartmentID, EmployeePosition, Salary, HireDate) VALUES (50,50,26,'Anesthesiologist',360000,'2021-07-02');


--
-- Dumping data for table `Shift_Timings_T`
--

INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (1,1,'08:00:00','16:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (2,2,'10:00:00','19:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (3,3,'22:00:00','07:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (4,4,'20:00:00','04:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (5,5,'12:00:00','21:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (6,6,'06:00:00','15:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (7,7,'13:00:00','22:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (8,8,'09:00:00','18:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (9,9,'20:00:00','04:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (10,10,'13:00:00','22:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (11,11,'12:00:00','21:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (12,12,'22:00:00','07:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (13,13,'22:00:00','07:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (14,14,'09:00:00','18:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (15,15,'06:00:00','15:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (16,16,'12:00:00','21:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (17,17,'13:00:00','22:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (18,18,'20:00:00','04:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (19,19,'22:00:00','07:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (20,20,'10:00:00','19:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (21,21,'12:00:00','21:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (22,22,'13:00:00','22:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (23,23,'22:00:00','07:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (24,24,'09:00:00','18:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (25,25,'06:00:00','15:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (26,26,'20:00:00','04:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (27,27,'12:00:00','21:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (28,28,'13:00:00','22:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (29,29,'08:00:00','16:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (30,30,'06:00:00','15:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (31,31,'22:00:00','07:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (32,32,'20:00:00','04:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (33,33,'06:00:00','15:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (34,34,'09:00:00','18:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (35,35,'12:00:00','21:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (36,36,'06:00:00','15:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (37,37,'13:00:00','22:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (38,38,'12:00:00','21:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (39,39,'22:00:00','07:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (40,40,'22:00:00','07:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (41,41,'06:00:00','15:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (42,42,'09:00:00','18:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (43,43,'12:00:00','21:00:00',2);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (44,44,'13:00:00','22:00:00',3);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (45,45,'06:00:00','15:00:00',4);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (46,46,'22:00:00','07:00:00',5);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (47,47,'20:00:00','04:00:00',6);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (48,48,'09:00:00','18:00:00',7);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (49,49,'13:00:00','22:00:00',1);
INSERT INTO Shift_Timings_T (ShiftID, EmployeeID, StartTime, EndTime, DayOfTheWeek) VALUES (50,50,'22:00:00','07:00:00',2);



--
-- Dumping data for table `Nurse_T`
--

INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (1,2,30,'Surgery','7am-7pm','7am-7pm','7am-7pm','Off','Off','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (2,6,5,'Pediatrics','Off','Off','Off','7pm-7am','7pm-7am','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (3,9,13,'ICU','Off','Off','Off','Off','7am-7pm','7am-7pm','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (4,13,26,'Surgery','7pm-7am','7pm-7am','Off','Off','Off','Off','7pm-7am');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (5,16,40,'OB/GYN','7am-7pm','7am-7pm','7am-7pm','Off','Off','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (6,19,42,'ER','7am-7pm','7am-7pm','7am-7pm','Off','Off','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (7,23,5,'Pediatrics','Off','Off','Off','7pm-7am','7pm-7am','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (8,29,18,'ICU','Off','Off','Off','Off','7am-7pm','7am-7pm','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (9,33,29,'Surgery','7pm-7am','7pm-7am','Off','Off','Off','Off','7pm-7am');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (10,37,29,'Surgery','7am-7pm','7am-7pm','7am-7pm','Off','Off','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (11,41,17,'Dialysis','7 a.m. - 7 p.m.','7 a.m. - 7 p.m.','7 a.m. - 7 p.m.','Off','Off','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (12,46,5,'Pediatrics','Off','Off','Off','7 a.m. - 7 p.m.','7 a.m. - 7 p.m.','Off','Off');
INSERT INTO Nurse_T (NurseID, UserID, DepartmentID, ShiftDescription, MondayShift, TuesdayShift, WednesdayShift, ThursdayShift, FridayShift, SaturdayShift, SundayShift) VALUES (13,50,37,'ICU','Off','Off','Off','Off','7 a.m. - 7 p.m.','7 a.m. - 7 p.m.','Off');

--
-- Dumping data for table `Doctor_T`
--

INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (1,1,'Cardiology','NY1234567','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (2,2,'Dermatology','CA9876543','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (3,3,'Pediatrics','TX7654321','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (4,4,'Oncology','IL2345678','Monday-Saturday, 10AM-8PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (5,5,'Ophthalmology','GA3456789','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (6,6,'Neurology','FL4567890','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (7,7,'Psychiatry','NY0987654','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (8,8,'Urology','TX5678901','Monday-Saturday, 10AM-8PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (9,9,'Obstetrics','CA6543210','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (10,10,'Gynecology','IL3210987','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (11,11,'Endocrinology','GA4567891','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (12,12,'Pulmonology','FL5678910','Monday-Saturday, 10AM-8PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (13,13,'Hematology','NY6789012','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (14,14,'Rheumatology','TX7890123','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (15,15,'Infectious Disease','CA8901234','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (16,16,'Gastroenterology','IL9012345','Monday-Saturday, 10AM-8PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (17,17,'Nephrology','GA0123456','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (18,18,'Orthopedics','FL1234567','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (19,19,'Otolaryngology','NY2345678','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (20,20,'Cardiology','TX3456789','Monday-Saturday, 10AM-8PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (21,21,'Dermatology','CA4567890','Monday-Friday, 9AM-5PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (22,22,'Pediatrics','IL5678901','Tuesday-Saturday, 10AM-6PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (23,23,'Oncology','GA6543210','Monday-Friday, 8AM-4PM');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (24,24,'Cardiologist','A123456789','Monday-Friday, 9am-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (25,25,'Dermatologist','B987654321','Monday, Wednesday, Friday, 1pm-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (26,26,'Pediatrician','C456789012','Tuesday-Thursday, 9am-1pm, Saturday 10am-12pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (27,27,'Neurologist','D345678901','Monday, Wednesday, Friday, 9am-12pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (28,28,'Psychiatrist','E234567890','Tuesday, Thursday, Saturday, 2pm-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (29,29,'Gynecologist','F123450987','Monday-Friday, 9am-1pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (30,30,'Oncologist','G567890123','Tuesday, Thursday, Saturday, 9am-12pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (31,31,'Ophthalmologist','H789012345','Monday, Wednesday, Friday, 10am-2pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (32,32,'Orthopedist','I678901234','Monday, Wednesday, Friday, 2pm-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (33,33,'Urologist','J567890123','Tuesday-Thursday, 1pm-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (34,34,'Endocrinologist','K456789012','Monday-Friday, 2pm-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (35,35,'Pulmonologist','L345678901','Tuesday, Thursday, Saturday, 10am-2pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (36,36,'Allergist','M234567890','Monday-Friday, 10am-2pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (37,37,'Rheumatologist','N123450987','Tuesday, Thursday, Saturday, 1pm-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (38,38,'Gastroenterologist','O567890123','Monday, Wednesday, Friday, 1pm-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (39,39,'Nephrologist','P789012345','Tuesday-Thursday, 2pm-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (40,40,'Hematologist','Q678901234','Monday, Wednesday, Friday, 9am-1pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (41,41,'Geriatrician','R567890123','Monday-Friday, 2pm-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (42,42,'Infectious Disease Specialist','S456789012','Tuesday-Thursday, 1pm-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (43,43,'Pain Management Specialist','T345678901','Monday, Wednesday, Friday, 10am-2pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (44,44,'Sleep Medicine Specialist','U234567890','Tuesday, Thursday, Saturday, 9am-12pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (45,45,'Cardiologist','MD, license #123456789','Monday-Friday, 9am-5pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (46,46,'Dermatologist','DO, license #234567890','Monday-Thursday, 8am-4pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (47,47,'Gynecologist','MD, license #345678901','Monday-Wednesday, 10am-6pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (48,48,'Neurologist','MD, license #456789012','Tuesday-Thursday, 9am-3pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (49,49,'Ophthalmologist','DO, license #567890123','Monday-Friday, 8am-12pm');
INSERT INTO Doctor_T (DoctorID, UserID, Specialization, LicenseInformation, AppointmentSchedule) VALUES (50,50,'Pediatrician','MD, license #678901234','Monday-Friday, 9am-5pm');


--
-- Dumping data for table `patient`
--

INSERT INTO Patient_T (PatientID, UserID, DateofBirth, Gender, Address, EmergencyContactInformation) VALUES (1,1,'1980-01-01','Male','123 Main St, Anytown, USA','James, 555-123-4567'),(2,2,'1995-05-15','Female','456 Maple Ave, Anytown, USA','Jane Smith, 555-987-6543'),(3,3,'1972-11-30','Male','789 Oak St, Anytown, USA','Mary Johnson, 555-456-7890'),(4,4,'1988-08-08','Female','1010 Elm Blvd, Anytown, USA','Bob Williams, 555-789-1234'),(5,5,'2000-03-22','Male','1111 Pine St, Anytown, USA','Sarah Lee, 555-852-9632'),(6,6,'1985-06-11','Female','2222 Cedar Dr, Anytown, USA','Michael Scott, 555-369-1478'),(7,7,'1978-12-25','Male','3333 Walnut Ln, Anytown, USA','Pam Beesly, 555-258-1478'),(8,8,'1992-09-07','Female','4444 Birch Rd, Anytown, USA','Jim Halpert, 555-147-2583'),(9,9,'2065-02-14','Male','5555 Oakwood Dr, Anytown, USA','Dwight Schrute, 555-741-8520'),(10,10,'1998-07-01','Female','6666 Maplewood Ave, Anytown,','Angela Martin, 555-963-7410'),(11,11,'1974-04-11','Male','7777 Elmwood Blvd, Anytown,','Kelly Kapoor, 555-852-9631'),(12,12,'1987-10-18','Female','8888 Cedar St, Anytown, USA','Ryan Howard, 555-741-8521'),(13,13,'1985-05-16','Female','123 Main St, Anytown, USA','John Doe, (555) 555-1212'),(14,14,'1978-02-23','Male','456 Broad St, Anytown, USA','Jane Smith, (555) 555-2323'),(15,15,'1990-11-30','Male','789 Elm St, Anytown, USA','Sarah Johnson, (555) 555-3434'),(16,16,'2067-09-10','Female','321 Oak St, Anytown, USA','Tom Lee, (555) 555'),(17,17,'1980-01-01','Male','123 Main St, Anytown, USA','John Doe, (555) 555-5555'),(18,18,'1975-05-12','Female','456 Maple Ave, Anytown, USA','Jane Smith, (555) 555-1234'),(19,19,'1999-08-23','Male','789 Oak St, Anytown, USA','Sarah Johnson, (555) 555-7890'),(20,20,'1982-12-31','Female','321 Elm St, Anytown, USA','Michael Brown, (555) 555-4567'),(21,21,'1978-06-15','Male','654 Pine St, Anytown, USA','Amanda Lee, (555) 555-5555'),(22,22,'2069-11-17','Female','987 Cherry Ln, Anytown, USA','David Jones, (555) 555-2468'),(23,23,'2005-03-08','Male','741 Olive Rd, Anytown, USA','Susan Garcia, (555) 555-3333'),(24,24,'1973-07-20','Female','852 Cedar St, Anytown, USA','Emily Wilson, (555) 555-4444'),(25,25,'1986-09-29','Male','963 Birch Ave, Anytown, USA','Robert Taylor, (555) 555-7777'),(26,26,'1992-04-18','Female','369 Walnut Blvd, Anytown, USA','Jennifer Brown, (555) 555-8888'),(27,27,'1987-02-22','Male','7413 Oak St, Anytown, USA','John Smith, (555) 555-1111'),(28,28,'1995-12-15','Female','8524 Maple Ave, Anytown, USA','Jane Doe, (555) 555-2222'),(29,29,'1979-10-05','Male','9635 Elm St, Anytown, USA','Sarah Williams, (555) 555-3333'),(30,30,'1985-01-15','Male','123 Main St, Anytown, USA','John Smith, (555) 555-5555'),(31,31,'1979-03-22','Female','456 Broad St, Anycity, USA','Jane Doe, (555) 555-5556'),(32,32,'2000-12-01','Male','789 Oak St, Anystate, USA','Mark Johnson, (555) 555-5557'),(33,33,'1995-07-05','Female','111 Maple Ave, Anytown, USA','Sarah Lee, (555) 555-5558'),(34,34,'1976-09-30','Male','222 Elm St, Anycity, USA','Jason Kim, (555) 555-5559'),(35,35,'1998-11-12','Female','333 Pine St, Anystate, USA','Emily Chen, (555) 555-5560'),(36,36,'1982-04-25','Male','444 Oak St, Anytown, USA','Steven Lee, (555) 555-5561'),(37,37,'1991-08-15','Female','555 Walnut St, Anycity, USA','Olivia Rodriguez, (555) 555-5562'),(38,38,'1989-05-09','Male','666 Cedar St, Anystate, USA','William Brown, (555) 555-5563'),(39,39,'1978-02-18','Female','777 Maple Ave, Anytown, USA','Laura Williams, (555) 555-5564'),(40,40,'1994-06-24','Male','888 Elm St, Anycity, USA','Brandon Nguyen, (555) 555-5565'),(41,41,'1984-09-01','Female','999 Pine St, Anystate, USA','Maria Hernandez, (555) 555-5566'),(42,42,'2003-11-18','Male','111 Oak St, Anytown, USA','Ethan Brown, (555) 555-5567'),(43,43,'1990-01-01','Male','123 Main St, Anytown','John Doe, (123) 456-7890'),(44,44,'1985-05-15','Female','456 Oak Ave, Othertown','Jane Smith, (555) 555-1212'),(45,45,'1972-09-30','Male','789 Elm St, Another','Bob Johnson, (999) 888-7777'),(46,46,'1995-12-25','Female','321 Maple Rd, Somewhere','Sarah Lee, (111) 222-3333'),(47,47,'1988-06-10','Male','654 Pine St, Anytown','Mary Smith, (444) 555-6666'),(48,48,'1978-03-17','Female','987 Cedar Ave, Othertown','Joe Williams, (777) 888-9999'),(49,49,'2065-11-20','Male','555 Broadway, Somewhere','Karen Jones, (111) 222-3333'),(50,50,'1990-05-12','Male','123 Main St, Anytown, USA','Jane Doe, 555-123-4567');


--
-- Dumping data for table `Appointment_T`
--


INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (1,1,1,'2015-03-22','09:00:00','Annual check-up','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (2,2,2,'2015-03-22','09:30:00','Flu symptoms','Scheduled ');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (3,3,3,'2015-03-22','10:00:00','Physical therapy','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (4,4,4,'2015-03-22','11:00:00','Follow-up visit','Scheduled ');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (5,5,5,'2015-03-22','02:00:00','Dental cleaning','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (6,6,6,'2016-06-22','10:30:00','Eye exam','Scheduled ');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (7,7,7,'2016-06-22','11:00:00','Allergy testing','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (8,8,8,'0003-01-22','02:30:00','MRI scan','completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (9,9,9,'0003-06-22','03:00:00','X-ray','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (10,10,10,'0003-06-22','04:00:00','Root canal','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (11,11,11,'0003-01-22','09:00:00','Blood test','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (12,12,12,'0003-07-22','10:00:00','Physical exam','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (13,13,13,'0003-07-22','11:00:00','Therapy session','Scheduled ');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (14,14,14,'0003-07-22','02:00:00','Follow-up visit','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (15,15,15,'0003-01-22','03:00:00','Toothache','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (16,16,16,'0003-08-22','10:00:00','LASIK surgery','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (17,17,17,'0003-08-22','11:00:00','Physical therapy','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (18,18,18,'0003-08-22','02:30:00','CT scan','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (19,19,19,'0003-01-22','03:00:00','Follow-up visit','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (20,20,20,'0003-01-22','03:00:00','X-ray','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (21,21,21,'0003-01-22','04:00:00','Root canal','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (22,22,22,'0003-07-22','09:00:00','Blood test','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (23,23,23,'0003-07-22','10:00:00','Physical exam','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (24,24,24,'0003-07-22','11:00:00','Therapy session','Scheduled ');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (25,25,25,'0003-07-22','02:00:00','Follow-up visit','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (26,26,26,'0003-01-22','03:00:00','Toothache','cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (27,27,27,'0003-01-22','10:00:00','LASIK surgery','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (28,28,28,'0003-01-22','11:00:00','Physical therapy','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (29,29,29,'0001-05-22','10:00:00','Annual checkup','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (30,30,30,'0001-07-22','14:30:00','Sore throat','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (31,31,31,'0001-10-22','09:15:00','Flu','Cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (32,32,32,'0001-12-22','11:00:00','Headache','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (33,33,33,'0001-01-22','08:30:00','Annual checkup','Scheduled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (34,34,34,'0001-08-22','10:45:00','Fever','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (35,35,35,'0001-10-22','13:20:00','Rash','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (36,36,36,'0001-03-22','09:00:00','Stomach pain','Cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (37,37,37,'0001-05-22','15:10:00','Annual checkup','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (38,38,38,'0001-08-22','11:30:00','Cough','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (39,39,39,'0001-03-22','08:45:00','Flu','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (40,40,40,'0002-02-22','16:00:00','Back pain','Scheduled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (41,41,41,'0002-05-22','10:20:00','Annual checkup','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (42,42,42,'0002-08-22','13:00:00','Earache','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (43,43,43,'0002-10-22','11:15:00','Sinusitis','Cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (44,44,44,'0002-12-22','14:45:00','Migraine','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (45,45,45,'0002-12-22','09:30:00','Annual checkup','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (46,46,46,'0002-12-22','15:20:00','Sore throat','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (47,47,47,'0001-10-22','09:15:00','Flu','Cancelled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (48,48,48,'0001-12-22','11:00:00','Headache','Completed');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (49,49,49,'0001-05-22','08:30:00','Annual checkup','Scheduled');
INSERT INTO Appointment_T (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, AppointmentStatus) VALUES (50,50,50,'0001-01-22','10:45:00','Fever','Completed');


--
-- Dumping data for table `Insurance_T`
--

INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (1,1,'POL0001','Aetna','2020-01-01','2021-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (2,2,'POL0002','Blue Cross Blue Shield','2019-06-15','2022-06-14');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (3,3,'POL0003','Cigna','2022-02-01','2023-01-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (4,4,'POL0004','United Healthcare','2021-03-01','2022-02-28');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (5,5,'POL0005','Humana','2022-01-01','2022-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (6,6,'POL0006','Kaiser Permanente','2021-07-01','2022-06-30');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (7,7,'POL0007','Aetna','2022-03-15','2023-03-14');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (8,8,'POL0008','Blue Cross Blue Shield','2022-01-01','2022-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (9,9,'POL0009','Cigna','2020-08-01','2021-07-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (10,10,'POL0010','United Healthcare','2019-11-01','2020-10-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (11,11,'POL0011','Humana','2022-01-01','2022-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (12,12,'POL0012','Kaiser Permanente','2021-04-01','2022-03-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (13,13,'POL0013','Aetna','2020-12-01','2021-11-30');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (14,14,'POL0014','Blue Cross Blue Shield','2022-01-01','2022-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (15,15,'POL0015','Cigna','2021-06-01','2022-05-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (16,16,'POL0016','United Healthcare','2022-02-01','2023-01-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (17,17,'POL0017','Humana','2021-09-01','2022-08-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (18,18,'POL0018','Kaiser Permanente','2020-11-01','2021-10-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (19,19,'POL0019','Aetna','2021-12-07','2023-03-03');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (20,20,'POL001','ABC Insurance','2021-01-01','2022-01-01');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (21,21,'POL002','XYZ Insurance','2022-03-15','2023-03-15');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (22,22,'POL003','DEF Insurance','2021-07-20','2022-07-20');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (23,23,'POL004','GHI Insurance','2021-05-10','2022-05-10');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (24,24,'POL005','JKL Insurance','2022-02-28','2023-02-28');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (25,25,'POL006','MNO Insurance','2021-11-11','2022-11-11');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (26,26,'POL007','PQR Insurance','2022-01-15','2023-01-15');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (27,27,'POL008','STU Insurance','2021-09-01','2022-09-01');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (28,28,'POL009','VWX Insurance','2021-12-25','2022-12-25');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (29,29,'POL010','YZA Insurance','2022-04-02','2023-04-02');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (30,30,'POL011','BCD Insurance','2021-08-18','2022-08-18');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (31,31,'POL012','EFG Insurance','2021-10-05','2022-10-05');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (32,32,'POL013','HIJ Insurance','2022-01-01','2023-01-01');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (33,33,'POL014','KLM Insurance','2021-06-30','2022-06-30');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (34,34,'POL015','NOP Insurance','2022-03-01','2023-03-01');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (35,35,'POL016','QRS Insurance','2021-12-10','2022-12-10');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (36,36,'POL017','TUV Insurance','2021-08-20','2022-08-20');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (37,37,'POL018','WXY Insurance','2022-02-14','2023-02-14');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (38,38,'POL019','ZAB Insurance','2021-05-01','2022-05-01');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (39,39,'POL020','CDE Insurance','2021-04-02','2022-08-18');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (40,40,'P1234','XYZ Insurance','2022-01-01','2022-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (41,41,'P5678','ABC Insurance','2022-03-15','2023-03-14');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (42,42,'P9876','LMN Insurance','2022-05-01','2023-04-30');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (43,43,'P4567','DEF Insurance','2021-11-01','2022-10-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (44,44,'P7890','OPQ Insurance','2023-02-01','2024-01-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (45,45,'P2345','RST Insurance','2022-09-01','2023-08-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (46,46,'P6789','UVW Insurance','2021-12-15','2022-12-14');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (47,47,'P5432','GHI Insurance','2023-01-01','2023-12-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (48,48,'P0987','JKL Insurance','2022-07-01','2023-06-30');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (49,49,'P6543','MNO Insurance','2022-04-01','2023-03-31');
INSERT INTO Insurance_T (InsuranceID, PatientID, PolicyNumber, ProviderName, PolicyStartDate, PolicyEndDate) VALUES (50,50,'P2109','STU Insurance','2021-10-01','2022-09-30');

--
-- Dumping data for table `LabTest_T`
--

INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (1,17,29,'Complete Blood Count','2022-01-28','WBC: 5.2 x10^3/μL<br>RBC: 4.5 x10^6/μL<br>Hb: 13.5 g/dL<br>Hct: 41%','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (2,17,29,'Complete Blood Count','2022-01-28','WBC: 5.2 x10^3/μL<br>RBC: 4.5 x10^6/μL<br>Hb: 13.5 g/dL<br>Hct: 41%','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (3,37,22,'Blood Glucose','2022-02-01','75 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (4,10,22,'Blood Glucose','2022-02-01','75 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (5,47,9,'Lipid Panel','2022-02-02','LDL: 120','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (6,44,6,'Lipid Panel','2022-02-02','Cholesterol: 165 mg/dL<br>LDL: 95 mg/dL<br>HDL: 55 mg/dL<br>Triglycerides: 85 mg/dL','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (7,47,9,'Lipid Panel','2022-02-02','LDL: 120','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (8,44,6,'Lipid Panel','2022-02-02','Cholesterol: 165 mg/dL<br>LDL: 95 mg/dL<br>HDL: 55 mg/dL<br>Triglycerides: 85 mg/dL','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (9,22,18,'Liver Function Test','2022-02-04','ALT: 20 U/L<br>AST: 25 U/L<br>Bilirubin: 0.6 mg/dL<br>Albumin: 4.2 g/dL<br>Alkaline Phosphatase: 70 U/L','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (10,29,45,'Liver Function Test','2022-02-04','ALT: 20 U/L<br>AST: 25 U/L<br>Bilirubin: 0.6 mg/dL<br>Albumin: 4.2 g/dL<br>Alkaline Phosphatase: 70 U/L','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (11,19,16,'Complete Blood Count','2022-02-05','WBC: 8.2','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (12,27,16,'Complete Blood Count','2022-02-05','WBC: 8.2','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (13,14,28,'Liver Function','2022-02-07','ALT: 32','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (14,13,7,'Thyroid Panel','2022-02-07','TSH: 1.5 mIU/L<br>Free T4: 1.1 ng/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (15,18,28,'Liver Function','2022-02-07','ALT: 32','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (16,19,7,'Thyroid Panel','2022-02-07','TSH: 1.5 mIU/L<br>Free T4: 1.1 ng/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (17,47,22,'Hemoglobin A1c','2022-02-09','A1c: 6.2','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (18,3,22,'Hemoglobin A1c','2022-02-09','A1c: 6.2','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (19,48,11,'Urinalysis','2022-02-10','Color: yellow<br>Appearance: clear<br>Glucose: negative<br>Bilirubin: negative<br>Ketones: negative<br>Specific gravity: 1.020<br>pH: 6.5<br>Protein: negative<br>Urobilinogen: normal','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (20,3,11,'Urinalysis','2022-02-10','Color: yellow<br>Appearance: clear<br>Glucose: negative<br>Bilirubin: negative<br>Ketones: negative<br>Specific gravity: 1.020<br>pH: 6.5<br>Protein: negative<br>Urobilinogen: normal','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (21,42,42,'Thyroid Profile','2022-02-11','TSH: 3.8','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (22,6,42,'Thyroid Profile','2022-02-11','TSH: 3.8','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (23,22,37,'Blood Urea Nitrogen','2022-02-12','15 mg/dL','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (24,24,37,'Blood Urea Nitrogen','2022-02-12','15 mg/dL','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (25,34,1,'Basic Metabolic Panel','2022-02-14','Creatinine: 1.0','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (26,22,1,'Basic Metabolic Panel','2022-02-14','Creatinine: 1.0','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (27,35,2,'Electrolyte Panel','2022-02-15','Sodium: 142 mEq/L<br>Potassium: 4.1 mEq/L<br>Chloride: 105 mEq/L<br>CO2: 26 mmol/L','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (28,11,2,'Electrolyte Panel','2022-02-15','Sodium: 142 mEq/L<br>Potassium: 4.1 mEq/L<br>Chloride: 105 mEq/L<br>CO2: 26 mmol/L','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (29,48,8,'Lipid Panel','2022-02-16','HDL: 45','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (30,48,8,'Lipid Panel','2022-02-16','HDL: 45','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (31,33,26,'Lipid Panel','2022-02-17','HDL: 45','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (32,33,19,'Lipid Panel','2022-02-17','HDL: 45','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (33,49,50,'CBC with Differential','2022-02-18','MCV: 92','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (34,39,31,'PSA','2022-02-18','PSA: 1.5','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (35,49,50,'CBC with Differential','2022-02-18','MCV: 92','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (36,39,33,'PSA','2022-02-18','PSA: 1.5','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (37,46,4,'Comprehensive Metabolic','2022-02-19','Glucose: 105','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (38,46,4,'Comprehensive Metabolic','2022-02-19','Glucose: 105','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (39,43,29,'Complete Blood Count','2022-02-20','Hgb: 13.8','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (40,41,33,'Blood Glucose','2022-02-20','175 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (41,5,29,'Complete Blood Count','2022-02-20','Hgb: 13.8','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (42,41,14,'Blood Glucose','2022-02-20','175 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (43,23,23,'Hemoglobin A1c','2022-02-21','A1c: 6.0','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (44,14,23,'Hemoglobin A1c','2022-02-21','A1c: 6.0','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (45,46,11,'Urinalysis','2022-02-22','Glucose: neg','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (46,30,38,'CBC with Differential','2022-02-22','WBC: 8.2','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (47,12,38,'CBC with Differential','2022-02-22','WBC: 8.2','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (48,20,11,'Urinalysis','2022-02-22','Glucose: neg','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (49,33,32,'Comprehensive Metabolic','2022-02-23','Potassium: 3.8','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (50,11,32,'Comprehensive Metabolic','2022-02-23','Potassium: 3.8','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (51,42,6,'Lipid Panel','2022-02-24','Triglycerides: 150','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (52,41,12,'Comprehensive Metabolic','2022-02-24','Sodium: 140','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (53,41,12,'Comprehensive Metabolic','2022-02-24','Sodium: 140','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (54,42,6,'Lipid Panel','2022-02-24','Triglycerides: 150','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (55,21,17,'Lipid Panel','2022-02-26','LDL: 130','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (56,28,17,'Lipid Panel','2022-02-26','LDL: 130','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (57,13,21,'Basic Metabolic Panel','2022-02-27','Sodium: 140','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (58,24,21,'Basic Metabolic Panel','2022-02-27','Sodium: 140','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (59,23,33,'Thyroid Panel','2022-02-28','TSH: 3.0 mIU/L','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (60,25,33,'Thyroid Panel','2022-02-28','TSH: 3.0 mIU/L','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (61,44,36,'Complete Blood Count','2022-03-01','Platelets: 275','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (62,18,22,'Lipid Panel','2022-03-01','HDL: 38','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (63,16,22,'Lipid Panel','2022-03-01','HDL: 38','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (64,44,36,'Complete Blood Count','2022-03-01','Platelets: 275','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (65,10,29,'Hemoglobin A1c','2022-03-02','A1c: 6.5','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (66,24,29,'Hemoglobin A1c','2022-03-02','A1c: 6.5','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (67,47,15,'Vitamin D, 25-Hydroxy','2022-03-04','D3: 30','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (68,47,15,'Vitamin D, 25-Hydroxy','2022-03-04','D3: 30','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (69,43,48,'Thyroid Panel with TSH','2022-03-05','TSH: 1.8','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (70,20,48,'Thyroid Panel with TSH','2022-03-05','TSH: 1.8','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (71,24,20,'Thyroid Panel with TSH','2022-03-07','T3: 80','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (72,30,43,'Thyroid Panel with TSH','2022-03-07','T3: 80','UT Southwestern Laboratory');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (73,25,21,'Complete Blood Count','2022-03-10','Hemoglobin: 12.5 g/dL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (74,31,37,'Complete Blood Count','2022-03-10','Hemoglobin: 12.5 g/dL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (75,36,42,'Comprehensive Metabolic Panel','2022-03-18','Albumin: 4.5 g/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (76,10,42,'Comprehensive Metabolic Panel','2022-03-18','Albumin: 4.5 g/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (77,50,3,'Hemoglobin A1C','2022-04-05','0.055','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (78,50,3,'Hemoglobin A1C','2022-04-05','0.055','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (79,40,41,'Lipid Panel','2022-05-01','Cholesterol: 180 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (80,22,43,'CBC with Diff','2022-05-01','WBC: 6.2','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (81,8,41,'Lipid Panel','2022-05-01','Cholesterol: 180 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (82,15,43,'CBC with Diff','2022-05-01','WBC: 6.2','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (83,20,35,'Urinalysis','2022-05-02','Protein: +','UT Southwestern Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (84,16,35,'Urinalysis','2022-05-02','Protein: +','UT Southwestern Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (85,16,14,'Lipid Panel','2022-05-03','HDL: 40','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (86,17,14,'Lipid Panel','2022-05-03','HDL: 40','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (87,15,22,'Fasting Glucose','2022-05-04','Glucose: 80','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (88,18,22,'Fasting Glucose','2022-05-04','Glucose: 80','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (89,12,29,'A1C','2022-05-05','A1C: 6.8','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (90,19,29,'A1C','2022-05-05','A1C: 6.8','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (91,9,13,'Iron Panel','2022-05-06','Ferritin: 60','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (92,20,13,'Iron Panel','2022-05-06','Ferritin: 60','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (93,41,19,'Fasting Blood Glucose','2022-05-07','89 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (94,40,48,'Vitamin B12','2022-05-07','B12: 250','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (95,7,19,'Fasting Blood Glucose','2022-05-07','89 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (96,21,48,'Vitamin B12','2022-05-07','B12: 250','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (97,37,25,'PSA','2022-05-08','PSA: 1.2','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (98,22,25,'PSA','2022-05-08','PSA: 1.2','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (99,31,36,'Pap Smear','2022-05-09','Normal','UT Southwestern Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (100,23,36,'Pap Smear','2022-05-09','Normal','UT Southwestern Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (101,19,9,'Comprehensive Met','2022-05-10','Sodium: 142','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (102,24,9,'Comprehensive Met','2022-05-10','Sodium: 142','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (103,7,19,'ECG','2022-05-11','Normal','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (104,25,19,'ECG','2022-05-11','Normal','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (105,33,44,'CBC with Diff','2022-05-12','RBC: 4.2','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (106,26,44,'CBC with Diff','2022-05-12','RBC: 4.2','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (107,36,16,'Urinalysis','2022-05-13','Glucose: +','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (108,27,16,'Urinalysis','2022-05-13','Glucose: +','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (109,43,13,'CBC','2022-05-18','WBC 4.5 K/uL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (110,43,13,'CBC','2022-05-18','WBC 4.5 K/uL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (111,44,39,'Complete Blood Count','2022-05-25','White Blood Cells: 9,500/mm³','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (112,5,39,'Complete Blood Count','2022-05-25','White Blood Cells: 9,500/mm³','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (113,39,30,'Thyroid Panel','2022-06-01','Free T4: 1.2 ng/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (114,39,2,'Thyroid Panel','2022-06-01','Free T4: 1.2 ng/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (115,39,38,'HbA1c','2022-06-09','0.063','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (116,9,38,'HbA1c','2022-06-09','0.063','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (117,48,44,'Complete Blood Count','2022-06-10','Platelets: 350,000/mm³','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (118,48,44,'Complete Blood Count','2022-06-10','Platelets: 350,000/mm³','LTC Medical Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (119,19,48,'Lipid Panel','2022-06-12','HDL 56 mg/dL, LDL 122 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (120,16,48,'Lipid Panel','2022-06-12','HDL 56 mg/dL, LDL 122 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (121,50,36,'Creatinine','2022-06-23','1.0 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (122,12,36,'Creatinine','2022-06-23','1.0 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (123,49,25,'Thyroid Panel','2022-06-25','TSH 2.8 uIU/mL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (124,49,25,'Thyroid Panel','2022-06-25','TSH 2.8 uIU/mL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (125,32,23,'Iron Panel','2022-06-29','Iron 60 ug/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (126,32,4,'Iron Panel','2022-06-29','Iron 60 ug/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (127,28,47,'PSA','2022-07-06','2.2 ng/mL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (128,23,47,'PSA','2022-07-06','2.2 ng/mL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (129,32,42,'Electrolytes','2022-07-11','Sodium 141 mmol/L, Potassium 4.0 mmol/L','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (130,12,42,'Electrolytes','2022-07-11','Sodium 141 mmol/L, Potassium 4.0 mmol/L','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (131,37,27,'Glucose Tolerance','2022-07-18','2-hr post-prandial glucose 142 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (132,37,18,'Glucose Tolerance','2022-07-18','2-hr post-prandial glucose 142 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (133,49,9,'Comprehensive Metabolic Panel','2022-07-20','Calcium: 9.5 mg/dL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (134,49,9,'Comprehensive Metabolic Panel','2022-07-20','Calcium: 9.5 mg/dL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (135,10,2,'PSA','2022-07-28','5.5 ng/mL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (136,19,2,'PSA','2022-07-28','5.5 ng/mL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (137,41,20,'Liver Function Tests','2022-08-04','AST 22 U/L, ALT 34 U/L, Total Bilirubin 0.8 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (138,41,20,'Liver Function Tests','2022-08-04','AST 22 U/L, ALT 34 U/L, Total Bilirubin 0.8 mg/dL','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (139,43,16,'Basic Metabolic Panel','2022-08-08','Glucose: 110 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (140,43,16,'Basic Metabolic Panel','2022-08-08','Glucose: 110 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (141,29,25,'Glucose Tolerance Test','2022-08-16','125 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (142,14,25,'Glucose Tolerance Test','2022-08-16','125 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (143,18,26,'Lipid Panel','2022-08-28','Triglycerides: 140 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (144,27,26,'Lipid Panel','2022-08-28','Triglycerides: 140 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (145,38,29,'Basic Metabolic Panel','2022-09-22','BUN: 10 mg/dL','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (146,38,12,'Basic Metabolic Panel','2022-09-22','BUN: 10 mg/dL','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (147,38,48,'Lipid Panel','2022-10-02','HDL: 60 mg/dL, LDL: 130 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (148,9,48,'Lipid Panel','2022-10-02','HDL: 60 mg/dL, LDL: 130 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (149,43,29,'Hemoglobin A1c','2022-11-20','0.052','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (150,43,29,'Hemoglobin A1c','2022-11-20','0.052','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (151,20,16,'Lipid Panel','2022-11-21','Cholesterol','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (152,28,16,'Lipid Panel','2022-11-21','Cholesterol','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (153,47,38,'Complete Blood Count','2022-11-22','Red Blood','UT Southwestern Lab');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (154,23,19,'Thyroid Panel','2022-11-22','T3','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (155,30,9,'Thyroid Panel','2022-11-22','T3','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (156,47,38,'Complete Blood Count','2022-11-22','Red Blood','UT Southwestern Lab');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (157,48,15,'Basic Metabolic Panel','2022-11-23','Glucose','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (158,48,15,'Basic Metabolic Panel','2022-11-23','Glucose','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (159,16,26,'Hepatic Function','2022-11-24','Bilirubin','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (160,24,26,'Hepatic Function','2022-11-24','Bilirubin','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (161,49,3,'Lipid Panel','2022-11-25','Triglycerides','UT Southwestern Lab');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (162,21,23,'Complete Blood Count','2022-11-25','Platelets','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (163,2,3,'Lipid Panel','2022-11-25','Triglycerides','UT Southwestern Lab');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (164,15,23,'Complete Blood Count','2022-11-25','Platelets','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (165,11,10,'Thyroid Panel','2022-11-26','TSH','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (166,19,10,'Thyroid Panel','2022-11-26','TSH','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (167,33,24,'Hepatic Function','2022-11-27','Albumin','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (168,2,3,'Basic Metabolic Panel','2022-11-27','Sodium','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (169,33,32,'Hepatic Function','2022-11-27','Albumin','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (170,25,12,'Basic Metabolic Panel','2022-11-27','Sodium','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (171,46,29,'Complete Blood Count','2022-11-28','White Blood','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (172,4,29,'Complete Blood Count','2022-11-28','White Blood','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (173,45,25,'Comprehensive Metabolic Panel','2022-12-15','Glucose: 90 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (174,4,25,'Comprehensive Metabolic Panel','2022-12-15','Glucose: 90 mg/dL','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (175,39,32,'Liver Panel','2023-01-05','ALT: 35 U/L, AST: 42 U/L','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (176,39,10,'Liver Panel','2023-01-05','ALT: 35 U/L, AST: 42 U/L','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (177,26,22,'Vitamin D','2023-02-18','25 ng/mL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (178,31,6,'Vitamin D','2023-02-18','25 ng/mL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (179,25,47,'Complete Blood Count','2023-03-12','RBC: 4.6 M/uL, WBC: 6.5 K/uL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (180,23,47,'Complete Blood Count','2023-03-12','RBC: 4.6 M/uL, WBC: 6.5 K/uL','Alletech Labs Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (181,34,1,'Thyroid Stimulating Hormone','2023-04-06','2.8 mIU/L','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (182,11,1,'Thyroid Stimulating Hormone','2023-04-06','2.8 mIU/L','Labs 2 Run Inc');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (183,35,14,'Lipid Panel','2023-05-14','HDL: 70 mg/dL, LDL: 110 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (184,26,14,'Lipid Panel','2023-05-14','HDL: 70 mg/dL, LDL: 110 mg/dL','UT Southwestern Laboratory Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (185,46,12,'Hemoglobin A1c','2023-06-28','0.064','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (186,46,12,'Hemoglobin A1c','2023-06-28','0.064','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (187,37,28,'Comprehensive Metabolic Panel','2023-07-19','Sodium: 138 mmol/L','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (188,37,9,'Comprehensive Metabolic Panel','2023-07-19','Sodium: 138 mmol/L','Snappy Lab Services');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (189,33,25,'Liver Panel','2023-08-06','ALT: 18 U/L, AST: 25 U/L','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (190,33,24,'Liver Panel','2023-08-06','ALT: 18 U/L, AST: 25 U/L','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (191,31,37,'Vitamin D','2023-09-18','35 ng/mL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (192,12,37,'Vitamin D','2023-09-18','35 ng/mL','Natera Labs');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (193,7,29,'Complete Blood Count','2022-01-28','WBC: 5.2 x10^3/μL<br>RBC: 4.5 x10^6/μL<br>Hb: 13.5 g/dL<br>Hct: 41%','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (194,37,29,'Complete Blood Count','2022-01-28','WBC: 5.2 x10^3/μL<br>RBC: 4.5 x10^6/μL<br>Hb: 13.5 g/dL<br>Hct: 41%','Any Lab Test Now');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (195,15,22,'Blood Glucose','2022-02-01','75 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (196,12,22,'Blood Glucose','2022-02-01','75 mg/dL','Quest Diagnostics');
INSERT INTO LabTest_T (TestID, PatientID, DoctorID, TestName, TestDate, TestResults, LabName) VALUES (197,27,9,'Lipid Panel','2022-02-02','LDL: 120','Any Lab Test Now');



--
-- Dumping data for table `LabResult_T`
--

INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (1,2,'2022-02-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (2,1,'2022-02-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (3,5,'2022-02-04','High cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (4,3,'2022-02-05','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (5,4,'2022-02-05','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (6,7,'2022-02-06','High cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (7,8,'2022-02-06','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (8,6,'2022-02-07','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (9,9,'2022-02-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (10,11,'2022-02-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (11,12,'2022-02-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (12,10,'2022-02-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (13,14,'2022-02-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (14,16,'2022-02-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (15,17,'2022-02-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (16,15,'2022-02-12','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (17,13,'2022-02-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (18,20,'2022-02-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (19,18,'2022-02-14','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (20,19,'2022-02-15','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (21,21,'2022-02-15','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (22,24,'2022-02-15','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (23,22,'2022-02-16','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (24,23,'2022-02-17','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (25,25,'2022-02-17','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (26,26,'2022-02-17','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (27,27,'2022-02-18','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (28,28,'2022-02-18','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (29,29,'2022-02-20','Low HDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (30,30,'2022-02-21','Low HDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (31,34,'2022-02-22','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (32,36,'2022-02-22','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (33,39,'2022-02-23','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (34,40,'2022-02-23','High Blood Sugar');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (35,41,'2022-02-23','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (36,42,'2022-02-23','High Blood Sugar');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (37,33,'2022-02-24','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (38,35,'2022-02-24','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (39,31,'2022-02-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (40,32,'2022-02-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (41,43,'2022-02-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (42,44,'2022-02-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (43,37,'2022-02-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (44,38,'2022-02-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (45,45,'2022-02-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (46,48,'2022-02-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (47,46,'2022-02-28','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (48,47,'2022-02-28','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (49,51,'2022-02-28','Borderline high triglycerides');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (50,54,'2022-02-28','Borderline high triglycerides');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (51,49,'2022-03-01','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (52,50,'2022-03-02','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (53,58,'2022-03-02','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (54,57,'2022-03-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (55,52,'2022-03-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (56,53,'2022-03-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (57,59,'2022-03-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (58,61,'2022-03-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (59,64,'2022-03-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (60,60,'2022-03-05','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (61,55,'2022-03-05','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (62,63,'2022-03-05','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (63,56,'2022-03-06','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (64,65,'2022-03-06','Borderline High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (65,66,'2022-03-06','Borderline High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (66,62,'2022-03-07','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (67,69,'2022-03-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (68,70,'2022-03-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (69,71,'2022-03-10','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (70,72,'2022-03-10','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (71,67,'2022-03-11','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (72,68,'2022-03-11','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (73,73,'2022-03-13','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (74,74,'2022-03-13','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (75,75,'2022-03-21','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (76,76,'2022-03-21','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (77,77,'2022-04-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (78,78,'2022-04-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (79,79,'2022-05-05','Borderline high');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (80,81,'2022-05-05','Borderline high');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (81,87,'2022-05-05','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (82,88,'2022-05-05','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (83,83,'2022-05-06','Proteinuria');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (84,84,'2022-05-06','Proteinuria');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (85,80,'2022-05-08','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (86,82,'2022-05-08','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (87,85,'2022-05-08','Low HDL');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (88,86,'2022-05-08','Low HDL');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (89,91,'2022-05-11','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (90,92,'2022-05-11','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (91,89,'2022-05-12','Pre-Diabetes');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (92,90,'2022-05-12','Pre-Diabetes');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (93,93,'2022-05-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (94,95,'2022-05-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (95,103,'2022-05-13','Normal Results');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (96,104,'2022-05-13','Normal Results');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (97,94,'2022-05-14','Low B12');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (98,96,'2022-05-14','Low B12');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (99,97,'2022-05-15','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (100,98,'2022-05-15','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (101,101,'2022-05-15','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (102,102,'2022-05-15','Normal Range');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (103,99,'2022-05-16','Normal Results');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (104,100,'2022-05-16','Normal Results');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (105,105,'2022-05-19','Anemia');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (106,106,'2022-05-19','Anemia');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (107,107,'2022-05-20','Hyperglycemia');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (108,108,'2022-05-20','Hyperglycemia');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (109,109,'2022-05-20','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (110,110,'2022-05-20','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (111,111,'2022-05-28','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (112,112,'2022-05-28','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (113,113,'2022-06-05','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (114,114,'2022-06-05','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (115,115,'2022-06-12','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (116,116,'2022-06-12','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (117,117,'2022-06-12','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (118,118,'2022-06-12','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (119,119,'2022-06-18','High LDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (120,120,'2022-06-18','High LDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (121,121,'2022-06-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (122,122,'2022-06-26','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (123,123,'2022-06-30','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (124,124,'2022-06-30','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (125,125,'2022-07-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (126,126,'2022-07-04','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (127,127,'2022-07-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (128,128,'2022-07-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (129,129,'2022-07-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (130,130,'2022-07-13','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (131,133,'2022-07-22','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (132,134,'2022-07-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (133,131,'2022-07-25','Prediabetic');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (134,132,'2022-07-25','Prediabetic');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (135,135,'2022-08-02','High PSA');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (136,136,'2022-08-02','High PSA');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (137,137,'2022-08-06','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (138,138,'2022-08-06','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (139,139,'2022-08-14','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (140,140,'2022-08-15','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (141,142,'2022-08-23','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (142,141,'2022-08-28','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (143,143,'2022-09-02','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (144,144,'2022-09-02','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (145,146,'2022-09-24','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (146,145,'2022-09-27','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (147,147,'2022-10-09','High LDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (148,148,'2022-10-12','High LDL cholesterol');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (149,149,'2022-11-22','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (150,150,'2022-11-22','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (151,151,'2022-11-27','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (152,152,'2022-11-27','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (153,153,'2022-11-28','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (154,154,'2022-11-29','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (155,155,'2022-11-29','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (156,156,'2022-11-29','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (157,157,'2022-11-29','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (158,158,'2022-11-30','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (159,159,'2022-12-01','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (160,161,'2022-12-02','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (161,162,'2022-12-02','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (162,163,'2022-12-02','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (163,164,'2022-12-02','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (164,160,'2022-12-03','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (165,165,'2022-12-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (166,166,'2022-12-03','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (167,167,'2022-12-04','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (168,169,'2022-12-04','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (169,170,'2022-12-04','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (170,168,'2022-12-05','Low');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (171,171,'2022-12-05','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (172,172,'2022-12-05','High');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (173,173,'2022-12-20','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (174,174,'2022-12-20','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (175,175,'2023-01-08','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (176,176,'2023-01-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (177,177,'2023-01-10','Insufficient');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (178,178,'2023-02-25','Insufficient');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (179,179,'2023-03-19','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (180,180,'2023-03-19','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (181,181,'2023-04-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (182,182,'2023-04-11','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (183,183,'2023-05-21','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (184,184,'2023-05-21','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (185,185,'2023-06-30','Prediabetes');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (186,186,'2023-06-30','Prediabetes');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (187,187,'2023-07-24','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (188,188,'2023-07-24','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (189,189,'2023-08-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (190,190,'2023-08-09','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (191,191,'2023-09-25','Normal');
INSERT INTO LabResult_T (ResultID, TestID, ResultDate, ResultValue) VALUES (192,192,'2023-09-25','Normal');

--
-- Dumping data for table `Imaging_T`
--

INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (1,11,42,'X-ray','2022-02-27','No abnormalities detected','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (2,13,42,'MRI','2022-03-15','Torn ACL on left knee','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (3,15,2,'CT Scan','2022-03-21','Lung cancer detected','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (4,17,23,'Ultrasound','2022-03-22','Fetal heartbeat detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (5,39,47,'X-ray','2022-03-25','Broken wrist bone','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (6,37,24,'MRI','2022-03-26','Brain tumor detected','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (7,35,47,'X-ray','2022-03-27','Fractured ankle','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (8,33,46,'CT Scan','2022-03-28','No abnormalities detected','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (9,31,14,'Ultrasound','2022-03-29','Enlarged liver detected','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (10,29,18,'X-ray','2022-03-30','No abnormalities detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (11,19,24,'CT Scan','2022-04-01','Gallstones detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (12,21,30,'X-ray','2022-04-02','No abnormalities detected','RAYUS Radiology');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (13,23,26,'MRI','2022-04-03','Herniated disc in lower back','RAYUS Radiology');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (14,25,17,'Ultrasound','2022-04-04','Healthy fetal development','RAYUS Radiology');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (15,27,43,'X-ray','2022-04-05','Broken collarbone','RAYUS Radiology');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (16,47,34,'CT Scan','2022-04-06','Kidney stones detected','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (17,43,47,'X-ray','2022-04-07','Dislocated shoulder','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (18,45,50,'MRI','2022-04-08','ACL tear in right knee','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (19,41,50,'Ultrasound','2022-04-09','Cyst on ovary','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (20,2,47,'X-ray','2022-04-10','No abnormalities detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (21,4,26,'CT Scan','2022-04-11','Appendicitis detected','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (22,6,47,'X-ray','2022-04-12','Fractured wrist','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (23,8,17,'MRI','2022-04-13','Torn meniscus in left knee','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (24,10,17,'Ultrasound','2022-04-14','Healthy fetal development','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (25,12,44,'X-ray','2022-04-15','Broken rib','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (26,16,32,'CT Scan','2022-04-16','Lung infection detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (27,16,5,'X-ray','2022-04-17','Fractured ankle','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (28,16,42,'MRI','2022-04-18','Herniated disc in neck','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (29,20,17,'Ultrasound','2022-04-19','Enlarged thyroid gland','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (30,22,10,'X-ray','2022-04-20','No abnormalities detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (31,24,30,'CT Scan','2022-04-21','Kidney infection detected','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (32,4,39,'MRI','2022-04-22','Brain aneurysm detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (33,28,48,'X-ray','2022-04-23','Broken leg','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (34,1,1,'Ultrasound','2022-04-24','Healthy fetal development','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (35,2,3,'X-ray','2022-04-25','Dislocated elbow','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (36,3,48,'CT Scan','2022-04-26','Pancreatic cancer detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (37,4,1,'MRI','2022-04-27','Torn rotator cuff in right shoulder','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (38,5,44,'X-ray','2022-04-28','Fractured collarbone','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (39,6,23,'Ultrasound','2022-04-29','Enlarged liver','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (40,6,39,'CT Scan','2022-04-30','Gallbladder inflammation detected','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (41,8,10,'X-ray','2022-05-01','Broken nose','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (42,9,21,'MRI','2022-05-02','Spinal stenosis detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (43,50,3,'Ultrasound','2022-05-03','Healthy fetal development','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (44,49,49,'X-ray','2022-05-04','No abnormalities detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (45,48,20,'CT Scan','2022-05-05','Kidney stones detected','Prime Diagnostic Center, San Francisco');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (46,47,36,'X-ray','2022-05-06','Fractured finger','InVision Medical Group, Houston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (47,46,24,'MRI','2022-05-07','Torn ACL in left knee','QCare Hospital, New York');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (48,45,21,'Ultrasound','2022-05-08','Ovarian cyst detected','Ramsay Clinic, Los Angeles');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (49,44,5,'X-ray','2022-05-09','Broken wrist','Collin County Medical Center, Boston');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (50,43,5,'CT Scan','2022-05-10','Appendicitis detected','Promus Diagnostics, Chicago');
INSERT INTO Imaging_T (ImagingID, PatientID, DoctorID, ImagingType, ImagingDate, ImagingResults, ImagingCenter) VALUES (51,42,45,'MRI','2022-05-11','Torn meniscus in right knee','Prime Diagnostic Center');

--
-- Dumping data for table `MedicalRecord_T`
--


INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (1,1,1,'2022-01-22','Upper respiratory infection','Rest and fluids','Acetaminophen every 6 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (2,2,2,'2022-03-22','Sprained ankle','Rest and elevation','Ibuprofen every 8 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (3,3,3,'2022-05-22','Influenza','Tamiflu, rest and fluids','Tamiflu every 12 hours, acetaminophen every 6 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (4,4,4,'2022-06-22','Migraine','Dark, quiet room and medication for pain relief','Sumatriptan as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (5,5,5,'2022-08-22','Sinus infection','Antibiotics and decongestants','Amoxicillin, Sudafed every 12 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (6,6,6,'2022-10-22','Sore throat','Antibiotics and throat lozenges','Azithromycin, Cepacol every 8 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (7,7,7,'2022-12-22','Sprained wrist','Rest and ice','Naproxen every 12 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (8,8,8,'2022-10-22','Urinary tract infection','Antibiotics and increased fluid intake','Ciprofloxacin, water every 6 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (9,9,9,'2022-11-22','Allergic reaction','Antihistamines and topical cream','Benadryl every 8 hours, hydrocortisone cream as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (10,10,10,'2022-02-22','Bronchitis','Antibiotics and cough suppressants','Zithromax, Dextromethorphan every 12 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (11,11,11,'2022-03-22','Migraine','Dark, quiet room and medication for pain relief','Sumatriptan as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (12,12,12,'2022-05-22','Pink eye','Antibiotic eye drops','Erythromycin every 6 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (13,13,13,'2022-07-22','Strep throat','Antibiotics and throat lozenges','Penicillin, Cepacol every 8 hours');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (14,14,14,'2022-01-22','High blood pressure','Medication and lifestyle changes','Lisinopril every 24 hours, exercise and healthy diet');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (15,15,15,'2022-03-22','Allergic rhinitis','Antihistamines and decongestants','Zyrtec,');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (16,16,16,'2022-01-22','Influenza','Rest and fluids','Tamiflu 75mg, 1 tablet twice daily for 5 days');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (17,17,17,'2022-02-22','Sinusitis','Antibiotics and decongestants','Amoxicillin 500mg, 1 tablet thrice daily for 10 days');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (18,18,18,'2022-02-22','Hypertension','Lifestyle modifications and medication','Lisinopril 10mg, 1 tablet daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (19,19,19,'2022-10-22','Migraine','Analgesics and lifestyle modifications','Acetaminophen 500mg, 1 tablet as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (20,20,20,'2022-05-22','Otitis media','Antibiotics and ear drops','Amoxicillin 250mg, 1 tablet thrice daily for 5 days');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (21,21,21,'2022-01-22','Allergic rhinitis','Antihistamines and nasal sprays','Loratadine 10mg, 1 tablet daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (22,22,22,'2022-08-22','Type 2 diabetes mellitus','Medication and dietary modifications','Metformin 500mg, 1 tablet thrice daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (23,23,23,'2022-10-22','Bronchitis','Antibiotics and bronchodilators','Azithromycin 250mg, 1 tablet daily for 5 days');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (24,24,24,'2022-08-22','Anxiety','Therapy and lifestyle modifications','N/A');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (25,25,25,'2022-10-22','Insomnia','Medication and lifestyle modifications','Zolpidem 10mg, 1 tablet daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (26,26,26,'2022-05-22','Osteoporosis','Medication and lifestyle modifications','Alendronate 70mg, 1 tablet weekly');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (27,27,27,'2022-05-22','Gastroesophageal reflux','Medication and lifestyle modifications','Omeprazole 20mg, 1 tablet daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (28,28,28,'2022-10-22','Malaria','Antimalarial medication and rest','Chloroquine 250mg, 2 tablets daily for 3 days');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (29,29,29,'2022-02-22','Asthma','Inhalers and bronchodilators','Albuterol 90mcg, 1 puff as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (30,30,30,'2022-05-22','Hypertension','Prescribed blood pressure medication','Amlodipine 5mg tablet taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (31,31,31,'2022-12-21','Anxiety disorder','Cognitive-behavioral therapy sessions','Sertraline 50mg tablet taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (32,32,32,'2022-07-22','Type 2 diabetes','Diet and exercise plan','Metformin 1000mg tablet taken twice daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (33,33,33,'2022-02-22','Influenza','Rest and hydration','Tamiflu 75mg capsule taken twice daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (34,34,34,'2022-01-22','Asthma','Prescribed inhaler and avoidance of triggers','Albuterol inhaler, use as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (35,35,35,'2022-11-22','Migraine','Avoidance of triggers and relaxation techniques','Sumatriptan 50mg tablet taken as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (36,36,36,'2022-02-22','Depression','Cognitive-behavioral therapy and medication','Escitalopram 10mg tablet taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (37,37,37,'2022-08-22','Hypothyroidism','Levothyroxine medication','Levothyroxine 75mcg tablet taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (38,38,38,'2022-11-22','Urinary tract infection','Antibiotics','Ciprofloxacin 500mg tablet taken twice daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (39,39,39,'2022-09-21','Osteoarthritis','Physical therapy and pain management plan','Acetaminophen 500mg tablet taken as needed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (40,40,40,'2022-01-22','Sinusitis','Decongestants and nasal irrigation','Fluticasone nasal spray, use as directed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (41,41,41,'2022-04-22','Anxiety disorder','Cognitive-behavioral therapy sessions','Buspirone 10mg tablet taken twice daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (42,42,42,'2022-02-21','Type 1 diabetes','Insulin injections and monitoring blood glucose','Insulin glargine 100 units/mL injection, taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (43,43,43,'2022-12-21','Acute bronchitis','Rest and hydration','Codeine cough syrup, use as directed');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (44,44,44,'2022-02-22','Seasonal allergies','Antihistamines and avoidance of triggers','Loratadine 10mg tablet taken once daily');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (45,45,45,'2022-01-22','Acute bronchitis','Rest, hydration, cough medicine','Dextromethorphan, guaifenesin');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (46,46,46,'2022-03-22','Anxiety disorder','Cognitive-behavioral therapy, exercise','Sertraline, clonazepam');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (47,47,47,'2022-04-22','Type 2 diabetes','Diet and exercise, Metformin','Metformin');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (48,48,48,'2022-05-22','Hypertension','Diet and exercise, Lisinopril','Lisinopril');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (49,49,49,'2022-07-22','Migraine headaches','Rest, hydration, pain medication','Acetaminophen, ibuprofen');
INSERT INTO MedicalRecord_T  (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, TreatmentPlan, MedicationInformation) VALUES (50,50,50,'2022-08-22','Depression','Psychotherapy, medication','Fluoxetine');




--
-- Dumping data for table `Billing_T`
--

INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (1,1,1,500,'2022-01-05','Credit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (2,2,2,750,'2022-01-06','Debit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (3,3,3,1989,'2022-01-07','Insurance');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (4,4,4,178,'2022-01-08','Insurance');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (5,5,5,198,'2022-01-09','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (6,6,6,200,'2022-01-10','Credit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (7,7,7,550,'2022-01-11','Debit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (8,8,8,3678,'2022-01-12','Insurance');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (9,9,9,900,'2022-01-13','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (10,10,10,172,'2022-01-14','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (11,11,11,600,'2022-01-15','Credit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (12,12,12,800,'2022-01-16','Debit Card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (13,13,13,950,'2022-01-17','Insurance');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (14,14,14,1677,'2022-01-18','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (15,15,15,2897,'2022-01-19','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (16,16,16,1000,'2023-03-01','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (17,17,17,751,'2023-03-02','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (18,18,18,225,'2023-03-03','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (19,19,19,475,'2023-03-04','Debit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (20,20,20,125,'2023-03-05','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (21,21,21,85,'2023-03-06','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (22,22,20,925,'2023-03-07','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (23,16,16,305,'2023-03-08','Debit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (24,16,16,426,'2023-03-09','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (25,16,16,981,'2023-03-10','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (26,16,16,125,'2023-03-11','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (27,16,16,325,'2023-03-12','Debit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (28,16,16,726,'2023-03-13','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (29,16,16,150,'2023-03-14','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (30,16,16,95,'2023-03-15','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (31,16,16,200,'2023-03-16','Debit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (32,16,16,426,'2023-03-17','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (33,16,16,836,'2023-03-18','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (34,16,16,80,'2023-03-19','Cash');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (35,16,16,350,'2023-03-20','Debit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (36,16,16,551,'2023-03-21','Credit card');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (37,16,16,951,'2023-03-22','PayPal');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (38,38,38,250,'2022-01-05','Visa ');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (39,38,38,126,'2022-02-10','MasterCard ');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (40,38,38,75,'2022-03-15','Discover ');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (41,38,38,175,'2022-04-20','Visa');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (42,38,38,225,'2022-05-25','MasterCard');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (43,38,38,100,'2022-06-30','Discover');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (44,38,38,351,'2022-07-05','Visa ');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (45,38,38,151,'2022-08-10','MasterCard');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (46,38,38,85,'2022-09-15','Discover');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (47,38,38,190,'2022-10-20','Visa');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (48,38,38,210,'2022-11-25','MasterCard');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (49,38,38,90,'2022-12-30','Discover ');
INSERT INTO Billing_T (BillingID, PatientID, RecordID, TotalCost, BillingDate, PaymentInformation) VALUES (50,38,38,416,'2023-01-05','Visa');


--
-- Dumping data for table `Prescription_T`
--

INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (1,1,1,'        Amoxicillin','          500mg, twice daily','    Walgreens');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (2,2,2,'        Ibuprofen','          200mg, as needed','        CVS Pharmacy');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (3,3,3,'        Levothyroxine','       50mcg, once daily','    Rite Aid');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (4,4,4,'Zubsolv',' 100mg, once a day','Brunet');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (5,5,5,'Naloxone','  500mg, twice daily','Costco');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (6,6,6,'Omeprazole',' 200mg, as needed','DRUGStore Pharmacy');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (7,7,7,'Trazodone','  50mcg, once daily','Familiprix');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (8,8,8,'Rybelsus',' 100mg, once a day','Jean Coutu');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (9,9,9,'secukinumab',' 200mg, as needed','Lawtons');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (10,10,10,'Sublocade','25mg, twice','London Drugs');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (11,11,11,'Tramadol',' 100mg, once a day','PharmaChoice');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (12,12,12,'Trazodone','  500mg, twice daily','Pharmasave');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (13,13,13,'Viagra','  50mcg, once daily','Proxim ');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (14,14,14,'Wegovy','25mg, twice','Rexall');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (15,15,15,'Wellbutrin','250mg, daily','Shoppers Drug Mart ');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (16,16,16,'Wellbutrin','50mg,once a day','Watsons Drug');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (17,17,17,'Aspirin','Take 1 tablet every 4-6 hours','ABC Pharmacy, 123 Main St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (18,18,18,'Amoxicillin','Take 1 capsule every 8 hours','XYZ Pharmacy, 456 Broadway, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (19,19,19,'Lipitor','Take 1 tablet daily','XYZ Pharmacy, 456 Broadway, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (20,20,20,'Ibuprofen','Take 1 tablet every 6 hours','ABC Pharmacy, 123 Main St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (21,21,21,'Tylenol','Take 2 tablets every 4-6 hours','DEF Pharmacy, 789 Elm St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (22,22,22,'Nexium','Take 1 capsule daily before a meal','ABC Pharmacy, 123 Main St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (23,23,23,'Advair','Take 1 inhalation twice daily','XYZ Pharmacy, 456 Broadway, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (24,24,24,'Zyrtec','Take 1 tablet daily','GHI Pharmacy, 321 Oak St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (25,25,25,'Prilosec','Take 1 tablet daily before a meal','JKL Pharmacy, 987 Pine St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (26,26,26,'Benadryl','Take 1-2 tablets every 4-6 hours','ABC Pharmacy, 123 Main St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (27,27,27,'Plavix','Take 1 tablet daily','MNO Pharmacy, 654 Maple St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (28,28,28,'Albuterol','Take 1-2 inhalations every 4-6 hours as needed','XYZ Pharmacy, 456 Broadway, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (29,29,29,'Prozac','Take 1 capsule daily','GHI Pharmacy, 321 Oak St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (30,30,30,'Crestor','Take 1 tablet daily','JKL Pharmacy, 987 Pine St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (31,31,31,'Xanax','Take 1 tablet every 6-8 hours as needed','DEF Pharmacy, 789 Elm St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (32,32,32,'Synthroid','Take 1 tablet daily before breakfast','ABC Pharmacy, 123 Main St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (33,33,33,'Spiriva','Take 1 capsule daily','XYZ Pharmacy, 456 Broadway, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (34,34,34,'Adderall','Take 1 tablet twice daily','GHI Pharmacy, 321 Oak St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (35,35,35,'Vicodin','Take 1-2 tablets every 4-6 hours as needed','JKL Pharmacy, 987 Pine St, Anytown, USA');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (36,36,36,'Ativan','Take 1 tablet every 6-8 hours as needed','DEF Pharmacy, 789 Elm St');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (37,37,37,'Meloxicam','Take 1 tablet every 4-6 hours','Super-Pharm');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (38,38,38,'Metformin','Take 1 tablet daily','Macau');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (39,39,39,'Methadone','500mg, twice daily','South Star Drug');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (40,40,40,'Methotrexate',' 100mg, once a day','Malaysia');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (41,41,41,'Metoprolol','250mg, daily','Guardian Pharmacy');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (42,42,42,'Naloxone','Take 1 tablet every 4-6 hours','Watsons');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (43,43,43,'Naltrexone','Take 1 tablet daily','Mexico');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (44,44,44,'Naproxen',' 100mg, once a day','Farmacias Benavides');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (45,45,45,'Narcan','250mg, daily','Farmacias Guadalajara');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (46,46,46,'Nurtec','500mg, twice daily','Alliance Healthcare');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (47,47,47,'Omeprazole','100mg, once a day','Dio Drogist');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (48,48,48,'Onpattro',' 500mg, twice daily','Mediq');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (49,49,49,'Otezla','Take 1 tablet every 6-8 hours as needed','Unichem');
INSERT INTO Prescription_T (PrescriptionID, RecordID, DoctorID, MedicationName, DosageInstructions, PharmacyInformation) VALUES (50,50,50,'Ozempic','250mg, daily','Mercury Drug');



--
-- Dumping data for table `Supply_Request_T`
--

INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (1,1,1,500,'2023-02-09',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (2,2,2,1000,'2023-03-06',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (3,3,3,1000,'2022-04-16',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (4,4,4,10,'2022-07-05',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (5,5,5,50,'2022-12-24',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (6,6,6,20,'2023-03-11',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (7,7,7,500,'2022-03-06',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (8,8,8,200,'2023-03-16',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (9,9,9,100,'2023-01-19',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (10,10,10,10,'2022-03-30',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (11,11,11,5,'2022-09-17',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (12,12,12,2,'2022-03-03',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (13,13,13,10,'2022-05-21',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (14,14,14,50,'2022-06-03',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (15,15,15,2,'2022-10-09',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (16,16,16,3,'2023-03-24',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (17,17,17,100,'2023-01-15',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (18,18,18,50,'2022-05-06',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (19,19,19,5,'2023-02-25',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (20,20,20,100,'2023-03-09',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (21,21,21,200,'2022-07-25',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (22,22,22,500,'2022-06-14',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (23,23,23,50,'2022-05-13',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (24,24,24,100,'2022-11-22',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (25,25,25,150,'2022-06-20',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (26,26,26,200,'2022-09-10',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (27,27,27,1000,'2022-04-05',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (28,28,28,1000,'2022-04-02',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (29,29,29,1000,'2023-01-29',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (30,30,30,1000,'2023-02-10',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (31,31,31,20,'2022-08-12',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (32,32,32,50,'2022-03-28',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (33,33,33,100,'2022-10-03',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (34,34,34,5,'2022-05-29',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (35,35,35,200,'2023-02-17',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (36,36,36,1000,'2022-11-12',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (37,37,37,10,'2023-03-14',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (38,38,38,2,'2022-07-02',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (39,39,39,1,'2022-04-19',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (40,40,40,1,'2022-06-24',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (41,41,41,1,'2022-10-31',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (42,42,42,1,'2023-03-05',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (43,43,43,1,'2022-12-05',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (44,44,44,10,'2022-08-08',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (45,45,45,1,'2022-05-04',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (46,46,46,1000,'2023-01-03',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (47,47,47,100,'2023-03-26',2);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (48,48,48,100,'2023-03-01',3);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (49,49,49,50,'2022-08-30',1);
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES (50,50,50,1000,'2022-03-25',2);


--
-- Dumping data for table `Surgery_T`
--

INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (1,1,1,'Appendectomy','2022-02-01','General','Rest and avoid strenuous activity for 2 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (2,2,2,'Tonsillectomy','2022-01-25','Local','Gargle with salt water, avoid hard foods for 1 week');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (3,3,3,'Ksurgerynee Replacement','2022-03-10','Regional','Physical therapy for 6 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (4,4,4,'Knee Replacement','2022-01-10','General Anesthesia','Physical therapy for 4-6 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (5,5,5,'Cataract Surgery','2022-01-12','Local Anesthesia','Avoid rubbing eyes for 2 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (6,6,1,'Hernia Repair','2022-01-15','General Anesthesia','Rest for 1-2 days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (7,7,2,'Breast Reduction','2022-01-18','General Anesthesia','Avoid lifting heavy objects for 2 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (8,8,3,'Tonsillectomy','2022-01-20','General Anesthesia','Drink plenty of fluids and avoid hard foods');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (9,9,4,'Hip Replacement','2022-01-23','General Anesthesia','Physical therapy for 6-8 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (10,10,5,'Herniated Disc','2022-01-25','General Anesthesia','Rest for 2-3 days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (11,11,1,'Appendectomy','2022-01-28','General Anesthesia','Rest for 1-2 days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (12,12,2,'Rhinoplasty','2022-02-01','Local Anesthesia','Apply ice to reduce swelling');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (13,13,3,'Gallbladder Surgery','2022-02-03','General Anesthesia','No heavy lifting for 1 week');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (14,14,4,'Knee Replacement','2022-02-06','General Anesthesia','Physical therapy for 4-6 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (15,15,5,'Cataract Surgery','2022-02-09','Local Anesthesia','Avoid rubbing eyes for 2 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (16,16,1,'Hernia Repair','2022-02-12','General Anesthesia','Rest for 1-2 days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (17,17,3,'Prostate Surgery','2022-05-20','Spinal anesthesia','Avoid strenuous activity for 3 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (18,18,4,'Kidney Transplant','2022-06-10','General anesthesia','Take immunosuppressants as directed');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (19,19,2,'Spinal Fusion','2022-06-26','Epidural anesthesia','Avoid bending or twisting for 6 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (20,20,1,'Mastectomy','2022-07-05','General anesthesia','Rest for 1 week, avoid lifting anything heavy');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (21,21,2,'Shoulder Surgery','2022-07-17','General anesthesia','Physical therapy for 3 months');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (22,22,4,'Liver Transplant','2022-08-03','General anesthesia','Take immunosuppressants as directed');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (23,23,3,'Cataract Surgery','2022-08-14','Local anesthesia','Avoid rubbing your eye for 24 hours');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (24,24,2,'ACL Reconstruction','2022-09-01','General anesthesia','Physical therapy for 6 months');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (25,25,4,'Lung Surgery','2022-09-15','General anesthesia','No heavy lifting for 4 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (26,26,3,'Dental Implants','2022-10-02','Local anesthesia','Avoid hard, crunchy foods for a few days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (27,27,1,'Colonoscopy','2022-10-11','Sedation','Drink plenty of fluids and avoid hard foods. Rest for 3 days.');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (28,28,2,'Hysterectomy','2022-01-08','Spinal anesthesia','Rest for 1-2 weeks, avoid heavy lifting or strenuous activity');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (29,29,1,'Hernia Repair','2022-01-09','General anesthesia','Rest for 24 hours, avoid strenuous activity for 1 week');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (30,30,4,'Shoulder Surgery','2022-01-10','General anesthesia','Ice and elevate shoulder for 48 hours, physical therapy recommended');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (31,31,5,'Wisdom Teeth Removal','2022-01-11','Local anesthesia','Rest for 24 hours, avoid hard or chewy foods for 1 week');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (32,32,3,'Liver Transplant','2022-01-12','General anesthesia','ICU monitoring for 48-72 hours, then gradual increase in activity');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (33,33,2,'Prostate Surgery','2022-01-13','Spinal anesthesia','Rest for 1-2 weeks, avoid heavy lifting or strenuous activity');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (34,34,1,'Mastectomy','2022-01-14','General anesthesia','Rest for 1-2 weeks, avoid heavy lifting or strenuous activity');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (35,35,11,'ACL Reconstruction','2022-01-15','General anesthesia','Physical therapy for 6-8 weeks, avoid pivoting or twisting');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (36,36,5,'Sinus Surgery','2022-01-13','Local anesthesia','Rest for 5 days. Avoid watching Tv, mobile phones for 2 days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (37,37,2,'Appendectomy','2022-09-05','General anesthesia','Avoid lifting heavy objects for 2 weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (38,38,4,'Knee Replacement','2023-01-10','Epidural anesthesia','Attend physical therapy sessions as scheduled');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (39,39,5,'Cataract surgery','2023-02-21','Local anesthesia','Use eye drops as directed by the Doctor_T');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (40,40,2,'Tonsillectomy','2023-03-06','General anesthesia','Rest for a few days and avoid hard foods');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (41,41,11,'Lumbar fusion','2023-04-15','General anesthesia','Avoid twisting and bending for several weeks');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (42,42,1,'Hernia repair','2023-05-01','General anesthesia','Wear a support garment as directed by the Doctor_T');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (43,43,6,'Heart valve replacement','2023-06-23','General anesthesia','Attend cardiac rehabilitation sessions as scheduled');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (44,44,1,'Appendectomy','2023-07-10','General anesthesia','Take pain medication as directed by the Doctor_T');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (45,45,3,'Gallbladder removal','2023-08-04','General anesthesia','Avoid fatty foods for a few days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (46,46,14,'Carpal tunnel release','2023-09-18','Local anesthesia','Keep hand elevated for several days');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (47,47,5,'Septoplasty','2023-06-01','Local Anesthesia',' Rest for 5-7 days, avoid blowing the nose');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (48,48,6,'Open Heart Surgery','2022-06-15','General Anesthesia','Attend cardiac rehabilitation sessions as scheduled');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (49,49,11,'Arthroscopic Shoulder Surgery','2023-05-05','General Anesthesia','Attend physical therapy sessions as scheduled');
INSERT INTO Surgery_T (SurgeryID, PatientID, DoctorID, SurgeryType, SurgeryDate, AnesthesiaInformation, PostOpCareInstructions) VALUES (50,50,3,'Gallbladder Removal','2022-02-28','General','Light activity for 1 week, no heavy lifting for 2 weeks');



##################################################### All_Queries ###########################################

#Query - 1. Display the average age of the patients
SELECT AVG(TIMESTAMPDIFF(Year, DateofBirth, NOW())) AS AveragePatientAge FROM Patient_T;

#Query - 2. Test Details whose analysed results are yet to arrive
SELECT * FROM LabResult_T
RIGHT JOIN LabTest_T
USING (TestID)
WHERE ResultID IS NULL
ORDER BY TestID;

# 3 Queries using subqueries
#Subquery -3. Find all the surgeries that were performed in a specific department:
SELECT * FROM surgery_t
WHERE DoctorID IN (
    SELECT EmployeeID FROM employee_t
    WHERE DepartmentID = (
        SELECT DepartmentID FROM department_ref_t
        WHERE DepartmentName = 'Cardiology'
    )
);

#SubQuery - 4. Aggregate Fn Used - 4. Find all the employees who make more than the average salary in their department:
SELECT * FROM employee_t
WHERE Salary > (
    SELECT AVG(Salary) FROM employee_t e
    WHERE DepartmentID = e.DepartmentID
);

#SubQuery - 5. Find the number of surgeries performed by each doctor in the Neurology department:
select * from surgery_t;
SELECT DoctorID, COUNT(*) AS num_surgeries
FROM surgery_t
WHERE DoctorID IN (
    SELECT EmployeeID FROM employee_t
    WHERE DepartmentID = (
        SELECT DepartmentID FROM department_ref_t
        WHERE DepartmentName = 'Neurology'
    )
)
GROUP BY DoctorID;




#6 Inner Join Queries
#Query using inner join - Total Amount paid by each customer to the hospital
select concat(u.FirstName,' ',u.LastName) as PatientName, sum(b.TotalCost) as TotalAmountPaid from billing_t b
inner join patient_t p on p.PatientID = b.PatientID
inner join user_t u on p.UserID = u.UserID
group by b.PatientID
order by TotalAmountPaid DESC;

#Query using inner join - medication for the patients with condition
#REQUIRES find_patient_id which is a User Defined Stored Function to find the patient id using DOB and mobile number
drop function IF EXISTS find_patient_id;
delimiter //
create function find_patient_id(
phone_number varchar(16),
dob date
)
returns int
READS SQL DATA
DETERMINISTIC
begin
declare patient_id int;
select p.PatientID into patient_id from patient_t p
inner join user_t u on u.UserID = p.UserID
where u.PhoneNumber = phone_number and p.DateOfBirth=dob;
return (patient_id);
end//
delimiter ;
#Query
select p.MedicationName, p.DosageInstructions, concat(u.FirstName,' ',u.LastName) as PrescriberName, mr.Diagnosis
from prescription_t p
inner join medicalrecord_t mr on p.RecordID = mr.RecordID
inner join doctor_t d on d.DoctorID = p.DoctorID
inner join user_t u on u.UserID = d.UserID
where mr.PatientID = find_patient_id('+1 678-901-2345','2067-09-10');

#Query using inner join  - Display the inventory requests yet to be approved orderd by requested date
SELECT RequestID, InventoryID, QuantityRequested FROM supply_request_t
INNER JOIN Request_Status_REF_T
WHERE  RequestStatusDescription = 'Pending'
ORDER BY DateRequested;

#Query using inner join - Check if the bill generated date for the patients is within the policy coverage dates.
SELECT DISTINCT p.PatientID,i.PolicyStartDate,i.PolicyEndDate
FROM patient_t p
INNER JOIN insurance_t i ON p.PatientID = i.InsuranceID
INNER JOIN billing_t b ON p.PatientID = b.PatientID
WHERE b.BillingDate BETWEEN '2020-01-01' AND '2022-12-31'
AND b.TotalCost > 0
AND i.PolicyStartDate <= b.BillingDate
AND i.PolicyEndDate >= b.BillingDate;

#Query - Using Inner Join - find past lab results for a patient
		## Stored Function 'find_patient_id' is required to execute this
select lt.TestName, concat(u.FirstName,' ',u.LastName) as DoctorName, lt.TestDate, lr.ResultValue from labresult_t lr
inner join labtest_t lt on lr.TestID = lt.TestID
inner join doctor_t d on lt.DoctorID = d.DoctorID
inner join user_t u on u.UserID = d.UserID
where lt.PatientID = find_patient_id('123-456-7890','1980-01-01')
order by lt.TestDate desc;

		#Displays all imaging records for a patient
        ## Stored Function 'find_patient_id' is required to execute this
select i.ImagingType, i.ImagingDate, i.ImagingResults, concat(u.FirstName,' ',u.LastName) as DoctorName from imaging_t i
inner join doctor_t d on i.DoctorID = d.DoctorID
inner join user_t u on u.UserID = d.UserID
where i.PatientID = find_patient_id('123-456-7890','1980-01-01');

#Display the all billing, payment and insurance details of patient based on a patient's mobile number and Date Of Birth
## Stored Function 'find_patient_id' is required to execute this
select concat(u.FirstName, ' ', u.LastName) as PatientName, i.ProviderName, i.PolicyNumber, b.TotalCost, b.BillingDate,
case
	when b.BillingDate > i.PolicyEndDate or b.BillingDate < i.PolicyStartDate
		then 'N'
	else 'Y' end as Covered,
    b.PaymentInformation, i.PolicyStartDate,i.PolicyEndDate
from billing_t b
inner join patient_t p on b.PatientID = p.PatientID
inner join user_t u on u.UserID = p.UserID
inner join insurance_t i on i.PatientID = b.PatientID
where b.PatientID = find_patient_id('+1 678-901-2345','2067-09-10');

# 2 Left Join based queries
#Query - Using Left Join - To see all the patients who have been prescribed medication but have not been billed yet:
SELECT *
FROM prescription_t
LEFT JOIN billing_t
ON prescription_t.RecordID = billing_t.RecordID
WHERE billing_t.RecordID IS NULL;

#Query - Using Left Join - Find all doctors who have not performed any surgeries:
SELECT *
FROM doctor_t d
LEFT OUTER JOIN surgery_t s ON d.doctorID = s.doctorID WHERE s.doctorID IS NULL;

#2 Right Join based queries
#Query - Using Right Join - To see all the surgeries scheduled, including any that do not have a room assigned yet:
SELECT *
FROM surgery_t
RIGHT OUTER JOIN room_t ON surgery_t.SurgeryID = room_t.RoomID;

#Query - Using Right Join - Test Details whose analysed results are yet to arrive
SELECT * FROM LabResult_T
RIGHT JOIN LabTest_T
USING (TestID)
WHERE ResultID IS NULL
ORDER BY TestID;

#Query using Cross Join
#Query - Using Cross Join - Room should have a patient. currently room patientId are empty
select distinct r.RoomID, r.RoomNumber, s.PatientID, s.SurgeryDate from room_t r
cross join surgery_T s
where r.PatientID IS NULL and s.PatientID = find_patient_id('+1 678-901-2345','2067-09-10')
AND OccupancyStatus = 'Available';

############################################# All_Views ##########################################

#A View to hide the personal details of patients when the data is being operated by users like Receptionists
CREATE VIEW patientView AS 
SELECT u.FirstName, u.LastName, p.Gender, p.Address, p.EmergencyContactInformation from patient_t p
inner join user_t u on u.UserId = p.UserId;

Select * from patientview;

#A View consisting of Total Amount Paid by Each Patient along with a Patient Name
CREATE VIEW TotalAmountPaidByEachPatient AS
select concat(u.FirstName,' ',u.LastName) as PatientName, sum(b.TotalCost) as TotalAmountPaid from billing_t b
inner join patient_t p on p.PatientID = b.PatientID
inner join user_t u on p.UserID = u.UserID
group by b.PatientID
order by TotalAmountPaid DESC;

Select * from TotalAmountPaidByEachPatient;

########################################### Stored_Functions ###########################################

#1.Function to find the patient id using DOB and mobile number
drop function IF EXISTS find_patient_id;

delimiter //
create function find_patient_id(
phone_number varchar(16),
dob date
)
returns int
READS SQL DATA
DETERMINISTIC
begin
declare patient_id int;
select p.PatientID into patient_id from patient_t p
inner join user_t u on u.UserID = p.UserID
where u.PhoneNumber = phone_number and p.DateOfBirth=dob;
return (patient_id);
end//

delimiter ;
#Example instancing SF find_patient_id
SELECT find_patient_id('+1 123-456-7890', '1980-01-01') AS PatientID; #1 "John", "Doe"
SELECT find_patient_id('+1 456-789-0123', '1988-08-08') AS PatientID; #4 "Jane", "Parker"


#2. Function for insurances that are expiring within the next 30 days from the current date.
DROP FUNCTION IF EXISTS insurance_expiring_soon;
DELIMITER //
CREATE FUNCTION insurance_expiring_soon(date_param DATE) 
RETURNS INT
Deterministic
BEGIN
DECLARE current_date_var DATE;
SET current_date_var = COALESCE(date_param, CURDATE());
    RETURN (
        SELECT 
            PatientID
        FROM 
            insurance_t
        WHERE 
            PolicyEndDate >= current_date_var
            AND PolicyEndDate <= DATE_ADD(current_date_var, INTERVAL 30 DAY)
    );
END//
DELIMITER ;
#Check for insurance expiring in 30 days on '2023-04-29'
SELECT insurance_expiring_soon('2023-04-29');

#3. Function retrieves the appointment details for a specific patient
DROP FUNCTION IF EXISTS get_appointment_details_for_patient;
DELIMITER //
CREATE FUNCTION get_appointment_details_for_patient(p_patient_id INT)
RETURNS varchar(512)
Deterministic
BEGIN
DECLARE AppointmentTiming_var VARCHAR(512);
SELECT CONCAT(AppointmentDate, ' ', AppointmentTime) INTO AppointmentTiming_var
        FROM Appointment_T
        WHERE PatientID = p_patient_id
        ORDER BY AppointmentDate DESC, AppointmentTime DESC
        LIMIT 1;
    RETURN  AppointmentTiming_var;
END//

DELIMITER ;
#Get the appointment timing for patient with ID 1
SELECT get_appointment_details_for_patient(1);


#4. update_or_insert_inventory_item - To update or insert 
DROP FUNCTION IF EXISTS update_or_insert_inventory_item;
#inventory after checking if that item is existing or not, returns the InventoryID 
DELIMITER //
CREATE FUNCTION update_or_insert_inventory_item(
  p_item_name VARCHAR(50),
  p_item_description VARCHAR(255),
  p_quantity INT,
  p_cost DECIMAL(10, 2),
  p_supplier_information VARCHAR(255)
) RETURNS INT
Reads SQL DATA
deterministic
BEGIN
  DECLARE v_inventory_id INT;
  
  -- check if the item already exists in the inventory table
  SELECT inventoryID INTO v_inventory_id
  FROM inventory_t
  WHERE itemName = p_item_name AND itemDescription = p_item_description;
  
  -- if the item exists, update its quantity and cost
  IF v_inventory_id IS NOT NULL THEN
    UPDATE inventory_t
    SET quantity = quantity + p_quantity, cost = p_cost
    WHERE inventoryID = v_inventory_id;
  -- if the item doesn't exist, insert a new row
  ELSE
    INSERT INTO inventory_t (itemName, itemDescription, quantity, cost, supplierInformation)
    VALUES (p_item_name, p_item_description, p_quantity, p_cost, p_supplier_information);
    SET v_inventory_id = LAST_INSERT_ID();
  END IF;
  
  RETURN v_inventory_id;
END//
DELIMITER ;

#Testing Stored func update_or_insert_inventory_item
select * from inventory_t;
SELECT update_or_insert_inventory_item('Syringes', '20ml, sterile, disposable',
	1000, 0.25, 'ABC Medical Supplies, 123 Main St, Denver USA');
#OLD RECORD
#1	Syringes	5ml, sterile, disposable	500	0.25	ABC Medical Supplies, 123 Main St, Anytown USA



#5. update_inventory_item - check if the item already exists in the inventory table 
# and returns the update status
DROP FUNCTION IF EXISTS update_inventory_item;
DELIMITER //
CREATE FUNCTION update_inventory_item(
  p_inventory_id INT,
  p_quantity INT,
  p_cost DECIMAL(10, 2),
  p_supplier_information VARCHAR(255)
) RETURNS varchar(250)
Reads SQL DATA
deterministic
BEGIN
  -- check if the item already exists in the inventory table
  SELECT COUNT(*) INTO @exists
  FROM inventory_t
  WHERE inventoryID = p_inventory_id;
  
  -- if the item exists, update its quantity, cost, and supplier information
  IF @exists THEN
    UPDATE inventory_t
    SET quantity = p_quantity, cost = p_cost, supplierInformation = p_supplier_information
    WHERE inventoryID = p_inventory_id;
    RETURN 'Updated successfully';
  -- if the item doesn't exist, return 0 to indicate failure
  ELSE
    RETURN 'Update Failed!';
  END IF;
END//
DELIMITER ;

#Testing:
SELECT update_inventory_item(1, 1000, 0.30, 'ABC Medical Supplies, 123 Main St, Denver USA'); #'Updated successfully'
SELECT update_inventory_item(71, 1000, 0.30, 'ABC Medical Supplies, 123 Main St, Denver USA'); #'Update Failed!'



########################################### Stored_Procedures ##########################################
##1st Stored Procedure - Display vacant rooms
DROP PROCEDURE IF EXISTS display_vacant_rooms;

DELIMITER //

CREATE PROCEDURE display_vacant_rooms()
BEGIN
SELECT RoomID FROM Room_T WHERE OccupancyStatus = 'Available';
END//
DELIMITER ;

#Instance of SP to Display vacant rooms
CALL display_vacant_rooms();



## 2nd Stored Procedure to update the inventory requests in supply_requests table 
DROP PROCEDURE IF EXISTS update_inventory_request;

DELIMITER //

CREATE PROCEDURE update_inventory_request(
in_inventoryID INT,
in_employeeID INT,
statusDesc VARCHAR(512)
)
BEGIN
DECLARE statusID INT;
SELECT RequestStatusID INTO statusID FROM request_status_ref_t WHERE RequestStatusDescription = statusDesc;
UPDATE supply_request_t SET RequestStatusID = statusID WHERE InventoryID = in_inventoryID AND EmployeeID = in_employeeID;
END//

DELIMITER ;
#instance of update_inventory_request SP 
#update statusDescription as  'Approved' for inventory request with inventoryID = 2, employeeID = 2  
call update_inventory_request(2,2,'Approved');
SELECT * FROM supply_request_t WHERE inventoryID = 2 AND employeeID = 2  ;


##3rd Stored Procedure - To reschedule appointment
DROP PROCEDURE IF EXISTS reschedule_appointment;

DELIMITER //

CREATE PROCEDURE reschedule_appointment(
newAppointmentDate DATE,
newAppointmentTime TIME,
pat_ID INT,
doc_ID INT
)
BEGIN
UPDATE appointment_t SET AppointmentDate = newAppointmentDate, AppointmentTime = newAppointmentTime
WHERE PatientID = pat_ID AND DoctorID = doc_ID;
END //
DELIMITER ;
#instance of reschedule_appointment SP
#Reschedule the appointment of patient with ID  = 1 with doctor having ID 1 to new 
#Appointment Date and Time '2023-08-01' and '11:00:00' respectively
call reschedule_appointment('2023-08-01','11:00:00',1,1);
SELECT * FROM Appointment_T WHERE PatientID = 1 AND DoctorID = 1;





################################################# All_Trigger #################################################
#drop trigger before_insert_user
#1# A 'Before Insert Trigger' to assign 'UserRole' as 'Patient' if 'UserRole' is not given
DROP TRIGGER IF EXISTS before_insert_user

#create trigger before_insert_user
Delimiter //
CREATE TRIGGER before_insert_user
BEFORE INSERT ON user_t
FOR EACH ROW
BEGIN
  -- Generate a new unique ID for the user
  SET NEW.userID = FLOOR(RAND() * 1000000);

  -- Check if the user role is valid, default to 'Patient' if not specified
  IF NEW.UserRole NOT IN ('Patient', 'Nurse', 'Doctor', 'Admin') THEN
    SET NEW.UserRole = 'Patient';
  END IF;

  -- Encrypt the user password before inserting
  SET NEW.userPassword = MD5(NEW.userPassword);
END //
Delimiter ;
ALTER TABLE user_t MODIFY COLUMN userPassword VARCHAR(100);
#testing trigger
INSERT INTO user_t (username, userPassword, Firstname, Lastname, email, phonenumber, UserRole)
VALUES ('sahanar', 'r', 'Sahana',
 'Ram', 'sr29@gmail.com', '000-000-022', 'Patient');
select * from user_t where username='sahanar';




#2. Trigger to automatically update a patient's EmergencyContactInformation when their EmergencyContactInformation is changed:
DROP TRIGGER IF EXISTS update_emergency_contact;

#Create archive log table
CREATE TABLE IF NOT EXISTS Patient_ArchiveLog_T (
  PatientID int NOT NULL AUTO_INCREMENT,
  UserID int NULL,
  DateofBirth date DEFAULT NULL,
  Gender varchar(12) DEFAULT NULL,
  Address varchar(100) DEFAULT NULL,
  EmergencyContactInformation varchar(100) DEFAULT NULL,
  PRIMARY KEY (PatientID)
) ;

#create trigger update_emergency_contact
DELIMITER //
CREATE TRIGGER update_emergency_contact
AFTER UPDATE ON Patient_T
FOR EACH ROW
BEGIN
    IF NEW.EmergencyContactInformation <> OLD.EmergencyContactInformation THEN
        INSERT INTO Patient_ArchiveLog_T (PatientID, EmergencyContactInformation) VALUES (OLD.PatientID, OLD.EmergencyContactInformation);
    END IF;
END; //
DELIMITER ;

#Testing trigger update_emergency_contact
#Let's register a new patient details into system
INSERT INTO Patient_T (PatientID, UserID, EmergencyContactInformation)
VALUES (101, 1, 'John Smith - 555-1234');
#See the inserted patientID along with the emergency infromation before updating the emergency infromation
SELECT PatientID, EmergencyContactInformation FROM Patient_T WHERE PatientID = 101;
#updating emergency contact
UPDATE Patient_T
SET EmergencyContactInformation = 'Jane Doe - 555-5678'
WHERE PatientID = 101;
#See the data of the patient in the patient records after updating
SELECT PatientID, EmergencyContactInformation FROM Patient_T WHERE PatientID = 101;
#See the inserted patientID along with the emergency infromation after updating the emergency infromation
SELECT PatientID, EmergencyContactInformation FROM Patient_ArchiveLog_T WHERE PatientID = 101;




#3. Storing the supply request before deleting them
DROP TRIGGER IF EXISTS archive_inventory_requests_deleted;
#Create archive log table
CREATE TABLE IF NOT EXISTS Supply_Request_ArchiveLog_T (
  RequestID int NOT NULL AUTO_INCREMENT,
  InventoryID int NULL,
  EmployeeID int NULL,
  QuantityRequested int NULL,
  DateRequested date NULL,
  RequestStatusID int NULL,
  PRIMARY KEY (RequestID)
) ;


DELIMITER //
CREATE TRIGGER archive_inventory_requests_deleted
BEFORE DELETE ON supply_request_t
FOR EACH ROW
BEGIN
	INSERT INTO Supply_Request_ArchiveLog_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) VALUES
	(OLD.RequestID, OLD.InventoryID, OLD.EmployeeID, OLD.QuantityRequested, OLD.DateRequested, OLD.RequestStatusID);
END //
DELIMITER ;
#Testing Trigger archive_inventory_requests_deleted
#Inserting a supply request
INSERT INTO Supply_Request_T (RequestID, InventoryID, EmployeeID, QuantityRequested, DateRequested, RequestStatusID) 
VALUES (1101,1,1,500,'2023-02-09',1);
#Delete the inserted supply request
DELETE FROM Supply_Request_T WHERE RequestID = 1101;
#After deleting the specific supply requestCheck  with RequestID = 1101, check if the  Supply_Request_ArchiveLog_T that supply request
SELECT * FROM Supply_Request_ArchiveLog_T WHERE RequestID = 1101;




######################################## ######################################## ######################################## ############################
######################################## An experimental part - Not completely working as of now #########################################
######################################## ######################################## ######################################## ############################


#Stored Procedure - 4. A combination of Stored Procedure and Trigger - process_supply_request - for handling supply request

##############  REQUIREMENTS for this NEW PROCEDURE  #########
# RUN THE ALTER SCRIPT
alter table supply_request_t add requestFlagCod varchar(20);

#go to Edit > Preferences > SQL editor > scroll down > uncheck the safe option
#restart the mysql editor


#RUN THIS UPDATE
##simple update query to update flagcod in supply_request table based on statusID 

Update supply_request_t sup
join request_status_ref_t req
on sup.RequestStatusID = req.RequestStatusID
SET sup.requestFlagCod = req.RequestStatusDescription
where sup.requestFlagCod is null;


##CREATE INVENTORY LOG TABLE
CREATE TABLE `inventory_log_details` (
  `employeeID` int DEFAULT NULL,
  `shift_start_time` datetime DEFAULT NULL,
  `shift_end_time` datetime DEFAULT NULL
)

############### Continue to Create Procedure which is combined with a trigger in a single delimiter block ##############
DELIMITER //

CREATE PROCEDURE process_supply_request(in p_request_id INT, out p_result varchar(100))
BEGIN
  DECLARE v_inventory_id INT;
  DECLARE v_employee_id INT;
  DECLARE v_quantity_requested INT;
  DECLARE v_inventory_quantity INT;
  DECLARE v_inventory_cost DECIMAL(10, 2);
  DECLARE v_request_status VARCHAR(20);

  -- get the inventory ID, employee ID, quantity requested, and request status for the given request ID
  SELECT inventoryID, employeeID, quantityRequested, requestFlagCod
  INTO v_inventory_id, v_employee_id, v_quantity_requested, v_request_status
  FROM supply_request_t
  WHERE request_ID = p_request_id;

  -- if the request status is not "Pending", do nothing
  IF v_request_status <> 'Pending' THEN
	SET p_result = 'No Changes Made!!';
  END IF;

  -- get the current inventory quantity and cost for the given inventory ID
  SELECT quantity, cost INTO v_inventory_quantity, v_inventory_cost
  FROM inventory_t
  WHERE inventoryID = v_inventory_id;

  -- if there is not enough inventory, set the request status to "Denied" and return
  IF v_quantity_requested > v_inventory_quantity THEN
    UPDATE supply_request_t
    SET requestFlagCod = 'Denied'
    WHERE requestID = p_request_id;
     SET p_result = 'Status Denied updated!';
  END IF;

  -- update the inventory quantity and cost, and set the request status to "Approved"
  UPDATE inventory_t
  SET quantity = quantity - v_quantity_requested,
  cost = v_inventory_cost * (1 - v_quantity_requested / v_inventory_quantity)
  WHERE inventoryID = v_inventory_id;


  -- insert a new row into the shift table for the employee who requested the supply
  INSERT INTO inventory_log_details (employeeID, shift_start_time, shift_end_time)
  VALUES (v_employee_id, NOW(), NOW() + INTERVAL 8 HOUR);
  
  SET p_result = 'Inventory updated and shift added.';
  
END //
#drop trigger supply_request_after_update;
CREATE TRIGGER supply_request_after_update
AFTER UPDATE ON supply_request_t
FOR EACH ROW
BEGIN
  -- if the request status has been changed to "Approved", call the process_supply_request stored procedure
   IF OLD.requestFlagCod <> NEW.requestFlagCod THEN
    CALL process_supply_request(NEW.requestID);
  END IF;
END //

DELIMITER ;



####################### Foreign Key Issues while deleting a patient record

CREATE TABLE IF NOT EXISTS Patient_Details_LogArchive_T (
	  PatientID int NOT NULL AUTO_INCREMENT,
	  UserID int NOT NULL,
	  DateofBirth date DEFAULT NULL,
	  Gender varchar(12) DEFAULT NULL,
	  Address varchar(100) DEFAULT NULL,
	  EmergencyContactInformation varchar(100) DEFAULT NULL,
	  PRIMARY KEY (PatientID)
    );
   
DROP TRIGGER IF EXISTS store_patient_details;

DELIMITER //
CREATE TRIGGER store_patient_details
BEFORE UPDATE ON Patient_T
FOR EACH ROW
BEGIN
    INSERT INTO Patient_Details_LogArchive_T (PatientID, UserID, DateofBirth, Gender, Address, EmergencyContactInformation)
    VALUES (OLD.PatientID, OLD.UserID, OLD.DateofBirth, OLD.Gender, OLD.Address, OLD.EmergencyContactInformation);
END; //
DELIMITER ;
#Testing
#we need patient_table_backup to be created
DELETE FROM Patient_T WHERE PatientID = 1;