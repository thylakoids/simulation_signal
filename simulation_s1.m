close all
clear all
%hill equation prameter
c=1.8;
b=2;
d=1;
fdata=readtable('fig1_sparse.csv');
data=fdata;
data.type=data.type.*rand(size(data.type))*c;%edge weight
outputs=[];
for population=1:50

member=zeros(37,1);
input=rand(11,1)*c;
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
outputs(population)=nodes_activities(end);
end
subplot(121)
histogram(outputs,50,'Normalization','pdf')
subplot(122)
ksdensity(outputs,'support','positive','function','pdf')