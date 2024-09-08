count =5;  % Figure 1
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')



j =32; v1 = 0.4; v2 = 0.5; v3 = 0.6; tol =1e-8;
t1 = tridiag(0, -v1, v1, j) ;
t2 = tridiag(0, -v2, v2, j) ;
t3 = tridiag(0, -v3, v3, j) ;
Ij=speye(j,j);
C = kron(kron(Ij,Ij),t1) + kron(kron(Ij,t2),Ij) + kron(kron(t3,Ij),Ij); C =sparse(C);
%s= eigs(C,4,'largestabs');
%ratio3 = s(3)/s(1)
n = size(C,1);
x1 = C*ones(n,1);x1 =x1/norm(x1);
tic;
[RES3,TIME,its11,TMv, Tits,RHO,Xo,Xe] = powerSTSt (C, count, x1, tol);
tSTS = toc;

ti = [];
for i=1:length(TIME)
    ti(i) = TIME(i)/its11(i);
end
ti
xt = 1:length(TIME);
%x1=1:length(RES1); x2=1:length(RES2);
%subplot(1,3,1); semilogy(RES1,'b-<','LineWidth',0.01);
%set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(a)'); 
subplot(1,2,1); semilogy(RES3,'b-<','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(a)'); 
subplot(1,2,2); plot(xt,ti,'r-o','LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); ylabel('ERR_{k}'); title('(b)'); 