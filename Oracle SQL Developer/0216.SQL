
--- 1. 
SELECT    DISTINCT MANAGER_ID
          , DEPARTMENT_ID
FROM      EMPLOYEES
WHERE     MANAGER_ID IS NOT NULL
ORDER     BY MANAGER_ID
          , DEPARTMENT_ID
;


---- 2. 
SELECT    MANAGER_ID 
          , DEPARTMENT_ID
FROM      EMPLOYEES
GROUP     BY DEPARTMENT_ID
          , MANAGER_ID
ORDER     BY MANAGER_ID
          , DEPARTMENT_ID
;

-- 3.
-- �μ��� ������� ���Ѵ� 
SELECT    DEPARTMENT_ID 
          , COUNT(EMPLOYEE_ID)
FROM      EMPLOYEES
GROUP     BY DEPARTMENT_ID
ORDER     BY DEPARTMENT_ID
;

-- 4. GROUP BY �� SELECT �÷��� �������� ������ ������ �����. 
SELECT    DEPARTMENT_ID 
          , COUNT(EMPLOYEE_ID)
FROM      EMPLOYEES
GROUP     BY MANAGER_ID
ORDER     BY DEPARTMENT_ID
;

--- 5.
-- �μ��� (MANAGER_ID) �� ���� ������ ���� ���Ͻÿ� 
SELECT    MANAGER_ID 
          , COUNT (EMPLOYEE_ID)
FROM      EMPLOYEES
GROUP     BY MANAGER_ID
;

 -- 6. 
 -- ��ü ��� �� ���� ���� ������ ���� ���� ���� 
 -- �׸��� ��ü ������ ��, ��ü ������ ����� ���Ͻÿ� 
 SELECT     MAX(SALARY)   AS HIGH_SALARY
            , MIN(SALARY) AS LOW_SALARY
            , SUM(SALARY) AS SUM_SALARY
            , ROUND(AVG(SALARY)) AS AVG_SALARY
 FROM       EMPLOYEES
 ;

-- 7.
-- �μ��� ���� ���� ����, ���� ���� ����
-- ��ü ������ ��, ��ü ������ ����� ���Ͻÿ� 
SELECT      DEPARTMENT_ID
            , MAX(SALARY)   AS HIGH_SALARY
            , MIN(SALARY) AS LOW_SALARY
            , SUM(SALARY) AS SUM_SALARY
            , ROUND(AVG(SALARY)) AS AVG_SALARY
 FROM       EMPLOYEES
 GROUP      BY DEPARTMENT_ID
 ;
            

-- 8.
-- �Ʒ��� �Լ��� NULL �̶�� 0���� ǥ���ض�� �ǹ� 
SELECT      NVL ( DEPARTMENT_ID, 0) 
            , MAX(SALARY)   AS HIGH_SALARY
            , MIN(SALARY)   AS LOW_SALARY
            , SUM(SALARY)   AS SUM_SALARY
            , ROUND(AVG(SALARY)) AS AVG_SALARY
 FROM       EMPLOYEES
 GROUP      BY DEPARTMENT_ID
;

-- 9.
-- ~ �̻�, ~ ���� ����ϱ� GROUP BY �� ���ǵ��� HAVING���� ����Ѵ�. 
SELECT      NVL ( DEPARTMENT_ID, 0) 
            , MAX(SALARY)   AS HIGH_SALARY
            , MIN(SALARY)   AS LOW_SALARY
            , SUM(SALARY)   AS SUM_SALARY
            , ROUND(AVG(SALARY)) AS AVG_SALARY
 FROM       EMPLOYEES
 GROUP      BY DEPARTMENT_ID
 HAVING     AVG(SALARY) >= 5000
;