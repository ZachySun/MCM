%% nan_data
%% 分段三次埃尔米特插值
x = -pi:pi; 
y = sin(x); 
new_x = -pi:0.15:pi;
p = pchip(x,y,new_x);
figure(1); 
plot(x, y, 'o', new_x, p, 'r-')

%% 三次样条插值
x = -pi:pi; 
y = sin(x); 
new_x = -pi:0.15:pi;
% 分段三次埃尔米特插值
p1 = pchip(x,y,new_x);   
% 三次样条插值
p2 = spline(x,y,new_x);  
figure(2);
plot(x,y,'o',new_x,p1,'r-',new_x,p2,'g-')
legend('样本点','三次埃尔米特插值','三次样条插值','Location','SouthEast')   








