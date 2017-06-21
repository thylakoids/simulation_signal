clear all
w12=0.367;
w23=0.864;
w34=0.754;
w45=0.617;
w51=0.718;
w15=0.828;
a1_t=0;
a2_t=0;
a3_t=0;
a4_t=0;
a5_t=0;
S=1;
%%%
a1_ts=[];
for t=1:300
    
a1_t1=S+w51*a5_t;
a2_t1=w12*a1_t;
a3_t1=w23*a2_t;
a4_t1=w34*a3_t;
a5_t1=w15*a1_t+w45*a4_t;

%update
a1_t=a1_t1;
a2_t=a2_t1;
a3_t=a3_t1;
a4_t=a4_t1;
a5_t=a5_t1;

a1_ts=[a1_ts;a1_t];

end
plot(a1_ts)
