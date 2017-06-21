inputs=[inputs;EImax_x_now];
outputs=[outputs;simulation_my6(EImax_x_now)];
bar(outputs);hold on;
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
x0=rand(1,size(inputs,2))*1;
[EImax_x,EImax]=fmincon(@(t)-1*expectedImprovement(t),x0,A,B);
if EImax<EImax_now
    EImax_now=EImax;
    EImax_x_now=EImax_x;
end
end
EImax_x_now
simulation_my6(EImax_x_now)