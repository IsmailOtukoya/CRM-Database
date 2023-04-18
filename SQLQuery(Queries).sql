
/*Query to track Customer Churn Rate - This query will give you the number of lost customers and the total number of customers, 
as well as the churn rate over the last 12 months. This can help you identify how many customers you are losing and adjust your 
retention strategy accordingly.*/
SELECT COUNT(DISTINCT CustomerID) as NumLostCustomers, COUNT(*) as NumTotalCustomers, 
       CASE WHEN COUNT(*) = 0 THEN 0 ELSE CAST(COUNT(DISTINCT CustomerID) AS FLOAT) / COUNT(*) END as ChurnRate
FROM Orders
WHERE OrderDate >= DATEADD(month, 12, GETDATE())



/*Query to track Customer Lifetime Value - This query will give you the total spend and number of orders for each customer,
as well as the length of time they have been a customer. 
This can help you identify your most valuable customers and tailor your marketing and retention strategies to them.*/
SELECT Customers.CustomerID, FirstName, LastName, Email, 
       SUM(TotalAmount) as TotalSpend,
       COUNT(*) as NumOrders,
       DATEDIFF(month, MIN(OrderDate), MAX(OrderDate)) as CustomerLifetime
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, FirstName, LastName, Email
ORDER BY TotalSpend DESC



/*Query to track product Productivity - This query will give you a count of orders for each product. 
This can help you identify which products are most popular and adjust your inventory and marketing strategies accordingly.*/
SELECT ProductName, COUNT(*) as NumOrders
FROM OrderDetails
JOIN Orders
ON OrderDetails.OrderID = Orders.OrderID
GROUP BY ProductName
ORDER BY NumOrders DESC

/* Query to track most loyal customers - This query returns the top 10 most loyal customers*/
SELECT TOP 10 CustomerID, COUNT(*) AS NumOrders
FROM Orders
GROUP BY CustomerID
ORDER BY NumOrders DESC;









