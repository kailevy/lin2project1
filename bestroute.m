% Aaron Greiner and Kai Levy
% Linearity 2 Project 1: Commute Optimization

function res = bestroute(time, impact, cost)
    function result = weighted_values(t,im,c,method)
        if (strcmp(method,'car'))
            result = WCt_norm .* t + WCc_norm .* c + WCi_norm .* im;
        end
        if (strcmp(method,'bike'))
            result = WBt_norm .* t + WBc_norm .* c + WBi_norm .* im;
        end
    end
        
    D  = [5 , 3, 2, 4 , 2 , 3 , 4 , 7 , 1, 3 , 8 , 4 , 2 , 5 , 4 , 10, 10, 7 , 8 , 8 , 4 , 3 , 4 , 4 , 4 ];
    Btpm = [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4];
    Bcpm = [.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01];
    Bipm = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    
    Ctpm = [0.45,0.43,0.22,0.21,0.2,0.3,0.33,0.44,0.25,0.3,0.36,0.21,0.33,0.63,0.33,0.71,0.67,0.88,0.47,0.44,0.24,0.6,0.21,0.36,1];
    Ccpm= [.2,.2,.2,.2 ,.2 , .2, .2, .2,.3,.2 ,.2 ,.2 ,.2 ,.2 ,.2 , .15, .1,.15 ,.2 ,.2 ,.2 ,.2 ,.2 ,.2 ,.2 ];
    Cipm= [.35,.45,.35,.35 ,.35 , .45, .25, .35,.45,.35 ,.35 ,.35 ,.35 ,.35 ,.35 , .25, .25,.25 ,.35 ,.35 ,.35 ,.35 ,.35 ,.35 ,.35 ];
    
%     WCt = [11, 7, 9, 19, 10, 10, 12, 16, 4, 10, 22, 19, 6 , 8 , 12, 14, 15, 8 , 17, 18, 17, 5 , 19, 11, 4 ];
    WCt = D.*Ctpm;
    WCc = D.*Ccpm;
    WCi = D.*Cipm;
    
    WBt = D.*Btpm;
    WBc = D.*Bcpm;
    WBi = D.*Bipm;
    
    WCt_norm = WCt ./ sum(WCt + WBt);
    WCc_norm = WCc ./ sum(WCc + WBc);
    WCi_norm = WCi ./ sum(WCi + WBi);
    
    
    WBt_norm = WBt ./ sum(WCt + WBt);
    WBc_norm = WBc ./ sum(WCc + WBc);
    WBi_norm = WBi ./ sum(WCi + WBi);
    
    a  = [1 , 3, 3, 4 , 7 , 5 , 1 , 8 , 6, 7 , 7 , 13, 13, 11, 11, 1 , 10, 16, 14, 9 , 15, 12, 17, 18, 15];
    b  = [3 , 4, 5, 7 , 6 , 6 , 8 , 6 , 9, 9 , 13, 12, 18, 9 , 14, 10, 16, 14, 17, 15, 12, 2 , 2 , 2 , 17];
    
    
    CW = weighted_values(time, impact, cost, 'car');
    G = graph(a,b,CW);
    
%     plot(G, 'EdgeLabel', G.Edges.Weight)
    [Cpath,Cd] = shortestpath(G,1,2);
    
    BW = weighted_values(time, impact, cost, 'bike');
    G = graph(a,b,BW);
    
%     plot(G, 'EdgeLabel', G.Edges.Weight)
    [Bpath,Bd] = shortestpath(G,1,2);
    
    if (Cd < Bd)
        disp('Drive');
        disp(Cpath);
    else
       disp('Bike');
       disp(Bpath);
    end

end