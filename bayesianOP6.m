clc
clear
close all
global hyp2 inf meanfunc covfunc likfunc inputs outputs
%%% data
outputs=[];
inputs=[];
m=3;
for n=1:2
input=[rand(1,m)];
output=simulation_my6(input);
outputs=[outputs ;output];
inputs=[inputs;input];
end
bar(outputs)
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%plot prameter
Msize=20;
Lwidth=1.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


meanfunc =[];                    % empty: don't use a mean function
covfunc = @covSEiso;              % Squared Exponental covariance function
likfunc = @likGauss;              % Gaussian likelihood
prior.lik = {@priorDelta};        %prior 
inf = {@infPrior,@infExact,prior};    %inf
hyp = struct('mean', [], 'cov', zeros(1,2),'lik',log(0.001));
hyp2 = minimize(hyp, @gp, 100, inf, meanfunc, covfunc,likfunc, inputs, outputs);

%%% max expected improvement
A=eye(size(inputs,2));
A=[A;-A];
b1=ones(size(inputs,2),1)*1;%max 
b2=ones(size(inputs,2),1)*0;%min
B=[b1;-b2];
EImax_now=100;
for loop=1:10
x0=rand(1,size(inputs,2));
[EImax_x,EImax]=fmincon(@(t)-1*expectedImprovement(t),x0,A,B);
if EImax<EImax_now
    EImax_now=EImax;
    EImax_x_now=EImax_x;
end
end
EImax_x_now
simulation_my6(EImax_x_now)
pause on
for tmp=1:20
    pause
    bayesianOP61
end