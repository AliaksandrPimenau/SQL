set feedback off
set define off
drop table COUNTRIES cascade constraints;
drop table JOBS cascade constraints;
drop table DEPARTMENTS cascade constraints;
drop table EMPLOYEES cascade constraints;
drop table JOB_HISTORY cascade constraints;

create table COUNTRIES (
  COUNTRY_ID   CHAR(2),
  COUNTRY_NAME VARCHAR2(40),
  constraint COUNTRY_C_ID_PK primary key (COUNTRY_ID)
);
alter table COUNTRIES add constraint COUNTRY_ID_NN check ("COUNTRY_ID" IS NOT NULL);

create table JOBS (
  JOB_ID     VARCHAR2(10) not null,
  JOB_TITLE  VARCHAR2(35),
  MIN_SALARY NUMBER(6),
  MAX_SALARY NUMBER(6)
);
alter table JOBS add constraint JOB_ID_PK primary key (JOB_ID);
alter table JOBS add constraint JOB_TITLE_NN check ("JOB_TITLE" IS NOT NULL);

create table DEPARTMENTS (
  DEPARTMENT_ID   NUMBER(4) not null,
  DEPARTMENT_NAME VARCHAR2(30),
  MANAGER_ID      NUMBER(6),
  COUNTRY_ID   CHAR(2)
);
alter table DEPARTMENTS add constraint DEPT_ID_PK primary key (DEPARTMENT_ID);
alter table DEPARTMENTS add constraint DEPT_NAME_NN check ("DEPARTMENT_NAME" IS NOT NULL);

create table EMPLOYEES (
  EMPLOYEE_ID    NUMBER(6) not null,
  FIRST_NAME     VARCHAR2(20),
  LAST_NAME      VARCHAR2(25),
  EMAIL          VARCHAR2(25),
  PHONE_NUMBER   VARCHAR2(20),
  HIRE_DATE      DATE,
  JOB_ID         VARCHAR2(10),
  SALARY         NUMBER(8,2),
  COMMISSION_PCT NUMBER(2,2),
  MANAGER_ID     NUMBER(6),
  DEPARTMENT_ID  NUMBER(4)
);
alter table EMPLOYEES add constraint EMP_EMP_ID_PK primary key (EMPLOYEE_ID);
alter table EMPLOYEES add constraint EMP_EMAIL_UK unique (EMAIL);
alter table EMPLOYEES add constraint EMP_DEPT_FK foreign key (DEPARTMENT_ID) references DEPARTMENTS (DEPARTMENT_ID);
alter table EMPLOYEES add constraint EMP_JOB_FK foreign key (JOB_ID) references JOBS (JOB_ID);
alter table EMPLOYEES add constraint EMP_EMAIL_NN check ("EMAIL" IS NOT NULL);
alter table EMPLOYEES add constraint EMP_HIRE_DATE_NN check ("HIRE_DATE" IS NOT NULL);
alter table EMPLOYEES add constraint EMP_JOB_NN check ("JOB_ID" IS NOT NULL);
alter table EMPLOYEES add constraint EMP_LAST_NAME_NN check ("LAST_NAME" IS NOT NULL);
alter table EMPLOYEES add constraint EMP_SALARY_MIN check (salary > 0);
create index EMP_DEPARTMENT_IX on EMPLOYEES (DEPARTMENT_ID);
create index EMP_JOB_IX on EMPLOYEES (JOB_ID);
create index EMP_MANAGER_IX on EMPLOYEES (MANAGER_ID);
create index EMP_NAME_IX on EMPLOYEES (LAST_NAME, FIRST_NAME);

create table JOB_HISTORY (
  EMPLOYEE_ID   NUMBER(6),
  START_DATE    DATE,
  END_DATE      DATE,
  JOB_ID        VARCHAR2(10),
  DEPARTMENT_ID NUMBER(4)
);
alter table JOB_HISTORY add constraint JHIST_EMP_ID_ST_DATE_PK primary key (EMPLOYEE_ID, START_DATE);
alter table JOB_HISTORY add constraint JHIST_DEPT_FK foreign key (DEPARTMENT_ID) references DEPARTMENTS (DEPARTMENT_ID);
alter table JOB_HISTORY add constraint JHIST_EMP_FK foreign key (EMPLOYEE_ID) references EMPLOYEES (EMPLOYEE_ID);
alter table JOB_HISTORY add constraint JHIST_JOB_FK foreign key (JOB_ID) references JOBS (JOB_ID);
alter table JOB_HISTORY add constraint JHIST_DATE_INTERVAL check (end_date > start_date);
alter table JOB_HISTORY add constraint JHIST_EMPLOYEE_NN check ("EMPLOYEE_ID" IS NOT NULL);
alter table JOB_HISTORY add constraint JHIST_END_DATE_NN check ("END_DATE" IS NOT NULL);
alter table JOB_HISTORY add constraint JHIST_JOB_NN check ("JOB_ID" IS NOT NULL);
alter table JOB_HISTORY add constraint JHIST_START_DATE_NN check ("START_DATE" IS NOT NULL);
create index JHIST_DEPARTMENT_IX on JOB_HISTORY (DEPARTMENT_ID);
create index JHIST_EMPLOYEE_IX on JOB_HISTORY (EMPLOYEE_ID);
create index JHIST_JOB_IX on JOB_HISTORY (JOB_ID);

insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AF', 'Afghanistan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AX', '?land Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AL', 'Albania');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DZ', 'Algeria');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AS', 'American Samoa');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AD', 'Andorra');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AO', 'Angola');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AI', 'Anguilla');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AQ', 'Antarctica');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AG', 'Antigua and Barbuda');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AR', 'Argentina');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AM', 'Armenia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AW', 'Aruba');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AU', 'Australia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AT', 'Austria');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AZ', 'Azerbaijan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BS', 'Bahamas');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BH', 'Bahrain');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BD', 'Bangladesh');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BB', 'Barbados');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BY', 'Belarus');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BE', 'Belgium');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BZ', 'Belize');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BJ', 'Benin');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BM', 'Bermuda');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BT', 'Bhutan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BO', 'Bolivia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BA', 'Bosnia and Herzegovina');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BW', 'Botswana');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BV', 'Bouvet Island');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BR', 'Brazil');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IO', 'British Indian Ocean Territory');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BN', 'Brunei Darussalam');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BG', 'Bulgaria');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BF', 'Burkina Faso');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('BI', 'Burundi');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KH', 'Cambodia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CM', 'Cameroon');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CA', 'Canada');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CV', 'Cape Verde');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KY', 'Cayman Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CF', 'Central African Republic');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TD', 'Chad');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CL', 'Chile');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CN', 'China');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CX', 'Christmas Island');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CC', 'Cocos (Keeling) Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CO', 'Colombia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KM', 'Comoros');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CG', 'Congo');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CD', 'Congo');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CK', 'Cook Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CR', 'Costa Rica');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CI', 'Cote Divoire');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HR', 'Croatia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CU', 'Cuba');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CY', 'Cyprus');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CZ', 'Czech Republic');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DK', 'Denmark');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DJ', 'Djibouti');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DM', 'Dominica');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DO', 'Dominican Republic');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('EC', 'Ecuador');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('EG', 'Egypt');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SV', 'El Salvador');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GQ', 'Equatorial Guinea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ER', 'Eritrea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('EE', 'Estonia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ET', 'Ethiopia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FK', 'Falkland Islands (Malvinas)');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FO', 'Faroe Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FJ', 'Fiji');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FI', 'Finland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FR', 'France');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GF', 'French Guiana');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PF', 'French Polynesia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TF', 'French Southern Territories');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GA', 'Gabon');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GM', 'Gambia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GE', 'Georgia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('DE', 'Germany');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GH', 'Ghana');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GI', 'Gibraltar');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GR', 'Greece');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GL', 'Greenland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GD', 'Grenada');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GP', 'Guadeloupe');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GU', 'Guam');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GT', 'Guatemala');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GG', 'Guernsey');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GN', 'Guinea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GW', 'Guinea-bissau');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GY', 'Guyana');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HT', 'Haiti');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HM', 'Heard Island & Mcdonald Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VA', 'Holy See (Vatican City State)');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HN', 'Honduras');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HK', 'Hong Kong');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('HU', 'Hungary');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IS', 'Iceland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IN', 'India');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ID', 'Indonesia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IR', 'Iran');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IQ', 'Iraq');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IE', 'Ireland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IM', 'Isle of Man');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IL', 'Israel');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('IT', 'Italy');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('JM', 'Jamaica');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('JP', 'Japan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('JE', 'Jersey');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('JO', 'Jordan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KZ', 'Kazakhstan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KE', 'Kenya');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KI', 'Kiribati');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KP', 'Korea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KR', 'Korea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KW', 'Kuwait');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KG', 'Kyrgyzstan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LA', 'Lao People Democratic Republic');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LV', 'Latvia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LB', 'Lebanon');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LS', 'Lesotho');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LR', 'Liberia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LY', 'Libyan Arab Jamahiriya');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LI', 'Liechtenstein');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LT', 'Lithuania');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LU', 'Luxembourg');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MO', 'Macao');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MK', 'Macedonia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MG', 'Madagascar');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MW', 'Malawi');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MY', 'Malaysia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MV', 'Maldives');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ML', 'Mali');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MT', 'Malta');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MH', 'Marshall Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MQ', 'Martinique');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MR', 'Mauritania');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MU', 'Mauritius');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('YT', 'Mayotte');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MX', 'Mexico');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('FM', 'Micronesia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MD', 'Moldova');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MC', 'Monaco');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MN', 'Mongolia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ME', 'Montenegro');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MS', 'Montserrat');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MA', 'Morocco');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MZ', 'Mozambique');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MM', 'Myanmar');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NA', 'Namibia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NR', 'Nauru');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NP', 'Nepal');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NL', 'Netherlands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AN', 'Netherlands Antilles');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NC', 'New Caledonia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NZ', 'New Zealand');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NI', 'Nicaragua');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NE', 'Niger');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NG', 'Nigeria');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NU', 'Niue');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NF', 'Norfolk Island');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('MP', 'Northern Mariana Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('NO', 'Norway');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('OM', 'Oman');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PK', 'Pakistan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PW', 'Palau');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PS', 'Palestinian Territory');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PA', 'Panama');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PG', 'Papua New Guinea');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PY', 'Paraguay');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PE', 'Peru');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PH', 'Philippines');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PN', 'Pitcairn');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PL', 'Poland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PT', 'Portugal');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PR', 'Puerto Rico');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('QA', 'Qatar');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('RE', 'Reunion');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('RO', 'Romania');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('RU', 'Russian Federation');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('RW', 'Rwanda');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SH', 'Saint Helena');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('KN', 'Saint Kitts and Nevis');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LC', 'Saint Lucia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('PM', 'Saint Pierre and Miquelon');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VC', 'Saint Vincent and The Grenadines');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('WS', 'Samoa');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SM', 'San Marino');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ST', 'Sao Tome and Principe');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SA', 'Saudi Arabia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SN', 'Senegal');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('RS', 'Serbia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SC', 'Seychelles');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SL', 'Sierra Leone');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SG', 'Singapore');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SK', 'Slovakia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SI', 'Slovenia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SB', 'Solomon Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SO', 'Somalia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ZA', 'South Africa');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GS', 'South Georgia...');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ES', 'Spain');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('LK', 'Sri Lanka');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SD', 'Sudan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SR', 'Suriname');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SJ', 'Svalbard and Jan Mayen');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SZ', 'Swaziland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SE', 'Sweden');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('CH', 'Switzerland');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('SY', 'Syrian Arab Republic');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TW', 'Taiwan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TJ', 'Tajikistan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TZ', 'Tanzania');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TH', 'Thailand');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TL', 'Timor-leste');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TG', 'Togo');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TK', 'Tokelau');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TO', 'Tonga');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TT', 'Trinidad and Tobago');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TN', 'Tunisia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TR', 'Turkey');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TM', 'Turkmenistan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TC', 'Turks and Caicos Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('TV', 'Tuvalu');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('UG', 'Uganda');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('UA', 'Ukraine');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('AE', 'United Arab Emirates');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('GB', 'United Kingdom');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('US', 'United States');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('UM', 'United States Minor Outlying Islands');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('UY', 'Uruguay');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('UZ', 'Uzbekistan');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VU', 'Vanuatu');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VE', 'Venezuela');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VN', 'Viet Nam');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VG', 'Virgin Islands (British)');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('VI', 'Virgin Islands (US)');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('WF', 'Wallis and Futuna');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('EH', 'Western Sahara');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('YE', 'Yemen');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ZM', 'Zambia');
insert into COUNTRIES (COUNTRY_ID, COUNTRY_NAME) values ('ZW', 'Zimbabwe');
commit;

insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('AD_PRES', 'President', 20000, 40000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('AD_VP', 'Administration Vice President', 15000, 30000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('AD_ASST', 'Administration Assistant', 3000, 6000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('FI_MGR', 'Finance Manager', 8200, 16000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('FI_ACCOUNT', 'Accountant', 4200, 9000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('AC_MGR', 'Accounting Manager', 8200, 16000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('SA_MAN', 'Sales Manager', 10000, 20000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('SA_REP', 'Sales Representative', 6000, 12000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('PU_MAN', 'Purchasing Manager', 8000, 15000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('ST_MAN', 'Stock Manager', 5500, 8500);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('ST_CLERK', 'Stock Clerk', 2000, 5000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('SH_CLERK', 'Shipping Clerk', 2500, 5500);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('IT_PROG', 'Programmer', 4000, 10000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('MK_MAN', 'Marketing Manager', 9000, 15000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('MK_REP', 'Marketing Representative', 4000, 9000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('HR_REP', 'Human Resources Representative', 4000, 9000);
insert into JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) values ('PR_REP', 'Public Relations Representative', 4500, 10500);
commit;

insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (10, 'Administration', 200, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (20, 'Marketing', 201, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (30, 'Purchasing', 114, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (40, 'Human Resources', 203, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (50, 'Shipping', 121, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (60, 'IT', 103, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (70, 'Public Relations', 204, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (80, 'Sales', 145, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (90, 'Executive', 100, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (100, 'Finance', 108, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (110, 'Accounting', 205, 'BY');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (120, 'Treasury', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (130, 'Corporate Tax', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (140, 'Control And Credit', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (150, 'Shareholder Services', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (160, 'Benefits', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (170, 'Manufacturing', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (180, 'Construction', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (190, 'Contracting', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (200, 'Operations', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (210, 'IT Support', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (220, 'NOC', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (230, 'IT Helpdesk', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (240, 'Government Sales', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (250, 'Retail Sales', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (260, 'Recruiting', null, 'US');
insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID) values (270, 'Payroll', null, 'US');
commit;

insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', to_date('21-06-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2600, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', to_date('13-01-2000', 'dd-mm-yyyy'), 'SH_CLERK', 2600, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', to_date('17-09-1987', 'dd-mm-yyyy'), 'AD_ASST', 4400, null, 101, 10);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', to_date('17-02-1996', 'dd-mm-yyyy'), 'MK_MAN', 13000, null, 100, 20);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', to_date('17-08-1997', 'dd-mm-yyyy'), 'MK_REP', 6000, null, 201, 20);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', to_date('07-06-1994', 'dd-mm-yyyy'), 'HR_REP', 6500, null, 101, 40);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', to_date('07-06-1994', 'dd-mm-yyyy'), 'PR_REP', 10000, null, 101, 70);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_MGR', 12000, null, 101, 110);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_ACCOUNT', 8300, null, 205, 110);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (100, 'Steven', 'King', 'SKING', '515.123.4567', to_date('17-06-1987', 'dd-mm-yyyy'), 'AD_PRES', 24000, null, null, 90);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', to_date('21-09-1989', 'dd-mm-yyyy'), 'AD_VP',1700, null, 100, 90);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', to_date('13-01-1993', 'dd-mm-yyyy'), 'AD_VP',1700, null, 100, 90);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', to_date('03-01-1990', 'dd-mm-yyyy'), 'IT_PROG', 9000, null, 102, 60);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', to_date('21-05-1991', 'dd-mm-yyyy'), 'IT_PROG', 6000, null, 103, 60);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', to_date('25-06-1997', 'dd-mm-yyyy'), 'IT_PROG', 4800, null, 103, 60);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', to_date('05-02-1998', 'dd-mm-yyyy'), 'IT_PROG', 4800, null, 103, 60);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', to_date('07-02-1999', 'dd-mm-yyyy'), 'IT_PROG', 4200, null, 103, 60);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', to_date('17-08-1994', 'dd-mm-yyyy'), 'FI_MGR', 12000, null, 101, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', to_date('16-08-1994', 'dd-mm-yyyy'), 'FI_ACCOUNT', 9000, null, 108, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (110, 'John', 'Chen', 'JCHEN', '515.124.4269', to_date('28-09-1997', 'dd-mm-yyyy'), 'FI_ACCOUNT', 8200, null, 108, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', to_date('30-09-1997', 'dd-mm-yyyy'), 'FI_ACCOUNT', 7700, null, 108, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', to_date('07-03-1998', 'dd-mm-yyyy'), 'FI_ACCOUNT', 7800, null, 108, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', to_date('07-12-1999', 'dd-mm-yyyy'), 'FI_ACCOUNT', 6900, null, 108, 100);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', to_date('07-12-1994', 'dd-mm-yyyy'), 'PU_MAN', 11000, null, 100, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', to_date('18-05-1995', 'dd-mm-yyyy'), 'PU_CLERK', 3100, null, 114, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', to_date('24-12-1997', 'dd-mm-yyyy'), 'PU_CLERK', 2900, null, 114, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', to_date('24-07-1997', 'dd-mm-yyyy'), 'PU_CLERK', 2800, null, 114, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', to_date('15-11-1998', 'dd-mm-yyyy'), 'PU_CLERK', 2600, null, 114, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', to_date('10-08-1999', 'dd-mm-yyyy'), 'PU_CLERK', 2500, null, 114, 30);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', to_date('18-07-1996', 'dd-mm-yyyy'), 'ST_MAN', 8000, null, 100, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', to_date('10-04-1997', 'dd-mm-yyyy'), 'ST_MAN', 8200, null, 100, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', to_date('01-05-1995', 'dd-mm-yyyy'), 'ST_MAN', 7900, null, 100, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', to_date('10-10-1997', 'dd-mm-yyyy'), 'ST_MAN', 6500, null, 100, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', to_date('16-11-1999', 'dd-mm-yyyy'), 'ST_MAN', 5800, null, 100, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', to_date('16-07-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3200, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', to_date('28-09-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2700, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (127, 'James', 'Landry', 'JLANDRY', '650.124.1334', to_date('14-01-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2400, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', to_date('08-03-2000', 'dd-mm-yyyy'), 'ST_CLERK', 2200, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', to_date('20-08-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3300, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', to_date('30-10-1997', 'dd-mm-yyyy'), 'ST_CLERK', 2800, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', to_date('16-02-1997', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', to_date('10-04-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2100, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', to_date('14-06-1996', 'dd-mm-yyyy'), 'ST_CLERK', 3300, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', to_date('26-08-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2900, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (135, 'Ki', 'Gee', 'KGEE', '650.127.1734', to_date('12-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2400, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', to_date('06-02-2000', 'dd-mm-yyyy'), 'ST_CLERK', 2200, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', to_date('14-07-1995', 'dd-mm-yyyy'), 'ST_CLERK', 3600, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', to_date('26-10-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3200, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (139, 'John', 'Seo', 'JSEO', '650.121.2019', to_date('12-02-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2700, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', to_date('06-04-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', to_date('17-10-1995', 'dd-mm-yyyy'), 'ST_CLERK', 3500, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', to_date('29-01-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3100, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', to_date('15-03-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2600, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', to_date('09-07-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', to_date('01-10-1996', 'dd-mm-yyyy'), 'SA_MAN', 14000, .4, 100, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', to_date('05-01-1997', 'dd-mm-yyyy'), 'SA_MAN', 13500, .3, 100, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', to_date('10-03-1997', 'dd-mm-yyyy'), 'SA_MAN', 12000, .3, 100, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', to_date('15-10-1999', 'dd-mm-yyyy'), 'SA_MAN', 11000, .3, 100, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', to_date('29-01-2000', 'dd-mm-yyyy'), 'SA_MAN', 10500, .2, 100, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', to_date('30-01-1997', 'dd-mm-yyyy'), 'SA_REP', 10000, .3, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', to_date('24-03-1997', 'dd-mm-yyyy'), 'SA_REP', 9500, .25, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', to_date('20-08-1997', 'dd-mm-yyyy'), 'SA_REP', 9000, .25, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', to_date('30-03-1998', 'dd-mm-yyyy'), 'SA_REP', 8000, .2, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', to_date('09-12-1998', 'dd-mm-yyyy'), 'SA_REP', 7500, .2, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', to_date('23-11-1999', 'dd-mm-yyyy'), 'SA_REP', 7000, .15, 145, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (156, 'Janette', 'King', 'JKING', '011.44.1345.429268', to_date('30-01-1996', 'dd-mm-yyyy'), 'SA_REP', 10000, .35, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', to_date('04-03-1996', 'dd-mm-yyyy'), 'SA_REP', 9500, .35, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', to_date('01-08-1996', 'dd-mm-yyyy'), 'SA_REP', 9000, .35, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', to_date('10-03-1997', 'dd-mm-yyyy'), 'SA_REP', 8000, .3, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', to_date('15-12-1997', 'dd-mm-yyyy'), 'SA_REP', 7500, .3, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', to_date('03-11-1998', 'dd-mm-yyyy'), 'SA_REP', 7000, .25, 146, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', to_date('11-11-1997', 'dd-mm-yyyy'), 'SA_REP', 10500, .25, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', to_date('19-03-1999', 'dd-mm-yyyy'), 'SA_REP', 9500, .15, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', to_date('24-01-2000', 'dd-mm-yyyy'), 'SA_REP', 7200, .1, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', to_date('23-02-2000', 'dd-mm-yyyy'), 'SA_REP', 6800, .1, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', to_date('24-03-2000', 'dd-mm-yyyy'), 'SA_REP', 6400, .1, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', to_date('21-04-2000', 'dd-mm-yyyy'), 'SA_REP', 6200, .1, 147, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', to_date('11-03-1997', 'dd-mm-yyyy'), 'SA_REP', 11500, .25, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', to_date('23-03-1998', 'dd-mm-yyyy'), 'SA_REP', 10000, .2, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', to_date('24-01-1998', 'dd-mm-yyyy'), 'SA_REP', 9600, .2, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', to_date('23-02-1999', 'dd-mm-yyyy'), 'SA_REP', 7400, .15, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', to_date('24-03-1999', 'dd-mm-yyyy'), 'SA_REP', 7300, .15, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', to_date('21-04-2000', 'dd-mm-yyyy'), 'SA_REP', 6100, .1, 148, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', to_date('11-05-1996', 'dd-mm-yyyy'), 'SA_REP', 11000, .3, 149, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', to_date('19-03-1997', 'dd-mm-yyyy'), 'SA_REP', 8800, .25, 149, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', to_date('24-03-1998', 'dd-mm-yyyy'), 'SA_REP', 8600, .2, 149, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', to_date('23-04-1998', 'dd-mm-yyyy'), 'SA_REP', 8400, .2, 149, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', to_date('24-05-1999', 'dd-mm-yyyy'), 'SA_REP', 7000, .15, 149, null);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', to_date('04-01-2000', 'dd-mm-yyyy'), 'SA_REP', 6200, .1, 149, 80);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', to_date('24-01-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3200, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', to_date('23-02-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3100, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', to_date('21-06-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2500, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', to_date('03-02-2000', 'dd-mm-yyyy'), 'SH_CLERK', 2800, null, 120, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', to_date('27-01-1996', 'dd-mm-yyyy'), 'SH_CLERK', 4200, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', to_date('20-02-1997', 'dd-mm-yyyy'), 'SH_CLERK', 4100, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', to_date('24-06-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3400, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', to_date('07-02-1999', 'dd-mm-yyyy'), 'SH_CLERK', 3000, null, 121, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', to_date('14-06-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3800, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', to_date('13-08-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3600, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', to_date('11-07-1998', 'dd-mm-yyyy'), 'SH_CLERK', 2900, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', to_date('19-12-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2500, null, 122, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', to_date('04-02-1996', 'dd-mm-yyyy'), 'SH_CLERK', 4000, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', to_date('03-03-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3900, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', to_date('01-07-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3200, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (195, 'Vance', 'Jones', 'VJONES', '650.501.4876', to_date('17-03-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2800, null, 123, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', to_date('24-04-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3100, null, 124, 50);
insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
values (197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', to_date('23-05-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3000, null, 124, 50);
commit;

insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (102, to_date('13-01-1993', 'dd-mm-yyyy'), to_date('24-07-1998', 'dd-mm-yyyy'), 'IT_PROG', 60);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (101, to_date('21-09-1989', 'dd-mm-yyyy'), to_date('27-10-1993', 'dd-mm-yyyy'), 'AC_ACCOUNT', 110);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (101, to_date('28-10-1993', 'dd-mm-yyyy'), to_date('15-03-1997', 'dd-mm-yyyy'), 'AC_MGR', 110);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (201, to_date('17-02-1996', 'dd-mm-yyyy'), to_date('19-12-1999', 'dd-mm-yyyy'), 'MK_REP', 20);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (114, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (122, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (200, to_date('17-09-1987', 'dd-mm-yyyy'), to_date('17-06-1993', 'dd-mm-yyyy'), 'AD_ASST', 90);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (176, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'SA_REP', 80);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (176, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'SA_MAN', 80);
insert into JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
values (200, to_date('01-07-1994', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'AC_ACCOUNT', 90);
commit;
set feedback on
set define on

alter table DEPARTMENTS add constraint DEPT_MGR_FK foreign key (MANAGER_ID) references EMPLOYEES (EMPLOYEE_ID);
alter table DEPARTMENTS add constraint EMP_COUNTRY_FK foreign key (COUNTRY_ID) references COUNTRIES (COUNTRY_ID);
alter table EMPLOYEES add constraint EMP_MANAGER_FK foreign key (MANAGER_ID) references EMPLOYEES (EMPLOYEE_ID); 