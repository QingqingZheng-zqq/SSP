clear all  % Figure 2
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\Florida')
addpath('C:\Users\zqqst\Desktop\反对称矩阵2024.5.19\code\ssget')

%Problem = ssget(232)
%tol =1e-8;
%A=Problem.A;
%[m,n] = size(A);
%O1 = sparse(m,m); O2 = sparse(n,n); 
%A = [O1,A;-A',O2]; A =sparse(A);
%n = size(A,1); A =sparse(A);
%x1 = A*ones(n,1); x1 =x1/norm(x1);   %  Figure 1


j =4; v1 = 0.4; v2 = 0.5; v3 = 0.6; tol =1e-8;
t1 = tridiag(0, -v1, v1, j) ;
t2 = tridiag(0, -v2, v2, j) ;
t3 = tridiag(0, -v3, v3, j) ;
Ij=speye(j,j); 
A = kron(kron(Ij,Ij),t1) + kron(kron(Ij,t2),Ij) + kron(kron(t3,Ij),Ij); A =sparse(A); n = size(A,1);
x1 = A*ones(n,1); x1 =x1/norm(x1);
tic;
[resSTS,mvSTS, itsSTS,rhoSTS,u,v,To,Te,RHO] = tanpowerSTS (A, x1, tol);
tSTS = toc;

s = svds(A,10,'largest')
%err = s(1)-s(2)
n1 = size(To,2);  n2 = size(Te,2); Treso = []; Trese = []; se = []; so = [];
for i=1:n1
    seta = dot(To(:,i),u);
    seta = acos(seta);
    Treso(i) = abs(tan(seta));% the even sequence triangle
end

for i=1:n2
    seta = dot(Te(:,i),v);
    seta = acos(seta);
    Trese(i) = abs(tan(seta)); % the odd sequence
end

seta = dot(x1,u);
    seta = acos(seta);
    tan0 = abs(tan(seta));
for k=1:n2
    se(k) = (s(3)/s(1))^(2*k)*tan0; 
end
for k=1:n2
    so(k) = (s(3)/s(1))^(2*k-1)*tan0; 
end
RHOerr =[];
for k=1:n2
    RHOerr(k) = abs(RHO(k)-rhoSTS); 
end

s1 =1; %n1=25; n2=25;
x1 = s1:n1; x2 = s1:n2; 
subplot(1,3,1); 
plot(x1,log(Treso(s1:n1)),'b-<',x2,log(Trese(s1:n2)),'r-o',x2,log(RHOerr(s1:n2)),'c-+','LineWidth',1.3);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT');  title('(a)'); 
subplot(1,3,2); plot(x1,log(Treso(s1:n1)),'b-<',x2,log(se(s1:n2)),'g--','LineWidth',1.3);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT');  title('(b)'); 
subplot(1,3,3); plot(x2,log(Trese(s1:n2)),'r-o',x2,log(so(s1:n2)),'m','LineWidth',1.3);
set(gca,'FontName','Times New Roman','FontSize',12); xlabel('IT'); title('(c)'); 
fprintf('Method  IT  CPU   MV   RES\n' );     fprintf('\n');
fprintf('STS, %e, %e, %e, %e\n', itsSTS,tSTS,mvSTS,resSTS); %Algorithm 2

