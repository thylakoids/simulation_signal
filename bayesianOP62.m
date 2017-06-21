clear
clc
yy=[];
for n=1:10
result=0; 
mytry=0;
while result<0.8
input=[rand(1,3)];
mytry=mytry+1
result=simulation_my6(input);
end
yy=[yy;mytry];
end