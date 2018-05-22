#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Adresse Domiciliataire
#------------------------------------------------------------

CREATE TABLE Adresse_Domiciliataire(
        id_domiciliataire Int  Auto_increment  NOT NULL ,
        title_d           Varchar (50) NOT NULL ,
        address_d         Varchar (50) NOT NULL ,
        address2_d        Varchar (50) NOT NULL ,
        Country_d         Varchar (25) NOT NULL ,
        city_d            Varchar (50) NOT NULL ,
        Code_Postal       Int NOT NULL ,
        siret             Int NOT NULL ,
        code_naf          Varchar (10) NOT NULL ,
        code_ape          Varchar (10) NOT NULL ,
        numero_tel        Int NOT NULL
	,CONSTRAINT Adresse_Domiciliataire_PK PRIMARY KEY (id_domiciliataire)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Customer Address
#------------------------------------------------------------

CREATE TABLE Customer_Address(
        id_customer_address Int  Auto_increment  NOT NULL ,
        address_c           Varchar (50) NOT NULL ,
        address2_c          Varchar (50) NOT NULL ,
        country_c           Varchar (25) NOT NULL ,
        city_c              Varchar (50) NOT NULL ,
        code_postal_c       Int NOT NULL ,
        active_adress       Bool NOT NULL
	,CONSTRAINT Customer_Address_PK PRIMARY KEY (id_customer_address)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Shipper Address
#------------------------------------------------------------

CREATE TABLE Shipper_Address(
        id_shipper_address Int  Auto_increment  NOT NULL ,
        title_shipper      Varchar (25) NOT NULL ,
        address_s          Varchar (50) NOT NULL ,
        address2_s         Varchar (50) NOT NULL ,
        country_s          Varchar (25) NOT NULL ,
        city_s             Varchar (50) NOT NULL ,
        code_postal_s      Int NOT NULL
	,CONSTRAINT Shipper_Address_PK PRIMARY KEY (id_shipper_address)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Bank
#------------------------------------------------------------

CREATE TABLE Bank(
        id_bank   Int  Auto_increment  NOT NULL ,
        name_bank Varchar (25) NOT NULL
	,CONSTRAINT Bank_PK PRIMARY KEY (id_bank)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: prospect
#------------------------------------------------------------

CREATE TABLE prospect(
        id_prospect             Int  Auto_increment  NOT NULL ,
        first_name_p            Varchar (50) ,
        last_name_p             Varchar (50) ,
        birthday_P              Date ,
        phone_number_fixe_P     Int ,
        phone_number_portable_P Int ,
        email_P                 Varchar (30) ,
        address_p               Varchar (50) NOT NULL ,
        address2_P              Varchar (50) NOT NULL ,
        country_P               Varchar (25) NOT NULL ,
        city_P                  Varchar (50) NOT NULL ,
        type_entity_p           Varchar (15) NOT NULL ,
        id_domiciliataire       Int NOT NULL
	,CONSTRAINT prospect_PK PRIMARY KEY (id_prospect)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Mail Option
#------------------------------------------------------------

CREATE TABLE Mail_Option(
        id_mail     Int  Auto_increment  NOT NULL ,
        option_mail Varchar (20) NOT NULL ,
        prix_mail   Float NOT NULL
	,CONSTRAINT Mail_Option_PK PRIMARY KEY (id_mail)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Scan Option
#------------------------------------------------------------

CREATE TABLE Scan_Option(
        id_scan     Int  Auto_increment  NOT NULL ,
        option_scan Varchar (20) NOT NULL ,
        prix_scan   Float NOT NULL
	,CONSTRAINT Scan_Option_PK PRIMARY KEY (id_scan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type Payment
#------------------------------------------------------------

CREATE TABLE Type_Payment(
        id_type_payment Int  Auto_increment  NOT NULL ,
        type_payment    Varchar (15) NOT NULL
	,CONSTRAINT Type_Payment_PK PRIMARY KEY (id_type_payment)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Customer
#------------------------------------------------------------

CREATE TABLE Customer(
        id_customer             Int  Auto_increment  NOT NULL ,
        first_name              Varchar (50) NOT NULL ,
        last_name               Varchar (50) NOT NULL ,
        birthday                Date NOT NULL ,
        created_at              Date NOT NULL ,
        update_at               Date ,
        phone_number_fixe       Int ,
        phone_number_portable   Int NOT NULL ,
        subscribe_to_newsletter Bool NOT NULL ,
        email                   Varchar (30) NOT NULL ,
        id_customer_address     Int NOT NULL ,
        id_customer_admin       Int
	,CONSTRAINT Customer_PK PRIMARY KEY (id_customer)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type Entity
#------------------------------------------------------------

CREATE TABLE Type_Entity(
        id_entity   Int  Auto_increment  NOT NULL ,
        type_entity Varchar (25) ,
        id_customer Int NOT NULL
	,CONSTRAINT Type_Entity_PK PRIMARY KEY (id_entity)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contrat
#------------------------------------------------------------

CREATE TABLE Contrat(
        id_contrat         Int  Auto_increment  NOT NULL ,
        start_date_contrat Date ,
        end_date_contrat   Date ,
        price_contrat      Float NOT NULL ,
        enable_c           Bool NOT NULL ,
        id_customer_option Int NOT NULL
	,CONSTRAINT Contrat_PK PRIMARY KEY (id_contrat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Customer Admin
#------------------------------------------------------------

CREATE TABLE Customer_Admin(
        id_customer_admin        Int  Auto_increment  NOT NULL ,
        enable                   Bool NOT NULL ,
        login                    Varchar (25) NOT NULL ,
        email_verification_token Varchar (25) NOT NULL ,
        verified_at              Date NOT NULL ,
        expired_at               Date NOT NULL ,
        password                 Varchar (30) NOT NULL ,
        password_reset_token     Varchar (30) NOT NULL ,
        password_requested_at    Date NOT NULL ,
        last_connection          Date NOT NULL ,
        id_customer              Int NOT NULL
	,CONSTRAINT Customer_Admin_PK PRIMARY KEY (id_customer_admin)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Production
#------------------------------------------------------------

CREATE TABLE Production(
        id_production      Int  Auto_increment  NOT NULL ,
        date_receipt       Date NOT NULL ,
        date_processing    Date NOT NULL ,
        format             Varchar (20) NOT NULL ,
        poids              Float NOT NULL ,
        nb_pages           Int NOT NULL ,
        option_scan        Varchar (20) NOT NULL ,
        option_mail        Varchar (20) NOT NULL ,
        option_delete      Varchar (20) NOT NULL ,
        id_customer        Int NOT NULL ,
        id_shipper_address Int NOT NULL
	,CONSTRAINT Production_PK PRIMARY KEY (id_production)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Payment
#------------------------------------------------------------

CREATE TABLE Payment(
        id_payment      Int  Auto_increment  NOT NULL ,
        date_payment    Date NOT NULL ,
        num_transaction Int NOT NULL ,
        amount          Float NOT NULL ,
        id_bank         Int NOT NULL ,
        id_customer     Int NOT NULL ,
        id_type_payment Int NOT NULL
	,CONSTRAINT Payment_PK PRIMARY KEY (id_payment)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Invoices
#------------------------------------------------------------

CREATE TABLE Invoices(
        id_invoices   Int  Auto_increment  NOT NULL ,
        date_invoices Date NOT NULL ,
        sum           Float NOT NULL ,
        pdf_invoice   Numeric NOT NULL ,
        debit         Float NOT NULL ,
        id_contrat    Int NOT NULL
	,CONSTRAINT Invoices_PK PRIMARY KEY (id_invoices)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Typical Offer
#------------------------------------------------------------

CREATE TABLE Typical_Offer(
        id_offer          Int  Auto_increment  NOT NULL ,
        price_offer       Float NOT NULL ,
        id_domiciliataire Int NOT NULL ,
        id_entity         Int NOT NULL
	,CONSTRAINT Typical_Offer_PK PRIMARY KEY (id_offer)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Customer Option
#------------------------------------------------------------

CREATE TABLE Customer_Option(
        id_customer_option    Int  Auto_increment  NOT NULL ,
        price_customer_option Float NOT NULL ,
        to_date               Date NOT NULL ,
        id_entity             Int NOT NULL ,
        id_mail               Int NOT NULL ,
        id_scan               Int NOT NULL ,
        id_customer           Int NOT NULL ,
        id_domiciliataire     Int NOT NULL
	,CONSTRAINT Customer_Option_PK PRIMARY KEY (id_customer_option)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Historic Connexion
#------------------------------------------------------------

CREATE TABLE Historic_Connexion(
        id_connexion      Int  Auto_increment  NOT NULL ,
        date_connexion    Date NOT NULL ,
        id_customer_admin Int NOT NULL
	,CONSTRAINT Historic_Connexion_PK PRIMARY KEY (id_connexion)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Invoice_line
#------------------------------------------------------------

CREATE TABLE Invoice_line(
        id_line       Int  Auto_increment  NOT NULL ,
        id_production Int NOT NULL
	,CONSTRAINT Invoice_line_PK PRIMARY KEY (id_line)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: subscribe
#------------------------------------------------------------

CREATE TABLE subscribe(
        id_customer Int NOT NULL ,
        id_contrat  Int NOT NULL
	,CONSTRAINT subscribe_PK PRIMARY KEY (id_customer,id_contrat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMPOSED
#------------------------------------------------------------

CREATE TABLE COMPOSED(
        id_payment  Int NOT NULL ,
        id_invoices Int NOT NULL
	,CONSTRAINT COMPOSED_PK PRIMARY KEY (id_payment,id_invoices)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: comprised
#------------------------------------------------------------

CREATE TABLE comprised(
        id_line     Int NOT NULL ,
        id_invoices Int NOT NULL
	,CONSTRAINT comprised_PK PRIMARY KEY (id_line,id_invoices)
)ENGINE=InnoDB;




ALTER TABLE prospect
	ADD CONSTRAINT prospect_Adresse_Domiciliataire0_FK
	FOREIGN KEY (id_domiciliataire)
	REFERENCES Adresse_Domiciliataire(id_domiciliataire);

ALTER TABLE Customer
	ADD CONSTRAINT Customer_Customer_Address0_FK
	FOREIGN KEY (id_customer_address)
	REFERENCES Customer_Address(id_customer_address);

ALTER TABLE Customer
	ADD CONSTRAINT Customer_Customer_Admin1_FK
	FOREIGN KEY (id_customer_admin)
	REFERENCES Customer_Admin(id_customer_admin);

ALTER TABLE Customer 
	ADD CONSTRAINT Customer_Customer_Admin0_AK 
	UNIQUE (id_customer_admin);

ALTER TABLE Type_Entity
	ADD CONSTRAINT Type_Entity_Customer0_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE Contrat
	ADD CONSTRAINT Contrat_Customer_Option0_FK
	FOREIGN KEY (id_customer_option)
	REFERENCES Customer_Option(id_customer_option);

ALTER TABLE Customer_Admin
	ADD CONSTRAINT Customer_Admin_Customer0_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE Customer_Admin 
	ADD CONSTRAINT Customer_Admin_Customer0_AK 
	UNIQUE (id_customer);

ALTER TABLE Production
	ADD CONSTRAINT Production_Customer0_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE Production
	ADD CONSTRAINT Production_Shipper_Address1_FK
	FOREIGN KEY (id_shipper_address)
	REFERENCES Shipper_Address(id_shipper_address);

ALTER TABLE Payment
	ADD CONSTRAINT Payment_Bank0_FK
	FOREIGN KEY (id_bank)
	REFERENCES Bank(id_bank);

ALTER TABLE Payment
	ADD CONSTRAINT Payment_Customer1_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE Payment
	ADD CONSTRAINT Payment_Type_Payment2_FK
	FOREIGN KEY (id_type_payment)
	REFERENCES Type_Payment(id_type_payment);

ALTER TABLE Invoices
	ADD CONSTRAINT Invoices_Contrat0_FK
	FOREIGN KEY (id_contrat)
	REFERENCES Contrat(id_contrat);

ALTER TABLE Typical_Offer
	ADD CONSTRAINT Typical_Offer_Adresse_Domiciliataire0_FK
	FOREIGN KEY (id_domiciliataire)
	REFERENCES Adresse_Domiciliataire(id_domiciliataire);

ALTER TABLE Typical_Offer
	ADD CONSTRAINT Typical_Offer_Type_Entity1_FK
	FOREIGN KEY (id_entity)
	REFERENCES Type_Entity(id_entity);

ALTER TABLE Customer_Option
	ADD CONSTRAINT Customer_Option_Type_Entity0_FK
	FOREIGN KEY (id_entity)
	REFERENCES Type_Entity(id_entity);

ALTER TABLE Customer_Option
	ADD CONSTRAINT Customer_Option_Mail_Option1_FK
	FOREIGN KEY (id_mail)
	REFERENCES Mail_Option(id_mail);

ALTER TABLE Customer_Option
	ADD CONSTRAINT Customer_Option_Scan_Option2_FK
	FOREIGN KEY (id_scan)
	REFERENCES Scan_Option(id_scan);

ALTER TABLE Customer_Option
	ADD CONSTRAINT Customer_Option_Customer3_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE Customer_Option
	ADD CONSTRAINT Customer_Option_Adresse_Domiciliataire4_FK
	FOREIGN KEY (id_domiciliataire)
	REFERENCES Adresse_Domiciliataire(id_domiciliataire);

ALTER TABLE Historic_Connexion
	ADD CONSTRAINT Historic_Connexion_Customer_Admin0_FK
	FOREIGN KEY (id_customer_admin)
	REFERENCES Customer_Admin(id_customer_admin);

ALTER TABLE Invoice_line
	ADD CONSTRAINT Invoice_line_Production0_FK
	FOREIGN KEY (id_production)
	REFERENCES Production(id_production);

ALTER TABLE subscribe
	ADD CONSTRAINT subscribe_Customer0_FK
	FOREIGN KEY (id_customer)
	REFERENCES Customer(id_customer);

ALTER TABLE subscribe
	ADD CONSTRAINT subscribe_Contrat1_FK
	FOREIGN KEY (id_contrat)
	REFERENCES Contrat(id_contrat);

ALTER TABLE COMPOSED
	ADD CONSTRAINT COMPOSED_Payment0_FK
	FOREIGN KEY (id_payment)
	REFERENCES Payment(id_payment);

ALTER TABLE COMPOSED
	ADD CONSTRAINT COMPOSED_Invoices1_FK
	FOREIGN KEY (id_invoices)
	REFERENCES Invoices(id_invoices);

ALTER TABLE comprised
	ADD CONSTRAINT comprised_Invoice_line0_FK
	FOREIGN KEY (id_line)
	REFERENCES Invoice_line(id_line);

ALTER TABLE comprised
	ADD CONSTRAINT comprised_Invoices1_FK
	FOREIGN KEY (id_invoices)
	REFERENCES Invoices(id_invoices);
