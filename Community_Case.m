
%Subtitle: Control simulation of community network, corresponding to figure 4 in the paper. 

%Remarks: This code can simulate the edge pinning control of any network. However, the adjacency matrix A and the number N of network size need to be given manually. We uploaded the A we used.

% Step 1: Get the different potentials of the network.

N=15
A %A_4
deta=sum(A,2);
L=diag(deta)-A
L1=L

lambda=sort(eig(L))
lambda2=lambda(2) %0-potential
lambda3=lambda(3) %1-potential
lambda4=lambda(4) %2-potential


% Step 2: Edge-based pinning control (Corresponding to no controller, control 1-nullity edge-set and control 2-nullity edge-set respectively.)

ave=1 %Adjust it to ave=20 to get the result in the paper. Because it takes a long time to run 20 times, here we take 1 time as an example. 

XY1=zeros(201,270)
XY2=zeros(201,270)
XY3=zeros(201,270)
for i=1:ave 
    chuzhi1=[(rand(3,N)-0.5)*10;A] % Initial value range
    [t1,xy1]=ode23(@(t,x)function1(t,x),[0:0.1:20],chuzhi1) %no controller
    [t2,xy2]=ode23(@(t,x)function2(t,x),[0:0.1:20],chuzhi1) %control 1-nullity edge-set
    [t3,xy3]=ode23(@(t,x)function3(t,x),[0:0.1:20],chuzhi1) %control 2-nullity edge-set
    XY1=XY1+xy1
    XY2=XY2+xy2
    XY3=XY3+xy3
end
xy1=XY1/ave %Results are averaged. The time series of each node evolution is stored.
xy2=XY2/ave
xy3=XY3/ave


%Step 2.1: (Without control) 
%Get the average state of the all nodes, that is, the synchronous state. And calculate the error state of each node and then draw a picture.


N=15
XY=0
i=1
while i<271 
    XY=XY+xy1(:,i)
    i=i+18  
end
x1ba_1=XY/N %the average state

XY=0
i=2
while i<271
    XY=XY+xy1(:,i)
    i=i+18
end
x1ba_2=XY/N %the average state

XY=0
i=3
while i<271
    XY=XY+xy1(:,i)
    i=i+18
end
x1ba_3=XY/N %the average state


t1=[0:0.1:20]
t2=[0:0.1:20]
t3=[0:0.1:20]
c=[168/255,109/255,155/255;168/255,109/255,155/255;168/255,109/255,155/255;168/255,109/255,155/255;168/255,109/255,155/255;235/255,192/255,104/255;235/255,192/255,104/255;235/255,192/255,104/255;235/255,192/255,104/255;235/255,192/255,104/255;157/255,167/255,85/255;157/255,167/255,85/255;157/255,167/255,85/255;157/255,167/255,85/255;157/255,167/255,85/255;157/255,167/255,85/255]


i=1 % Calculate the error state of each node and draw a picture.
j=1
figure;
while i<271
    plot(t1,sqrt((xy1(:,i)-x1ba_1).^2+(xy1(:,i+1)-x1ba_2).^2+(xy1(:,i+2)-x1ba_3).^2),'LineWidth',2,'color',c(j,:)),hold on
    i=i+18
    j=j+1
end

%Step 2.2: (control 1-nullity edge-set) Get the average state of the network, that is, the synchronous state. And calculate the error state of each node and draw a picture.

XYY=0
i=1
while i<271 
    XYY=XYY+xy2(:,i)
    i=i+18  
end
x2ba_1=XYY/N %the average state

XYY=0
i=2
while i<271
    XYY=XYY+xy2(:,i)
    i=i+18
end
x2ba_2=XYY/N %the average state

XYY=0
i=3
while i<271
    XYY=XYY+xy2(:,i)
    i=i+18
end
x2ba_3=XYY/N %the average state


i=1 % Calculate the error state of each node and draw a picture.
j=1
figure;
while i<271
    plot(t2,sqrt((xy2(:,i)-x2ba_1).^2+(xy2(:,i+1)-x2ba_2).^2+(xy2(:,i+2)-x2ba_3).^2),'LineWidth',2,'color',c(j,:)),hold on
    i=i+18 
    j=j+1
end

%Step 2.3: (control 2-nullity edge-set) Get the average state of the network, that is, the synchronous state. And calculate the error state of each node and draw a picture.

XYYY=0
i=1
while i<271 
    XYYY=XYYY+xy3(:,i)
    i=i+18  
end
x3ba_1=XYYY/N %the average state

XYYY=0
i=2
while i<271
    XYYY=XYYY+xy3(:,i)
    i=i+18
end
x3ba_2=XYYY/N %the average state

XYYY=0
i=3
while i<271
    XYYY=XYYY+xy3(:,i)
    i=i+18
end
x3ba_3=XYYY/N %the average state


i=1 % Calculate the error state of each node and draw a picture.
j=1
figure;
while i<271
    plot(t3,sqrt((xy3(:,i)-x3ba_1).^2+(xy3(:,i+1)-x3ba_2).^2+(xy3(:,i+2)-x3ba_3).^2),'LineWidth',2,'color',c(j,:)),hold on
    i=i+18 
    j=j+1
end