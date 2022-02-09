# Проект dbt+Clickhouse
    Ссылка на инструкцию по созданию проекта: https://gist.github.com/kzzzr/8d50126079df1a8e5646342f6247df22

## Результаты работы
    1. **Q2.1**
    ```
    SELECT
    sum(LO_REVENUE),
    toYear(LO_ORDERDATE) AS year,
    P_BRAND
    FROM lineorder_flat
    WHERE P_CATEGORY = 'MFGR#12' AND S_REGION = 'AMERICA'
    GROUP BY year, P_BRAND
    ORDER BY year, P_BRAND;
    ```
    Результат запроса в _Q2_1.csv
    2. **Q3.3**
    ```
    SELECT
    C_CITY,
    S_CITY,
    toYear(LO_ORDERDATE) AS year,
    sum(LO_REVENUE) AS revenue
    FROM lineorder_flat
    WHERE (C_CITY = 'UNITED KI1' OR C_CITY = 'UNITED KI5') AND (S_CITY = 'UNITED KI1' OR S_CITY = 'UNITED KI5') AND year >= 1992 AND year <= 1997
    GROUP BY C_CITY, S_CITY, year
    ORDER BY year ASC, revenue DESC;
    ```
    Результат запроса в _Q3_3.csv
    3. **Q4.2**
    ```
    SELECT
    toYear(LO_ORDERDATE) AS year,
    S_NATION,
    P_CATEGORY,
    sum(LO_REVENUE - LO_SUPPLYCOST) AS profit
    FROM lineorder_flat
    WHERE C_REGION = 'AMERICA' AND S_REGION = 'AMERICA' AND (year = 1997 OR year = 1998) AND (P_MFGR = 'MFGR#1' OR P_MFGR = 'MFGR#2')
    GROUP BY year, _NATION, P_CATEGORY
    ORDER BY year ASC, S_NATION ASC, P_CATEGORY ASC;
    ```
    Результат запроса в _Q4_2.csv