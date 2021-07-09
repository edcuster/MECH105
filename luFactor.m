function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:

if det(A)==0
    error('Matrix must be inverable')
end
L =eye(size(A));%lower triangular matrix
U = A;%upper triangular matrix
P = eye(size(A));%the permutation matrix


[n,m]=size(A);

for i=1:n-1
    pivot=abs(U(i,i));
    p=i;
    for k=i+1:n
        if abs(U(k,i))>pivot
            pivot=abs(U(k,i));
            p=k;
        end
    end
    if p>i
        t_1=U(i,:);
        U(i,:)=U(p,:);
        U(p,:)=t_1;
        t_2=P(i,:);
        P(i,:)=P(p,:);
        P(p,:)=t_2;
        for j=1:i-1
            t_3=L(i,j);
            L(i,j)=L(p,j);
            L(p,j)=t_3;
            
        end
    end
    for h=i+1:n
        s=-U(h,i)/U(i,i);
        U(h,:)=U(h,:)+s*U(i,:);
        L(h,i)=-s;
    end
end 
    

if size(L)~=size(A)
    error('L not right size')
end

if size(U)~=size(A')
    error('U not right size')
end


%Checking if the LU matrixs are lower/upper 
good=1;
for i=1:n
    for j=i+1:m
        if L(i,j)~=0
            good=0;
        end
    end
end
if good~=1
    error('L not lower triangular')
end

good=1; % OK, look at U
for i=2:n %by row
    for j=1:i-1 % columns over to diagonal
        if U(i,j)~=0
            good=0;
        end
    end
end
if good==0
    error('U not upper triangular')
end

if L*U~=P*A
    error('Didnt Work')
end

%Chcking P matrix
for i=1:n
    if sum(P(i,:))~=1
        error('P Matrix is invalid')
    end
    
end
for j=1:m
    if sum(P(:,j))~=1
        error('P Matrix is invalid')
    end
end
end

