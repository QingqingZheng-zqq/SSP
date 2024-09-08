function [b] = Sfun (S, RHO, U,V, x) 

%b = S*x-rho*((v'*x)*u-(u'*x)*v);
R = diag(RHO);  RR = blkdiag(R,R); %RR = sparse(RR);
b = S*x-[U,V]*(RR*([V,-U]'*x)); 
end