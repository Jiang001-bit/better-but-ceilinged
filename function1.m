function dx=function1(t,x)

A1=zeros(15) %This value of 0 means that all edges are not controlled.
c=1;
x=reshape(x,[3+15,15])
for i=1:15 
    Dx(1,i)=10*(x(2,i)-x(1,i)-(-3/4*x(1,i)+0.5*(abs(x(1,i)+1)-abs(x(1,i)-1))))+c*sum(x(i+3,:).*(x(1,:)-x(1,i)))% The first dimensional state of a node
    Dx(2,i)=x(1,i)-x(2,i)+x(3,i)+c*sum(x(i+3,:).*(x(2,:)-x(2,i))) %The second dimensional state of a node
    Dx(3,i)=-18*x(2,i)+c*sum(x(i+3,:).*(x(3,:)-x(3,i)))  %The third dimensional state of a node
    for j=1:15
        Dx(j+3,i)=50*A1(j,i)*(x([1,2,3],j)-x([1,2,3],i)).'*[1,0,0;0,1,0;0,0,1]*(x([1,2,3],j)-x([1,2,3],i))  %Weight evolution of edges
    end
end
dx=Dx(:);  

