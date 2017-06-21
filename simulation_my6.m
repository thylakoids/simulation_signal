function y=simulation_my6(input)
input_trans=[input   1 0 1 2 0 2 3 0];
y=apoptosis(input_trans)/(2+sum(input));
end
