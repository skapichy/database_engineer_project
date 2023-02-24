#!/usr/bin/env python
# coding: utf-8

# In[69]:


import mysql.connector as connector


# In[70]:


connection = connector.connect(user = "imoru", password = "@16Ars96",db = "little_lemondb")


# In[71]:


cursor = connection.cursor()


# In[72]:


show_query_tables ="SHOW TABLES"
cursor.execute(show_query_tables)


# In[73]:


for tables in cursor:
    print(tables)


# In[74]:


cursor.execute("show databases")
for databases in cursor:
    print(databases)


# In[75]:


print('Customer Table')
customer_query = """select * from customer"""
cursor.execute(customer_query)
results = cursor.fetchall()
print(results)


# In[76]:


print('Order Table')
order_query = """select * from Orders"""
cursor.execute(order_query)
results = cursor.fetchall()
print(results)


# In[77]:


print('Customer Columns')
customer_column_query = """Show columns from Customer"""
cursor.execute(customer_column_query)
results = cursor.fetchall()
print(results)


# In[78]:


print('Order Columns')
order_column_query = """Show columns from Orders"""
cursor.execute(order_column_query)
results = cursor.fetchall()
print(results)


# In[89]:


print('Customer oder join ')
join_column_query = """Select FullName,PhoneNumber,Email,TotalCost 
from customer INNER JOIN Orders ON customer.customerID = orders.OrderID """
cursor.execute(join_column_query)
results = cursor.fetchall()
print(results)


# In[90]:


print('Filter Clause')
join_column_query = """Select FullName,TotalCost 
from customer INNER JOIN Orders  ON customer.customerID = orders.OrderID where TotalCost > 1000 """
cursor.execute(join_column_query)
results = cursor.fetchall()
print(results)


# In[ ]:





# In[ ]:




