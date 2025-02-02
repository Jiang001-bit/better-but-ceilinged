
%Subtitle: The simulation of dynamical limit corresponds to figure 2 in the paper. 

%Remarks: It takes some time to run. If you need to get it faster, you can increase the interval of limit simulation.

%Step 1: Limiting value and simulation of Network 1
L=[3,-1,-1,0,-1,0,0;-1,3,-1,-1,0,0,0;-1,-1,3,-1,0,0,0;0,-1,-1,3,-1,0,0;-1,0,0,-1,4,-1,-1;0,0,0,0,-1,2,-1;0,0,0,0,-1,-1,2] %Laplacian of Network 1 
lambda=eig(L)
L1=L 

X=[2,-4/sqrt(6),0,0;-4/sqrt(6),2,-1/sqrt(3),-1/sqrt(3);0,-1/sqrt(3),2,-1;0,-1/sqrt(3),-1,2] %Limiting value
lambda2=eig(X)
lim_1=lambda2(2)

figure; % Simulation of Fiedler value change when the weight tends to infinity
I=[1,3,4]
K=[2,4,5]
n=length(I)
varylambda2_1=[]
for eps=0:0.1:1000 
    for i=1:n
     L(I(i),K(i))=L(I(i),K(i))-eps,L(K(i),I(i))=L(K(i),I(i))-eps,L(I(i),I(i))=L(I(i),I(i))+eps,L(K(i),K(i))=L(K(i),K(i))+eps 
    end
lmuda2=sort(eig(L))
varylambda2_1=[varylambda2_1,lmuda2(2)] % Store changed Fiedler values
L=L1
end
x=0:0.1:1000

loglog(x,varylambda2_1) 
hold on


%Step 2: Simulation of Network 2
L=[3,-1,-1,0,-1,0,0;-1,3,-1,-1,0,0,0;-1,-1,4,-1,-1,0,0;0,-1,-1,3,-1,0,0;-1,0,-1,-1,5,-1,-1;0,0,0,0,-1,2,-1;0,0,0,0,-1,-1,2]
lambda=eig(L)
L1=L

I=[1,3,4,3]  % Simulation of Fiedler value change when the weight tends to infinity
K=[2,4,5,5]
n=length(I)
varylambda2_2=[]
for eps=0:0.1:1000 
    for i=1:n
     L(I(i),K(i))=L(I(i),K(i))-eps,L(K(i),I(i))=L(K(i),I(i))-eps,L(I(i),I(i))=L(I(i),I(i))+eps,L(K(i),K(i))=L(K(i),K(i))+eps 
    end
lmuda2=sort(eig(L))
varylambda2_2=[varylambda2_2,lmuda2(2)] % Store changed Fiedler values
L=L1
end
x=0:0.1:1000

loglog(x,varylambda2_2)
hold on

%Step 3: Simulation of Network 3
L=[3,-1,-1,0,-1,0,0;-1,3,-1,0,-1,0,0;-1,-1,3,-1,0,0,0;0,0,-1,2,-1,0,0;-1,-1,0,-1,5,-1,-1;0,0,0,0,-1,2,-1;0,0,0,0,-1,-1,2]
lambda=eig(L)
L1=L 

I=[1,3,4] % Simulation of Fiedler value change when the weight tends to infinity
K=[2,4,5]
n=length(I)
varylambda2_3=[]
for eps=0:0.1:1000 
    for i=1:n
     L(I(i),K(i))=L(I(i),K(i))-eps,L(K(i),I(i))=L(K(i),I(i))-eps,L(I(i),I(i))=L(I(i),I(i))+eps,L(K(i),K(i))=L(K(i),K(i))+eps 
    end
lmuda2=sort(eig(L))
varylambda2_3=[varylambda2_3,lmuda2(2)] % Store changed Fiedler values
L=L1
end
x=0:0.1:1000

loglog(x,varylambda2_3)
hold on

%Step 4: Limit solution and simulation of Network 4
X=[2,-3/2,-1/sqrt(2),0;-3/2,2,-1/sqrt(2),0;-1/sqrt(2),-1/sqrt(2),4,-2/sqrt(2);0,0,-2/sqrt(2),1] %Limiting value
lambda2=eig(X)
lim_2=lambda2(2)

I=[1,3,6] % Simulation of Fiedler value change when the weight tends to infinity
K=[2,4,7]
n=length(I)
varylambda2_4=[]
for eps=0:0.1:1000 
    for i=1:n
     L(I(i),K(i))=L(I(i),K(i))-eps,L(K(i),I(i))=L(K(i),I(i))-eps,L(I(i),I(i))=L(I(i),I(i))+eps,L(K(i),K(i))=L(K(i),K(i))+eps 
    end
lmuda3=sort(eig(L))
varylambda2_4=[varylambda2_4,lmuda3(2)] % Store changed Fiedler values
L=L1
end
x=0:0.1:1000

loglog(x,varylambda2_4)
hold on 

% Step 5: Mark two limiting values.
line([0,1000],[lim_1,lim_1])
hold on
line([0,1000],[lim_2,lim_2])
