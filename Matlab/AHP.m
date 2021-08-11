%% AHP
%% 层次分析法关键步骤
% 构造判断矩阵
% 一致性检验
%  计算权重矩阵
clear;
clc;

%% 输入判断矩阵
X = [] ;

%% 算数平均法
% 1.矩阵的每一个元素均除以其所在列的和
X_sum1 = sun(X)
n = size(X, 1)
X_sum2 = repmat(X_sum1, n, 1) 
X_c =  X./X_sum2
% 2.按照行进行求和
sum(X_c, 2)
% 3.将此时得到的向量每个元素除以n
disp('算数平均法求得的权重为：');
disp(sum(X_c,2) / n)

%% 几何平均法
clc;
% 1.按行相乘
X_prod = prod(X,2)

% 2.对新向量的元素开n次方
X_prod_n = X_prod .^ (1/n)

% 3.将此时得到的向量除以向量的和
disp('几何平均法求得的权重为：');
disp(X_prod_n ./ sum(X_prod_n))

%% 特征值法
clc;
% 1.求矩阵最大的特征值以及对应的特征向量
[V,D] = eig(X)  
max_eig = max(max(D))
[r,c] = find(D == max_eig , 1) 

% 2.对求出的特征向量进行归一化
disp('特征值法求得的权重为：');
disp( V(:,c) ./ sum(V(:,c)) )

%% 判断是否通过一致性检验
clc;
CI = (max_eig - n) / (n-1);        % 求解一致性指标
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];   % RI(2)有可能需要更改
CR=CI/RI(n);                              % 求解一致性比例
disp('CI=');disp(CI);
disp('CR=');disp(CR);
if CR<0.10
    disp('CR < 0.10，该判断矩阵通过一致性检验');
else
    disp('CR >= 0.10，该判断矩阵未通过一致性检验');
end













