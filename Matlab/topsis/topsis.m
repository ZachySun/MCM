%% topsis
%% 加载输入矩阵X
clear;clc
load % X.mat

%% 正向化
% 获取输入矩阵的行与列
[n.m] = size(X);
% 需要正向化处理的指标所在的列
located = [];
% 这些列对应的处理方式(1:极小型 ；2:中间型；3:区间型)
func = [];
% 将以上向量输入正向化函数Positivization
% 传入参数为：需要正向化处理的列向量；对应的处理方式；正向化处理的哪一列
for i = 1 : size(located,2)
    X(:,located(i)) = Positivization(X(:,located(i)),func(i),located(i));
end

disp('正向化后的矩阵如下：')
disp(X)

%% 标准化
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
disp('最终得到的标准化矩阵Z= ')
disp(Z)

%% 添加权重
% 1：添加 ；2：不添加
Judge = input('是否需要增加权重： '); 
if Judge == 1
    % 输入权重向量
    weigh = input(['请输入权重向量：']);
    flag = 0;  
    while flag == 0 
        if abs(sum(weigh) - 1)<0.000001 && size(weigh,1) == 1 && size(weigh,2) == m   
             flag =1;
        else
            weigh = input('error ');
        end
    end
else
    weigh = ones(1,m) ./ m ; 
end


%% 计算与最大、最小值之间的距离以及评分
% 与最大值的距离组成的向量
D_max = sum([(Z - repmat(max(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;
% 与最小值的距离组成的向量
D_min = sum([(Z - repmat(min(Z),n,1)) .^ 2 ] .* repmat(weigh,n,1) ,2) .^ 0.5;
% 得到未归一化的评分
S = D_min ./ (D_max+D_min); 
disp('最终得到的评分如下：')
stand_S = S / sum(S);
% 对评分进行排序
[S_sort,index] = sort(stand_S ,'descend');



