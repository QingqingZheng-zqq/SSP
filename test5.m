count1 =5; count2=5;    % Figure 2
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')

Problem = ssget(230)
A=Problem.A;
[m,n] = size(A);
tol =1e-8;
n = size(A,1);
x1 = A*ones(n,1);x1 =x1/norm(x1);


tic;
[RES1,TMv, Tits,RHO,Xo,Xe] = powerSTS (A, count1, x1, tol);
tSTS = toc;



Problem = ssget(231)
B=Problem.A;
[m,n] = size(B);
tol =1e-8;
n = size(B,1);
x1 = B*ones(n,1);x1 =x1/norm(x1);
tic;
[RES2,TMv, Tits,RHO,Xo,Xe] = powerSTS (B, count2, x1, tol);
tSTS = toc;



x1=1:length(RES1); x2=1:length(RES2);
subplot(1,2,1); semilogy(RES1,'b-<','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(a)'); 
subplot(1,2,2); semilogy(RES2,'r-o','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(b)'); 
