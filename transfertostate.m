
% State representation of the system

num = [6]; % This is the upper term 
den = [ 1 5   -7   10]; % This is the lower term  

[A,B,C,D] = tf2ss(num,den)