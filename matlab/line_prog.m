% 设置参数值
c=[3;3;-4];
a=[-2,3,-1;1,3,1];
b=[-12;10];
aeq=[1,1,1];
beq=6;
% 通用函数
x = linprog(-c, a, b, aeq, beq, zeros(3,1))
value = c'*x