function [x_positive] = Inter2Max(x,a,b)
    r = size(x,1); 
    M = max([a - min(x)], max(x) - b); 
    x_positive = zeros(r , 1);  
    
    for i = 1 : r 
        if x(i) < a 
            x_positive(i) = 1 - (a - x(i)) / M;
        elseif x(i) > b 
            x_positive(i) = 1 - (x(i) - b) / M;
        else 
            x_positive(i) = 1;
        end
    end
end