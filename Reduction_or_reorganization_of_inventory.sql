SELECT warehouseCode, warehouseName, warehousePctCap
FROM warehouses;
/*
b	East	2327710.29
a	North	1240847.65
d	South	1149461.12
c	West	1060291.30
*/
SELECT w.warehouseCode, w.warehouseName, SUM(p.quantityInStock) AS totalInventory
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName;

/*
a	North	131688
b	East	219183
c	West	124880
d	South	79380
*/
SELECT w.warehouseCode, w.warehouseName, SUM(p.quantityInStock) AS totalInventory,
       w.warehousePctCap, (SUM(p.quantityInStock) / w.warehousePctCap) AS utilization
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap;

/*
a	North	131688	72	1829
b	East	219183	67	3271.3880597014927
c	West	124880	50	2497.6
d	South	79380	75	1058.4
*/

SELECT w.warehouseCode, w.warehouseName, SUM(od.quantityOrdered * p.buyPrice) AS totalSales
FROM warehouses AS w
LEFT JOIN products AS p ON w.warehouseCode = p.warehouseCode
LEFT JOIN orderdetails AS od ON p.productCode = od.productCode
GROUP BY w.warehouseCode, w.warehouseName;

/*
a	North	1240847.65
b	East	2327710.29
c	West	1060291.30
d	South	1149461.12
*/


