function [x_positive] = Mid2Max(x, best)
    M = max(abs(x - best)); 
    x_positive = 1 - abs(x - best) / M; 
end
