count =5;  % Figure 1
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')
tol = 1e-8;


Problem = ssget(899)
A=Problem.A;
A = (1/2)*(A-A'); nz = nnz(A); 
n = size(A,1); ratio1 = nz/(n*n)
x1 = A*ones(n,1);x1 =x1/norm(x1);
tic;
[RES1,TIME,its11,TMv, Tits,RHO,Xo,Xe] = powerSTSt (A, count, x1, tol);
tSTS = toc;
ti1 = [];
for i=1:length(TIME)
    ti1(i) = TIME(i)/its11(i);
end
ti1
xt1 = 1:length(TIME);
fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);


Problem = ssget(543)
A=Problem.A;
A = (1/2)*(A-A'); nz = nnz(A); 
n = size(A,1); ratio2 = nz/(n*n)
x1 = A*ones(n,1);x1 =x1/norm(x1);
tic;
[RES1,TIME,its11,TMv, Tits,RHO,Xo,Xe] = powerSTSt (A, count, x1, tol);
tSTS = toc;

ti2 = [];
for i=1:length(TIME)
    ti2(i) = TIME(i)/its11(i);
end
ti2
xt2 = 1:length(TIME);
fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);



Problem = ssget(537)
A=Problem.A;
[m,n] = size(A);
O1 = sparse(m,m); O2 = sparse(n,n); 
A = [O1,A;-A',O2]; A =sparse(A);nz = nnz(A); 
n = size(A,1); ratio3 = nz/(n*n)
x1 = A*ones(n,1);x1 =x1/norm(x1);
tic;
[RES1,TIME,its11,TMv, Tits,RHO,Xo,Xe] = powerSTSt (A, count, x1, tol);
tSTS = toc;

ti3 = [];
for i=1:length(TIME)
    ti3(i) = TIME(i)/its11(i);
end
ti3
xt3 = 1:length(TIME);
fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);

Problem = ssget(2832)
A=Problem.A;
[m,n] = size(A);
O1 = sparse(m,m); O2 = sparse(n,n); 
A = [O1,A;-A',O2]; A =sparse(A);nz = nnz(A); 
n = size(A,1); ratio4 = nz/(n*n)
x1 = A*ones(n,1);x1 =x1/norm(x1);
tic;
[RES1,TIME,its11,TMv, Tits,RHO,Xo,Xe] = powerSTSt (A, count, x1, tol);
tSTS = toc;

ti4 = [];
for i=1:length(TIME)
    ti4(i) = TIME(i)/its11(i);
end
ti4
xt4 = 1:length(TIME);
fprintf('Method  IT  CPU   MV  \n' );     fprintf('\n');
fprintf('STS, %e, %e, %e\n', Tits,tSTS,TMv);
%x1=1:length(RES1); x2=1:length(RES2);
%subplot(1,3,1); semilogy(RES1,'b-<','LineWidth',0.01);
%set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(a)'); 
subplot(1,2,1); plot(xt1,ti1,'r-o',xt2,ti2,'b-<','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(a)'); 
subplot(1,2,2);  plot(xt3,ti3,'b-<',xt4,ti4,'r-o','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(b)'); 