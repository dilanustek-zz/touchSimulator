
function drawFunc(t, mat)

% Given time t, finds the changes at that time
pollNow = mat(t,:);
pollWas = mat(t-1,:);
pollDiff = pollNow - pollWas;
pollDiffMat = vec2mat(pollDiff,4)

matL = pollDiffMat .* -1000;   % Make numbers more readable+flip values

% Draw data for a given time t
m = 255;                        % m is the max difference value
map = zeros(m , 3);

T = [255,   255,   255  %white
     255,   248,    6   %yellow
     0,     255,    0   %green
     0,     0,     255  %blue
     255,   0,      0   %red
     0, 0, 0]./m;     %black 

 x = [0
     20     % yellow -> proximity
     100    % green -> closer prox
     170       % blue -> touch
     220    % red -> pressure
     255]; 
 
 map = interp1(x/m,T,linspace(0,1,m));
 
figure;
image(matL)
colormap(map);
colorbar;

theMat = matL;

textStrings = num2str(theMat(:),'%0.1f'); 
textStrings = strtrim(cellstr(textStrings));
[x,y] = meshgrid(1:4);
hStrings = text(x(:),y(:),textStrings(:),...
                'HorizontalAlignment','center');
set(gca,'XTick',1:5,...                        
        'XTickLabel',{'A','B','C','D'},... 
        'YTick',1:5,...
        'YTickLabel',{'A','B','C','D'},...
        'TickLength',[0 0]);


    

end