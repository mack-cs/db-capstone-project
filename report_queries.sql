CREATE VIEW OrdersView AS
SELECT
	OrderID,
    Quantity,
    Cost
FROM
	littlelemon.orders
WHERE
	Quantity > 2;
    
select * from OrdersView;    
    
SELECT
	c.CustomerID, FullName, o.OrderID, TotalCost, MenuName, CourseName, StarterName
FROM
	Customers c
JOIN
	Orders o 
ON 
	c.CustomerID = o.CustomerID
JOIN
	Menus m 
ON
	o.MenuID = m.MenuID
JOIN 
	MenuItems mi 
ON
	m.MenuItemsID = mi.MenuItemsID;
    
SELECT MenuName 
FROM Menus
WHERE MenuName = ANY
 (	SELECT MenuName
	FROM 
		orders o 
	JOIN 
	Menus m
	ON
		o.MenuID = m.MenuID
	WHERE Quantity > 1
);

SELECT MenuName 
FROM Menus
WHERE MenuName = ANY
 (	SELECT MenuName
	FROM 
		orders o 
	JOIN 
	Menus m
	ON
		o.MenuID = m.MenuID
	WHERE Quantity > 1
);
