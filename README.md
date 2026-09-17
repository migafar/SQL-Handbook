# SQL Handbook

Oracle SQL öyrənərkən qeyd etdiyim nümunələr və izahlar toplusu. Real `HR` sxeması üzərində DML sorğuları, həmçinin DDL əməliyyatlarını əhatə edir.

```
SQL-Handbook/
└── SQL Tutorials/
    ├── DDL.sql   # Data Definition Language nümunələri
    └── DML.sql   # Data Manipulation Language nümunələri
```

## Mövzular

### DDL.sql — Data Definition Language
- Cədvəl yaratma (`CREATE TABLE`)
- Məlumat daxil etmə (`INSERT`)
- Yeniləmə və silmə (`UPDATE`, `DELETE`)
- `COMMIT` / `ROLLBACK` fərqi
- `TRUNCATE` və `DROP` fərqi
- Sütun əlavə etmə, silmə və adını dəyişmə (`ALTER TABLE`)

### DML.sql — Data Manipulation Language
- `SELECT`, `WHERE`, `LIKE` və regex şərtləri
- `ORDER BY`, `GROUP BY`, `HAVING`
- Aqreqat funksiyalar: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Sətir funksiyaları: `TRIM`, `SUBSTR`, `REPLACE`, `INSTR`, `RPAD`
- Şərti ifadələr: `CASE`, `DECODE`, `NVL`, `COALESCE`
- Tarix funksiyaları: `MONTHS_BETWEEN`, `EXTRACT`
- `JOIN` növləri: `INNER`, `LEFT`, `RIGHT`, `FULL`
- Çoxluq əməliyyatları: `UNION`, `INTERSECT`, `MINUS`
- Alt sorğular (`SUBQUERIES`)
- Pəncərə funksiyaları: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, `FIRST_VALUE`, `LAST_VALUE`

## İstifadə olunan mühit

Nümunələr Oracle SQL sintaksisi ilə yazılıb və `HR` demo sxeması üzərində test edilib (bəzi sorğularda PostgreSQL/MS SQL üçün alternativ qeydlər də var).

## Məqsəd

Bu repo SQL-i öyrənmə prosesində şəxsi bələdçi kimi istifadə üçün hazırlanıb — həm sintaksisi xatırlamaq, həm də tez-tez rast gəlinən konsepsiyaları (join-lər, window funksiyaları, subquery-lər) praktiki nümunələrlə gücləndirmək məqsədi daşıyır.
