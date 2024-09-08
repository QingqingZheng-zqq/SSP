function [res,mv, its,rho,xo,xe,To,Te,RHO] = tanpowerSTS (S, x1, tol) % applying S and S^{T} alternately, i.e., Algorithm 2

res = 1;  j= 0; mv = 0;  To = []; Te = []; RHO=[];
xo = x1;
while ((res>=tol)&&(j<5000))
    xe = S*xo; xe =xe*(1/norm(xe)); Te = [Te, xe]; % the odd sequence
    xo1 = -(S*xe); xo =xo1*(1/norm(xo1)); To = [To, xo]; %the even sequence
    Sxo = S*xo;
    rho =xe'*Sxo; RHO=[RHO,rho];
    res = (sqrt(2)/2)*sqrt(norm(Sxo-rho*xe)^2+norm(-xo1+rho*xo)^2)/rho;
    mv = mv+3;
    j=j+1;
    
end
%res = norm(S*xo-rho*xe)+norm(-xo1+rho*xo);
its = j;



end