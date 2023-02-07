CREATE VIEW OrdersView AS
SELECT
	OrderID,
    Quantity,
    Cost
FROM
	littlelemon.orders
WHERE
	Quantity > 2;