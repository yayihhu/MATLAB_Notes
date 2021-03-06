function [imagePoints, worldPoints] = generatePointPairs(imageFileNames)
% Generate imagePoints and worldPoints used in estimateCameraParameters.

nImageFileNames = size(imageFileNames,2);
imagePoints = NaN(4, 2, nImageFileNames);
worldPoints = NaN(4, 2);
for j = 1:4
    fprintf('Input coordinate of point %d in real world \n',j);
    worldPoints(j,:,1) = [input('x \n') ...
        input('y \n')];
end
for iImageFileName = 1:nImageFileNames
    I = imread(cell2mat(imageFileNames(iImageFileName)));
    imshow(I);
    [x,y] = ginput(4);
    imagePoints(:,:,iImageFileName) = [x y];
end
