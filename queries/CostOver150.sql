SELECT
	c.CustomerID, FullName, o.OrderID, 
    TotalCost, MenuName, CourseName, StarterName
FROM
	Customers c
JOIN
	Orders o 
JOIN
	Menus m 
JOIN 
	MenuItems mi 
ON
    c.CustomerID = o.CustomerID
    AND o.MenuID = m.MenuID
    AND m.MenuItemsID = mi.MenuItemsID
WHERE TotalCost > 150;  



