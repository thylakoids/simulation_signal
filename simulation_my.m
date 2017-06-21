outputs=[];
for n=1:500
input=[rand(1,3)];
output=simulation_my6(input);
outputs=[outputs output];
end
subplot(121)
histogram(outputs,50)
xlabel('Output')
ylabel('Count')
subplot(122)
ksdensity(outputs,'support','positive','function','pdf')
xlabel('Output')
ylabel('P(Output)')

