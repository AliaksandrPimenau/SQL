BEGIN
  FOR i IN 1..750 LOOP
    insert into departments (department_ID, department_NAMe, manager_ID, Country_ID)
    values ((i+300), 
        (SELECT department_NAMe FROM (SELECT department_NAMe FROM departments  ORDER BY dbms_random.value)  WHERE rownum = 1), 
         null, 
        (SELECT Country_ID  FROM(SELECT Country_ID  FROM countries  ORDER BY dbms_random.value) WHERE rownum = 1));
  END LOOP;
  
  FOR i IN 150..250000 LOOP
    insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
    values ((i), 
      (SELECT FIRST_NAME  FROM (SELECT FIRST_NAME  FROM EMPLOYEES  ORDER BY dbms_random.value) WHERE rownum = 1),
      (SELECT LAST_NAME  FROM (SELECT LAST_NAME  FROM EMPLOYEES  ORDER BY dbms_random.value) WHERE rownum = 1),
      (SELECT Concat(EMAIL, (SELECT DBMS_RANDOM.STRING('U', 2) FROM DUAL))  FROM (SELECT EMAIL  FROM EMPLOYEES  ORDER BY dbms_random.value) WHERE rownum = 1),
      (SELECT PHONE_NUMBER FROM (SELECT PHONE_NUMBER  FROM EMPLOYEES  ORDER BY dbms_random.value) WHERE rownum = 1),
      (SELECT HIRE_DATE  FROM (SELECT HIRE_DATE  FROM EMPLOYEES  ORDER BY dbms_random.value) WHERE rownum = 1),
      (SELECT JOB_ID  FROM (SELECT JOB_ID  FROM JOBS  ORDER BY dbms_random.value) WHERE rownum = 1),
      trunc( dbms_random.value( 4000, 10000 )),
      null,
      null,
      (SELECT department_ID  FROM (SELECT department_ID  FROM departments  ORDER BY dbms_random.value) WHERE rownum = 1)
      );
  END LOOP;
  
  FOR i IN 150..250000 LOOP
    UPDATE employees SET manager_id=(SELECT employee_id  FROM (SELECT employee_id FROM employees where job_id like '%MAN%' or job_id like '%MGR%' ORDER BY dbms_random.value) WHERE rownum = 1) where employees.employee_id = (i) and employees.job_id <> 'AD_PRES' ;
  END LOOP;
  
  FOR i IN 301..1050 LOOP
    UPDATE departments SET manager_id=(SELECT employee_id  FROM (SELECT employee_id FROM employees where job_id like '%MAN%' or job_id like '%MGR%' ORDER BY dbms_random.value) WHERE rownum = 1) where departments.department_id = (i);
  END LOOP;
END;