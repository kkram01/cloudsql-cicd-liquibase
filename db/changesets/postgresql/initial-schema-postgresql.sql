--liquibase formatted sql

--changeset company:InitialSchemaCreation runOnChange:false splitStatements:true Comment:Adding Initial Schema Description:A Description
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

CREATE TABLE COUNTRIES
   (
		COUNTRY VARCHAR(26) NOT NULL CONSTRAINT COUNTRIES_UNQ_NM Unique,
		COUNTRY_ISO_CODE CHAR(2) NOT NULL CONSTRAINT COUNTRIES_PK PRIMARY KEY,
		REGION VARCHAR(26),
		CONSTRAINT COUNTRIES_UC CHECK (country_ISO_code = upper(country_ISO_code) )
   );

CREATE TABLE DEPARTMENT(
   ID INT PRIMARY KEY      NOT NULL,
   DEPT           CHAR(50) NOT NULL,
   EMP_ID         INT      NOT NULL
);
--rollback DROP TABLE COMPANY, COUNTRIES, DEPARTMENT;