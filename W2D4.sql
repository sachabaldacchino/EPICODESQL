use adventureworksdw;

SELECT
	p.EnglishProductName,
    s.EnglishProductSubCategoryName
FROM
	Dimproduct p
LEFT JOIN
	DimProductSubCategory s
ON p.Productsubcategorykey = s.productsubcategorykey;

SELECT
	p.EnglishProductName,
    s.EnglishProductSubCategoryName,
    c.EnglishProductCategoryName
FROM
	Dimproduct p
LEFT JOIN
	DimProductSubCategory s
ON p.Productsubcategorykey = s.productsubcategorykey
LEFT JOIN
	DimProductCategory c
ON s.ProductCategorykey = c.ProductCategorykey;

SELECT 
	p.EnglishProductName
FROM
	DimProduct p
INNER JOIN
	FactResellerSales r
ON p.productkey = r.productkey
GROUP BY p.EnglishProductName;

SELECT 
	p.EnglishProductName
FROM
	DimProduct p
INNER JOIN
	FactResellerSales r
ON p.productkey <> r.productkey
WHERE p.FinishedGoodsFlag = 1;

SELECT 
	r.SalesOrderNumber,
    r.SalesOrderLineNumber,
    p.EnglishProductName
FROM 
	DimProduct p
INNER JOIN 
	FactResellerSales r
ON p.productkey = r.productkey
ORDER BY r.SalesOrderNumber, SalesOrderLineNumber;

SELECT 
	r.SalesOrderNumber,
    r.SalesOrderLineNumber,
    p.EnglishProductName,
    c.EnglishProductCategoryName
FROM 
	FactResellerSales r
INNER JOIN 
	DimProduct p
ON p.productkey = r.productkey
LEFT JOIN
	DimProductSubCategory s
ON p.ProductSubCategoryKey = s.ProductSubCategoryKey
LEFT JOIN
	DimProductCategory c
ON s.ProductCategoryKey = c.ProductCategoryKey
ORDER BY r.SalesOrderNumber, SalesOrderLineNumber;

SELECT *
FROM DimReseller;

SELECT *
FROM DimGeography;

SELECT *
FROM DimSalesTerritory;

SELECT  
	r.Resellername,
    g.EnglishCountryRegionName,
    t.SalesTerritoryRegion,
    t.SalesTerritoryGroup
FROM
	DimReseller r
INNER JOIN
	DimGeography g
ON r.geographykey = g.geographykey
INNER JOIN
	DimSalesTerritory t
ON g.SalesTerritoryKey = t.SalesTerritoryKey;

SELECT
	 f.SalesOrderNumber,
     f.SalesOrderLineNumber,
     f.OrderDate,
     r.ResellerName,
     g.EnglishCountryRegionName,
     p.EnglishProductName,
     c.EnglishProductCategoryName,
     f.UnitPrice,
     f.OrderQuantity,
     f.TotalProductCost
FROM
	DimProductCategory c
INNER JOIN
	DimProductSubCategory s
	ON c.ProductCategorykey = s.ProductCategorykey
INNER JOIN
	DimProduct p
	ON s.ProductSubCategoryKey = p.ProductSubCategorykey
INNER JOIN
	FactResellerSales f
	ON f.productkey = p.productkey
INNER JOIN
	DimReseller r
    ON r.resellerkey = f.resellerkey
INNER JOIN DimGeography g
	ON r.geographykey = g.geographykey;
	
