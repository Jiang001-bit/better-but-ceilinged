%Subtitle: The demonstration of higher-order interaction, corresponding to figure 6 in the paper. 

%Remarks: This code calculates the dynamical limit of Simplex (1,2,3)
%         This code presents the dynamical potential

% Step 1: Calculates the dynamical limit. (limit=reallimit)
L=[2,-1,-1,0,0,0;-1,2,-1,0,0,0;-1,-1,8,-2,-2,-2;0,0,-2,4,-1,-1;0,0,-2,-1,4,-1;0,0,-2,-1,-1,4]
L1=L
I=[1,2,3]
K=[2,3,1]
for i=1:3
    L(I(i),K(i))=L(I(i),K(i))-100000,L(K(i),I(i))=L(K(i),I(i))-100000,L(I(i),I(i))=L(I(i),I(i))+100000,L(K(i),K(i))=L(K(i),K(i))+100000 
end
lambda2=sort(eig(L))
reallimit=lambda2(2) 

X=[1/sqrt(3),0,0,0;1/sqrt(3),0,0,0;1/sqrt(3),0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]
Q=X'*L1*X
limit=eig(Q)
limit=limit(2) %theoretical result

% Step 1: Verification potential. (limit<potential)
lambda4=sort(eig(L1))
potential=lambda4(4)