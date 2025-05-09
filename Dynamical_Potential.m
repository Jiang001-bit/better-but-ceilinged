
%Subtitle: The simulation of dynamical potential corresponds to figure 3 in the paper. 

%Remarks: This code can verify the 1st and 2nd order potentials of any network. However, the adjacency matrix A of the network needs to be given manually. We uploaded the A we used.

% Step 1: Get the different potentials of the network.

A %!!!the adjacency matrix A of the network needs to be given manually   A_1---fig3_BA network; A_2---fig3_ER nework; A_3---fig3_Ws network

s=sum(A,2);
L=diag(s)-A
L1=L

lambda=sort(eig(L))
lambda2=lambda(2) %0-potential
lambda3=lambda(3) %1-potential
lambda4=lambda(4) %2-potential


% Step 2: Find all edge-sets with nullity 1 in the network.
edges = [];
[n, m] = size(A);
for i = 1:n
  for j = i+1:m
    if A(i,j) == 1
      edges = [edges; [i, j]];
    end
  end
end

% Step 3: Find all edge-sets with nullity 2 in the network.
combinations = [];
for i = 1:size(edges, 1)
  for j = i+1:size(edges, 1)
    combinations = [combinations; edges(i,:), edges(j,:)];
  end
end

disp(combinations);
[m1,n1]=size(combinations)
[m0,n0]=size(edges)

% Step 4: Get the limits of all 1-nullity edge-sets.
limit1=[]
for i=1:m0
    L(edges(i,1),edges(i,2))=L(edges(i,1),edges(i,2))-10000
    L(edges(i,2),edges(i,1))=L(edges(i,2),edges(i,1))-10000
    L(edges(i,1),edges(i,1))=L(edges(i,1),edges(i,1))+10000
    L(edges(i,2),edges(i,2))=L(edges(i,2),edges(i,2))+10000
    lmuda2=sort(eig(L)) 
    limit1=[limit1,lmuda2(2)]
    L=L1
end


% Step 4: Get the limits of all 2-nullity edge-sets.
limit2=[]
for i=1:m1
    for j=1:2:n1
        L(combinations(i,j),combinations(i,j+1))=L(combinations(i,j),combinations(i,j+1))-10000
        L(combinations(i,j+1),combinations(i,j))=L(combinations(i,j+1),combinations(i,j))-10000
        L(combinations(i,j),combinations(i,j))=L(combinations(i,j),combinations(i,j))+10000
        L(combinations(i,j+1),combinations(i,j+1))=L(combinations(i,j+1),combinations(i,j+1))+10000
    end
    lmuda2=sort(eig(L)) 
    limit2=[limit2,lmuda2(2)]
    L=L1
end


% Step 5: Present the results.
figure;
c1=[0.87,0.49,0]
scatter(2,limit2,300,c1,'.')
hold on
scatter(1,limit1,300,'.')
hold on


plot([0,3],[lambda2,lambda2])
hold on
plot([0,3],[lambda3,lambda3],'black')
hold on
plot([0,3],[lambda4,lambda4],'red')
