% Aaron Greiner and Kai Levy
% Linearity 2 Project 1: Commute Optimization

function res = bestroute()
%     a = [0 , 1, 1, 2 , 5 , 3 , 0 , 6 , 4, 5,  5 , 11, 11, 9, 9 , 0 , 8 , 14, 12, 7 , 13, 10 , 15 , 16 , 13]
%     b = [1 , 2, 3, 5 , 4 , 4 , 6 , 4 , 7, 7,  11, 10, 16, 7, 12, 8 , 14, 12, 15, 13, 10, 100, 100, 100, 15]
%     W = [11, 7, 9, 19, 10, 10, 12, 16, 4, 10, 22, 19, 6 , 8, 12, 14, 15, 8 , 17, 21, 17, 5  , 21 , 11 , 4 ]
%     DG = sparse(a, b, W)
s = [1 1 2 3 3 4 4 6 6 7 8 7 5];
t = [2 3 4 4 5 5 6 1 8 1 3 2 8];
G = digraph(s,t);
plot(G)
    
end