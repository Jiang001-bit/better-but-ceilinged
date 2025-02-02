%Subtitle: Diverse Potentials of C.elegance network, corresponding to figure 5 in the paper. 

%Remarks: This code presents the potential value and potential ratio

% Step 1: Get the different potentials of the network.

G=graph(elegance(:,1),elegance(:,2)); %elegance.mat is an adjacency table of the C.elegance network.
A=full(adjacency(G))
s=sum(A,2);
L=diag(s)-A;
[V,lambda]=eig(L);
potential=sort(diag(lambda));

% Step 2: Get the different potential ratios of the network.
ratio=potential/potential(2)