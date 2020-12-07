% Input characteristics of a BJT
% Modeling Beta, Beta forward, thermal voltage, sat current
% Alpha off Beta, emmiter current, Base Emitter voltage, Emitter Current

beta_f=150; 
beta_r=0.5;
vt=.025; 
is=166.78e-15;
alpha_f=beta_f/(1+beta_f);
alpha_r = beta_r/(1+beta_r);
ies=is/alpha_f;
vbe=0.3:0.01:0.75;
ics=is/alpha_r;
m=length(vbe)
for i = 1:m
 ifr(i) = ies*exp((vbe(i)/vt)-1);

 ir1(i) = ics*exp((-1.0/vt)-1);
 ie1(i) = abs(-ifr(i) + alpha_r*ir1(i));
end
plot(vbe,ie1)
text(0.5,0.4, 'Vce>1V','FontSize',12)
title('Input Characteristics of BJT')
xlabel('Base Emitter voltage (V)')
ylabel('Emitter Current (A)') 
