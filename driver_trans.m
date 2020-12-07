function [Ib,Ic,Ie,Vce]=trans(Vcc,Vbb,Rc,Rb,Vbe,B,VCEsat)
Ib=(Vbb-Vbe)/Rb;
ICsat=(Vcc-VCEsat)/Rc;
if Ib <= 0
 Ib=0
 Ic=0
 Ie=0
 Vce=Vcc
 disp('Cut off')
elseif (B*Ib)>= ICsat
 Ib
 Ic=ICsat
 Ie=ICsat
 Vce=VCEsat
 disp('Saturation')
else
 Ib
 Ic=B*Ib
 Ie=(B+1)*Ib
 Vce=Vcc-(Ic*Rc)
 disp('Active')
end
