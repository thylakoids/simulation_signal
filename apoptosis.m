function output=apoptosis(input)
if size(input,2)~=1
    input=input';
end
%hill equation prameter
c=2;
b=2;
d=1;
load fig1_sparse_fix
member=zeros(37,1);
nodes_activity=[input;member];%gene activity
ajmatrix=spconvert(data.Variables);%aj matrix
nodes_activity_next=nodes_activity;
nodes_activities=nodes_activity;
for loop=1:30
for i=12:48
    inputnodes=find(ajmatrix(:,i));
    inputnodes_activity=nodes_activity(inputnodes);
    inputedges_weight=ajmatrix(inputnodes,i);
    
    s=inputnodes_activity'*inputedges_weight;
    nodes_activity_next(i)=c*s^b/(1+d*s^b);
    if nodes_activity_next(i)<0
        nodes_activity_next(i)=0;
    end
end
nodes_activity=nodes_activity_next;
nodes_activities=[nodes_activities nodes_activity];
end
%plot(nodes_activities(end,:))
output=nodes_activities(end,end);
end