#!/usr/bin/env python
# coding: utf-8

# In[2]:


#Linear programming
from scipy import optimize
import numpy as np


# In[11]:


c = np.array([3, 3, -4])
A = np.array([
    [-2, 3, -1],
    [1, 3, 1]
])
b = ([-12, 10])
Aeq = np.array([[1, 1, 1]])
Beq = np.array([6]) 
res = optimize.linprog(-c, A, b, Aeq, Beq)


# In[8]:


print(res.fun)


# In[9]:


print(res.x)


# In[10]:


print(res)

