% Aaron Greiner and Kai Levy
% Linearity 2 Project 1: Commute Optimization

function res = bestroute()
    a = [1 , 3, 3, 4 , 7 , 5 , 1 , 8 , 6, 7 , 7 , 13, 13, 11, 11, 1 , 10, 16, 14, 9 , 15, 12, 17, 18, 15];
    b = [3 , 4, 5, 7 , 6 , 6 , 8 , 6 , 9, 9 , 13, 12, 18, 9 , 14, 10, 16, 14, 17, 15, 12, 2 , 2 , 2 , 17];
    W = [11, 7, 9, 19, 10, 10, 12, 16, 4, 10, 22, 19, 6 , 8 , 12, 14, 15, 8 , 17, 21, 17, 5 , 21, 11, 4 ];
    G = graph(a,b,W);
    plot(G, 'EdgeLabel', G.Edges.Weight)
    [path,d] = shortestpath(G,1,2)
%     DG = sparse(a, b, W, 100, 100);
%     h = view(biograph(DG,[],'ShowWeights','on'));
%     [dist,path,pred] = graphshortestpath(DG,99,100)
% s = [1 1 2 3 3 4 4 6 6 7 8 7 5];
% t = [2 3 4 4 5 5 6 1 8 1 3 2 8];
% G = digraph(s,t);
% plot(G)
    
end