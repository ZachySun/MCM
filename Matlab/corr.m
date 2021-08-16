%% Corr
%% MATLAB实现相关系数的计算
% 计算每两列之间的相关系数
R = corrcoef(Test)

%% MATLAB实现描述性统计
% 每一列的最小值
MIN = min(Test);  
% 每一列的最大值
MAX = max(Test);   
% 每一列的平均值
MEAN = mean(Test);  
% 每一列的中位数
MEDIAN = median(Test);  
% 每一列的偏度
SKEWNESS = skewness(Test); 
% 每一列的峰度
KURTOSIS = kurtosis(Test); 
% 每一列的标准差
STD = std(Test);  
Describe = [MIN;MAX;MEAN;MEDIAN;SKEWNESS;KURTOSIS;STD]  


