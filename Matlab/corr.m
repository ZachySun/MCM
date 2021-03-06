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

%% 假设检验
x = -4:0.1:4;
y = tpdf(x,28);  
figure(1)
plot(x,y,'-')
grid on  
hold on  
% matlab可以求出临界值
tinv(0.975,28)    %    2.0484
plot([-2.048,-2.048],[0,tpdf(-2.048,28)],'r-')
plot([2.048,2.048],[0,tpdf(2.048,28)],'r-')

%% 计算各列之间的相关系数以及p值
[R,P] = corrcoef(Test)

%% 正态分布检验
% 生成正态分布
x = normrnd(2,3,100,1);   
skewness(x)  %计算偏度
kurtosis(x)  %计算峰度
qqplot(x)
    
% 循环检验所有列的数据
n_c = size(Test,2);  
H = zeros(1,6);  
P = zeros(1,6);
for i = 1:n_c
    [h,p] = jbtest(Test(:,i),0.05);
    H(i)=h;
    P(i)=p;
end
disp(H)
disp(P)
% h=1,不是正态分布

%% 计算斯皮尔曼相关系数
X = [3 8 4 7 2]'  
Y = [5 10 9 10 6]'

% 计算方法
coeff = corr(X , Y , 'type' , 'Spearman')
% 等价于：
RX = [2 5 3 4 1]
RY = [1 4.5 3 4.5 2]
R = corrcoef(RX,RY)

% 计算各列的斯皮尔曼相关系数
R = corr(Test, 'type' , 'Spearman')

% 对斯皮尔曼相关系数进行假设检验
% 小样本直接进行查表

% 大样本

% 计算检验值
disp(sqrt(590)*0.0301)
% 计算p值
disp((1-normcdf(0.7311))*2) % normcdf用来计算标准正态分布的累积概率密度函数

%% 直接给出相关系数和p值
[R,P]=corr(Test, 'type' , 'Spearman')


