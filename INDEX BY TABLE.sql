
SET SERVEROUTPUT ON
DECLARE
    TYPE emp_table_type IS TABLE OF
    employees%ROWTYPE
    INDEX BY BINARY_INTEGER;
    emp_table emp_table_type;
    
    v_count NUMBER(3) := 104;
    
BEGIN
    FOR i IN 100..v_count
    LOOP
        SELECT * INTO emp_table(i)
        FROM employees
        WHERE employee_id = i;
   END LOOP;
   
   FOR i IN emp_table.FIRST..emp_table.LAST
   LOOP
        DBMS_OUTPUT.PUT_LINE(emp_table(i).last_name||'  R'||emp_table(i).salary);
   END LOOP;
END;
/
    