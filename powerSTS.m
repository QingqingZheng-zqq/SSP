function [RES,TMv, Tits,RHO,Xo,Xe] = powerSTS (S, count,x0, tol) % Applying skew-symmetric power to S=S-[U V][Sigma 0;0 Sigma][V -U]^{T}
  Xo = []; Xe = []; RES =[]; RHO = []; its = []; Mv = [];
%xo = x1; Sxo = S*xo; mv = 1;  
n = size(S,1);
m =1; 
while (m<=count)
    res = 1;
    %x1 = randn(n,1); x1=x1/norm(x1);
    x1 = x0; res1 =[];  k=0; 
    xe = x1; Sxe = S*xe; mv = 1; 
while ((res>=tol)&&(k<20000))
    if (m==1)
        xo = Sxe; t1 = norm(xo); xo =xo/t1;
        xo1 = -(S*xo); t2 = norm(xo1); xe =xo1/t2; 
        Sxe = S*xe; 
    else  
    xo = Sxe; t1 = norm(xo); xo =xo/t1;
    xo1 = -Sfun (S, RHO, Xo,Xe, xo); t2 = norm(xo1); xe =xo1/t2; 
    Sxe = Sfun (S, RHO, Xo,Xe, xe);
    end
    rho =xo'*Sxe;
    res = (sqrt(2)/2)*sqrt((norm(-xo1+rho*xe))^2+(norm(Sxe-rho*xo))^2)/rho ;
    if (m~=1)
        res = (sqrt(2)/2)*sqrt((norm(-xo1+rho*xe))^2+(norm(Sxe-rho*xo))^2)/RHO(1) ;
    end
    res1 = [res1,res];
    mv = mv+2 ; 
    k=k+1; 
    x1 = xe;
end
res2 = res1(2:end);
u = xo; v = xe; 
its = [its,k] ;
Xo = [Xo, u]; 
Xe = [Xe, v]; 
RES =[RES;res2']; 
RHO = [RHO,rho];
Mv = [Mv,mv];
m = m+1;
end

lits = length(its); Tits= 0;
for i=1:lits
    Tits = Tits + its(i);
end
lMv = length(Mv); TMv= 0;
for i=1:lMv
    TMv = TMv + Mv(i);
end
RHO
its11=its

end