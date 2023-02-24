create view Ordersview AS 
select orderID,Quantity,TotalCost from Orders
where Quantity > 2;

select customer.customerID,customer.FullName,Orders.OrderID,Orders.TotalCost,
Menus.MenuName,menuitem.CourseName,menuitem.StarterName
from customer inner join orders on customer.customerID = Orders.OrderID
inner join menus on menus.menuID = Orders.orderID
INNER JOIN menuitem on menuitem.menuitemsID = menus.MenuID
Where TotalCost <= 1000;

select menuname from menus
where name = ANY (Select name from orders where quantity > 2);



