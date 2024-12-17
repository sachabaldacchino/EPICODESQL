SELECT * FROM DimProduct;

SELECT ProductKey, ProductAlternateKey, EnglishProductName as Name, Color, StandardCost as Cost, FinishedGoodsFlag
FROM DimProduct;

SELECT ProductKey, ProductAlternateKey, EnglishProductName as Name, Color, StandardCost as Cost, FinishedGoodsFlag
FROM DimProduct
WHERE FinishedGoodsFlag = 1;

SELECT 	ProductKey, ModelName, EnglishProductName, StandardCost , ListPrice , ListPrice - Standardcost as Markup
FROM DimProduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

SELECT ProductKey, ModelName, EnglishProductName, StandardCost , ListPrice
FROM DimProduct
WHERE FinishedGoodsFlag = 1 
AND ListPrice BETWEEN 1000 AND 2000;

SELECT *
FROM DimEmployee;

SELECT EmployeeKey, FirstName, LastName
FROM DimEmployee
WHERE Salespersonflag = 1;

SELECT *
FROM FactResellerSales;

SELECT SalesOrderNumber, OrderDate, ResellerKey, SalesAmount - TotalProductCost as profitto
FROM FactResellerSales
WHERE OrderDate >= '2020-01-01'
AND ResellerKey IN (597, 598, 477, 214);
