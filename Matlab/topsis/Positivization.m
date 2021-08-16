function [x_positive] = Positivization(x,func,i)
    if type == 1  
        x_positive = Min2Max(x);  
    elseif type == 2  
        best = input('请输入最佳值 ：');
        x_positive = Mid2Max(x,best);
    elseif type == 3  
        a = input('区间下界： ');
        b = input('区间上界： '); 
        x_positive = Inter2Max(x,a,b);
    else
        disp('指标出错')
    end
end









