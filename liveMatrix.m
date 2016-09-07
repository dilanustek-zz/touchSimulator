close all
disp('Opening port..')
com = serial('/dev/tty.usbmodem1411', 'BAUD', 9600);
fopen(com);

%InputBufferSize=100;
total_samples=2; % the script reads this many samples and then stops.
power=4; % # of powerpins on board
ground=4; % # of groundpins on board
buf=(power*ground*2)+9; % size of buffer = grid points x 2 (upper and lower bound) + header (4), timestamp (4) and checksum (1)
data=zeros(power,ground,total_samples); % the pressure map data, arranged in a grid. the third dimension is time.
timestamp=zeros(total_samples,1); % time values

disp('Reading data')

k=1;
tic;


while(k<total_samples)
    
 fwrite(com, double('A'));
 A=fread(com, 16, 'double');
 %C=char(A)
 
 k = k+1;
    
end

%fileID = fopen(fileName,'at');
%fmt = '\nduration: %d\n';
%fprintf(fileID,fmt, toc);
%fclose(fileID);

toc;
fclose(com);
delete(com);