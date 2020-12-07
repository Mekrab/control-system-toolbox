% Output characteristics of a BJT
% Declare values to go into trans.m file and compute values
clc
clear
Rb=500e3;
VCEsat=0.2;
B=150;
Vbe=0.75;
Rc=1e3;
for VBB=1:10
 Vcc=0;
 for i=1:20
 [Ib,Ic(i),Ie,VCE(i)]=trans(Vcc,VBB,Rc,Rb,Vbe,B,VCEsat);
 Vcc=Vcc+1
 end

 plot(VCE,Ic)
 line([0 20],[.002 0],'LineWidth',1)
 xline(10,'--r')
 hold on
 xlabel('Collector Emmiter Voltage (V)')
 ylabel('Collector Emmiter Current (A)')
 title('Output Characteristics of BJT','FontSize',12)
 axis([0 20 0 .003])
end