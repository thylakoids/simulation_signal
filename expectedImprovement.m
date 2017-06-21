function ei=expectedImprovement(xs)
global hyp2 inf meanfunc covfunc likfunc inputs outputs
[mu s2] = gp(hyp2, inf, meanfunc, covfunc, likfunc,inputs, outputs, xs);
fstar=max(outputs);
z=(mu-fstar)./sqrt(s2);
ei=(mu-fstar).*cdf('normal',z,0,1)+sqrt(s2).*pdf('normal',z,0,1);
end
