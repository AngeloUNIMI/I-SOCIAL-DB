%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script plots the iris images, segmentation masks, and circles
% approximating the iris boudaries for images of I-SOCIAL-DB.
% Please modify the following variables:
%  - dbDir = the root directory of I-SOCIAL-DB;
%  - idIndividual = the numeric identifier of the considered individual;
%  - nSample = the numeric identifier of the considered sample;
% Authors: Ruggero Donida Labati, Angelo Genovese, Vincenzo Piuri,
% Fabio Scotti, and Sarvesh Vishwakarma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear 
clc

% Input parameters
dbDir = cd;
idIndividual = 1;
nSample = 1;

% Compute the sample name
baseName = sprintf('%03.0f_%03.0f', idIndividual, nSample);

eye(1) = 'L';
eye(2) = 'R';

figure('units','normalized','outerposition',[0 0 1 1])
countPlot = 1;
for i = 1 : length(eye)
    
    % Iris image
    img = imread([dbDir, '\ocular_images\', baseName, '_', eye(i),'.jp2']);
    subplot(2,4, countPlot)
    imshow(img);
    title([baseName, '_', eye(i)], 'Interpreter', 'none')
    axis equal;
    countPlot = countPlot+1;
    
    % Iris mask
    maskImg = imread([dbDir, '\binary_masks\', baseName, '_', eye(i),'_binmask.png']);
    subplot(2,4, countPlot)
    imshow(maskImg);
    title([baseName, '_', eye(i), ' binary mask'], 'Interpreter', 'none')
    axis equal;
    countPlot = countPlot+1;
    
    % Plot the binary mask over the ocular image
    redImg = img(:,:,1);
    redChannel = redImg;
    redChannel(im2bw(maskImg)) = 255;
    colorImg(:,:,1) = redChannel;
    colorImg(:,:,2) = redImg;
    colorImg(:,:,3) = redImg;
    subplot(2,4, countPlot)
    imshow(colorImg);
    title([baseName, '_', eye(i), ' iris region'], 'Interpreter', 'none')
    axis equal;
    countPlot = countPlot+1;
    
    % Circles approximating the iris boundaries
    circData = load([dbDir, '\circles\', baseName, '_', eye(i),'_circles.txt']);
    xC_Inner = circData(1);
    yC_Inner = circData(2);
    r_Inner = circData(3);
    xC_Outer = circData(4);
    yC_Outer = circData(5);
    r_Outer = circData(6);
    subplot(2,4, countPlot)
    imshow(redImg);
    hold on
    plotCircle(xC_Inner, yC_Inner, r_Inner, 360, 'g', 2)
    plotCircle(xC_Outer, yC_Outer, r_Outer, 360, 'r', 2)
    title([baseName, '_', eye(i), ' circles'], 'Interpreter', 'none') 
    countPlot = countPlot+1;
    
end





function plotCircle(xc, yc, radius, numPoints, plotColor, lWidth)
THETA = linspace(0,2 * pi, numPoints);
RHO = ones(1,numPoints)*radius;
[X, Y] = pol2cart(THETA, RHO);
X= X + xc;
Y= Y + yc;
plot(X, Y, plotColor, 'LineWidth', lWidth);
axis equal;
end
