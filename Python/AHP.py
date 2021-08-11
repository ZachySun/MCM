#!/usr/bin/env python
# coding: utf-8

# 参考：
# [AHP | 层次分析法原理及Python实现](https://zhuanlan.zhihu.com/p/108958590)

# In[1]:


import numpy as np
import pandas as pd


# In[8]:


class AHP:
    # 传入判断矩阵
    def __init__(self,array):
        self.array = array   
        # 获取矩阵的大小
        self.n = array.shape[0]
        # 对RI的值进行初始化
        RI = [0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46, 
                       1.49,1.52,1.54,1.56,1.58,1.59]
        self.RI = RI[self.n-1]
        
    # 特征值法计算权重向量
    def get_eig(self):
        # 获取特征值与特征向量
        eig_val ,eig_vector = np.linalg.eig(self.array)
        # 得到最大的特征值
        max_val = np.max(eig_val)
        max_val = round(max_val.real, 4)
        # 得到最大特征值对应的特征向量的索引
        index = np.argmax(eig_val)
        max_vector = eig_vector[:,index]
        max_vector = max_vector.real.round(4) 
        self.max_val = max_val
        # 计算权重向量
        weight_vector = max_vector/sum(max_vector)
        weight_vector = weight_vector.round(4)
        
        print("最大的特征值: "+str(max_val))
        print("对应的特征向量为: "+str(max_vector))
        print("归一化后得到权重向量: "+str(weight_vector))
        return weight_vector
    
    def test_consitst(self):
       
        CI = (self.max_val-self.n)/(self.n-1) 
        CI = round(CI,4) 
      
        print("判断矩阵的CI值为" +str(CI))
        print("判断矩阵的RI值为" +str(self.RI))
     
        if self.n == 2:
            print("仅包含两个子因素，不存在一致性问题")
        else:
            CR = CI/self.RI 
            CR = round(CR,4)
            if  CR < 0.10 :
                print("判断矩阵的CR值为" +str(CR) + "，通过一致性检验")
                return True
            else:
                print("判断矩阵的CR值为" +str(CR) + "，未通过一致性检验")
                return False


# Example

# In[9]:


A = np.array([[1,1/3,2],
            [3,1,5],
            [1/2,1/5,1]])


# In[11]:


x = AHP(A)


# In[14]:


x.get_eig()


# In[15]:


x.test_consitst()

