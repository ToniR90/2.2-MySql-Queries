# 2.2: MySql - Queries 

## 📘 Objectives

- Learn how to query a SQL database effectively.

---

## 🗂️ Description

This project involves practicing SQL queries on two databases: `Tienda` and `Universidad`.

---

## 🛒 Database: Tienda

### Tables

- `producto` (codigo, nombre, precio, codigo_fabricante)
- `fabricante` (codigo, nombre)

> `producto.codigo_fabricante` references `fabricante.codigo`.

---

### 🔍 Queries to Practice

1. List all product names from the `producto` table.
2. List all product names and prices.
3. List all columns from the `producto` table.
4. List product names, price in euros, and price in USD.
5. Same as above, but using aliases: `product_name`, `euros`, `dollars`.
6. List product names and prices, converting names to uppercase.
7. List product names and prices, converting names to lowercase.
8. List manufacturer names and the first two characters (in uppercase) of each name.
9. List product names and prices, rounding prices.
10. List product names and prices, truncating decimals from prices.
11. List codes of manufacturers who have products.
12. Same as above, but remove duplicates.
13. List manufacturer names in ascending order.
14. List manufacturer names in descending order.
15. List product names ordered by name (ASC) and price (DESC).
16. Return the first 5 rows of the `fabricante` table.
17. Return 2 rows starting from the 4th row of the `fabricante` table (inclusive).
18. Return name and price of the cheapest product using `ORDER BY` and `LIMIT`.
19. Return name and price of the most expensive product using `ORDER BY` and `LIMIT`.
20. List all products where `codigo_fabricante = 2`.
21. List product name, price, and manufacturer name for all products.
22. Same as above, ordered alphabetically by manufacturer name.
23. Return product code, product name, manufacturer code, and manufacturer name.
24. Return name, price, and manufacturer name of the cheapest product.
25. Return name, price, and manufacturer name of the most expensive product.
26. List all products by manufacturer "Lenovo".
27. List all products by "Crucial" with a price > €200.
28. List all products from manufacturers: Asus, Hewlett-Packard, Seagate (without `IN`).
29. Same as above but using `IN`.
30. List product names and prices where the manufacturer's name ends with 'e'.
31. List product names and prices where the manufacturer's name contains 'w'.
32. List product name, price, and manufacturer name for products ≥ €180, ordered by price (DESC) then name (ASC).
33. List manufacturer code and name for manufacturers with associated products.
34. List all manufacturers and their products, including those with no products.
35. List only manufacturers without any associated products.
36. Return all products by "Lenovo" (without using `INNER JOIN`).
37. Return all products with the same price as Lenovo’s most expensive product (without using `INNER JOIN`).
38. List the most expensive product by "Lenovo".
39. List the cheapest product by "Hewlett-Packard".
40. List all products with a price ≥ the most expensive Lenovo product.
41. List Asus products with a price > the average price of all Asus products.

---

## 🎓 Database: Universidad


### 🔍 Queries to Practice

1. List all students (first surname, second surname, and name), ordered alphabetically.
2. List names of students who haven't registered a phone number.
3. List students born in 1999.
4. List professors without a phone number and whose NIF ends in 'K'.
5. List subjects in the 1st semester of the 3rd year of the degree with ID 7.
6. List professors and their department names, ordered by surnames and name.
7. List subjects, start and end year of the academic year for student with NIF `26902806M`.
8. List department names that have professors teaching in "Grau en Enginyeria Informàtica (Pla 2015)".
9. List students enrolled in any subject during the 2018/2019 academic year.

---

### 🧩 LEFT JOIN and RIGHT JOIN Queries

10. List all professors and their departments (including professors without departments).
11. List professors with no department assigned.
12. List departments with no professors assigned.
13. List professors who do not teach any subjects.
14. List subjects without assigned professors.
15. List departments that haven't taught any subjects in any academic year.

---

### 📊 Summary Queries

16. Return the total number of students.
17. Count students born in 1999.
18. Count professors in each department (only with assigned professors), ordered by count (DESC).
19. List all departments and count of professors (including departments without professors).
20. List all degrees and count of subjects (including degrees without subjects), ordered by subject count (DESC).
21. Same as above, but only for degrees with more than 40 subjects.
22. List degrees and total credits per subject type (degree name, type, total credits).
23. Count students enrolled in any subject per academic year (start year, student count).
24. Count subjects taught by each professor (including professors with none), ordered by subject count (DESC).
25. Return all data of the youngest student.
26. List professors with departments who do not teach any subject.

---

 
