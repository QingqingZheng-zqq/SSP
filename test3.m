function test3 (flag,count)
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')

Problem = ssget(flag)
A=Problem.A;
[m,n] = size(A);
O1 = sparse(m,m); O2 = sparse(n,n); 
A = [O1,A;-A',O2]; A =sparse(A); nn= nnz(A)
%D = eigs(A, 10, "largestabs")
tol =1e-8;
n = size(A,1);
x1 = A*ones(n,1);x1 =x1/norm(x1);
%x1 = randn(n,1); x1=x1/norm(x1);

tic;
[RES,TMv, Tits,RHO,Xo,Xe] = powerSTS (A, count, x1, tol);
tSTS = toc;

fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);

end