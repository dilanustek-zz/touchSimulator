%M = csvread('/Users/dilanustek/Documents/research/capData.csv', 0, 0);
M = csvread('/Users/dilanustek/Documents/OneDrive/research/code/logs/newlog.csv', 0, 1);
M = M(M~=0);
M = M';
mat = vec2mat(M,16);

% for i=3:16
%     mat(163,i) = mat(162,i);
% end

% Given time t, finds the values at that time.
pollOnce = mat(1,:);
pollOnceMat = vec2mat(pollOnce,4);

% Given time t, finds the changes at that time
pollDiff = mat(2, :) - mat(1, :);
pollDiffMat = vec2mat(pollDiff,4)


% For each cell, finds the largest drops
for p=1:16
    oneCell = mat(:,p);
    maxDrop = 0;
    maxDropPt = 1;
    for i = 1 : size(oneCell)-1
        drop = oneCell(i) - oneCell(1);
        if drop < maxDrop
            maxDrop = drop;
            maxDropPt = i;
        end
    end
    
    dropVec(p) = maxDrop;
    dropVecPt(p) = maxDropPt;

end

dropMat = vec2mat(dropVec, 4)
dropMatPt = vec2mat(dropVecPt, 4)

