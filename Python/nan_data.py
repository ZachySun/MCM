#!/usr/bin/env python
# coding: utf-8

# In[1]:
import pandas as pd
import numpy as np
from numpy import nan
# In[2]:
# 生成含缺失值的数据
data=pd.DataFrame(np.arange(3,35,1).reshape(8,4),columns=list('abcd'))
data.iloc[1:2,:3]=nan
data
#     1.检查缺失值

# In[3]:
data.isnull()
# In[4]:
data.notnull()
# In[5]:
data.isnull().sum()
# In[6]:
data.info()
#     2.缺失值填充
# In[7]:
data_1 = data.fillna(0)
data_1
# In[8]:
data_2 = data.fillna("$")
data_2
# In[10]:
data['a']=data['a'].fillna(data['a'].sum())
data
# In[19]:
# 插值算法
df = pd.DataFrame([(0.0, np.nan, -1.0, 1.0),
                   (np.nan, 3.0, np.nan, np.nan),
                   (2.0, 3.0, np.nan, 9.0),
                   (np.nan, 4.0, -4.0, 15.0)],
                  columns=list('abcd'))
df
# In[20]:
df.interpolate(method='linear', limit_direction='forward', axis=0)
# In[21]:
df.interpolate(method='linear', axis=0)
# In[28]:
df['d'].interpolate(method='spline', axis=0, order=2)
# In[ ]: