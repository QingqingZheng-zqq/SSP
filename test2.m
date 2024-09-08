function test2 (flag,count)  
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')

Problem = ssget(flag)
A=Problem.A;
A = (1/2)*(A-A'); nz = nnz(A)
A =sparse(A);
D = eigs(A, 10, "largestabs")
n = size(A)
tol =1e-8;
tic;
%[Evector1,ladma_eigs] = Meigs(A,1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[Evector1,ladma_eigs] = eigs(A,1); 
%zz = A*Evector1-ladma_eigs*Evector1; resEig=norm(zz);
%tEig = toc;
%fprintf('CPU of Eig=%e\n', tEig); fprintf('RES of Eig=%e\n', resEig);
%ladma_exact=ladma_eigs;      %the eigenvalue 
%u=real(Evector1); v=imag(Evector1);  %the real and imagary parts of the eigenvector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = size(A,1);
x1 = A*ones(n,1);x1 =x1/norm(x1);
%x1 = randn(n,1); x1=x1/norm(x1);
tic;
[RES,TMv, Tits,RHO,Xo,Xe] = powerSTS (A, count, x1, tol);
tSTS = toc;
%%%%%%% numerical rank of the eigenvectors
XX = Xo+1i*Xe;
[U,S,V] = svd(XX,0);
SS=S

fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);

end