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
	WHERE Quantity > 2
);