function test1 (flag,count)   %Table 1
%addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.4.9\Florida')
%function [sol, res, its] = power (A, rhs, im, tolIts, maxits, PRE, sol, output)
j =flag; v1 = 0.4; v2 = 0.5; v3 = 0.6; tol =1e-8;
t1 = tridiag(0, -v1, v1, j) ;
t2 = tridiag(0, -v2, v2, j) ;
t3 = tridiag(0, -v3, v3, j) ;
Ij=speye(j,j);
A = kron(kron(Ij,Ij),t1) + kron(kron(Ij,t2),Ij) + kron(kron(t3,Ij),Ij); A =sparse(A);
%A = randn(100,100); A = A-A';
%s = eigs(A, 12, "largestabs")
%ratio1 = s(3)/s(1)
%ratio2 = s(5)/s(3)
%ratio3 = s(7)/s(5)
%ratio4 = s(9)/s(7)
%ratio1 = s(11)/s(9)

%[Evector1,ladma_eigs] = Meigs(A,1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[Evector1,ladma_eigs] = eigs(A,1); 
%zz = A*Evector1-ladma_eigs*Evector1; resEig=norm(zz);
%tEig = toc;
%fprintf('CPU of Eig=%e\n', tEig); fprintf('RES of Eig=%e\n', resEig);
%ladma_exact=ladma_eigs;      %the eigenvalue 
%u=real(Evector1); v=imag(Evector1);  %the real and imagary parts of the eigenvector
%%%%%%%%%%%%%%%%%%
n = size(A,1)
x1 = A*ones(n,1);x1 =x1/norm(x1);
%x1 = randn(n,1); x1=x1/norm(x1);

tic;
[RES,TMv, Tits,RHO,Xo,Xe] = powerSTS (A, count, x1, tol);
tSTS = toc;

fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);

end