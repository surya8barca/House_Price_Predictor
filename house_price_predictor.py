#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[3]:


df=pd.read_csv('USA_Housing.csv')


# In[4]:


df.head()


# In[5]:


df.describe()


# In[7]:


fig=sns.pairplot(df)
fig.savefig('Pairplot.jpg')


# In[8]:


fig2=sns.distplot(df['Price'])
fig2.savefig('Price_distribition.jpg')


# In[14]:


fig3=sns.heatmap(df.corr(),annot=True)


# In[16]:


df.columns


# In[17]:


X=df[['Avg. Area Income', 'Avg. Area House Age', 'Avg. Area Number of Rooms',
       'Avg. Area Number of Bedrooms', 'Area Population']]


# In[18]:


y=df['Price']


# In[19]:


from sklearn.model_selection import train_test_split


# In[20]:


X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.4,random_state=101)


# In[21]:


#model training


# In[22]:


from sklearn.linear_model import LinearRegression #import linear regression


# In[23]:


lm=LinearRegression() #create an object


# In[24]:


lm.fit(X_train,y_train) #fit the data


# In[25]:


lm.coef_


# In[26]:


coef=pd.DataFrame(lm.coef_,X.columns,columns=['Coeff'])


# In[27]:


coef


# In[28]:


predictions=lm.predict(X_test)


# In[33]:


fig2=sns.lineplot(y_test,predictions)
fig2


# In[ ]:





# In[35]:


check=pd.DataFrame(predictions,y_test,columns=['Test'])


# In[36]:


check.head()


# In[ ]:




