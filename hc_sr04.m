
% delete all serial ports from memory 
% important, if you the code is stopped without closing and deleting the
% used COM, you need to do this to open it again
delete(instrfindall);

% Init and open the serial port
s = serial('COM6', 'baudrate', 115200);
fopen(s);



points = 100;
data_period = 50; 

x = linspace(-points*data_period, 0, points);

"
y = linspace(0,0,points);

close ALL

figure;
lh = area(x,y);


axis([-points*data_period, 0, 0, 255]);
shg; %brings the figure to the front of all other windows

key = get(gcf,'CurrentKey'); 
while ( strcmp(key, 's') == 0) 
    key = get(gcf,'CurrentKey'); 

    while s.BytesAvailable == 0 
    end
    

    for k = 1:1:points-1
       y(k) = y(k+1);
    end
    y(points) = fread(s,1);
    distance = y(points)

    set(lh, 'YData',y);   
    %request the plot to be updated
    drawnow;
     
end
    
close ALL %close all open figures

fclose(s); %close serial port
delete(s); %remove serial port from memory