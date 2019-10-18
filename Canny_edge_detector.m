%% Canny Edge Detector
%{
1- Convert RGB image to Grayscale
2- Smooth the Grayscale image
3- Find the gradients
4- Non-max suppression
5- Double threshloding
6- Edge tracking by hysteresis
%}
clear all;
close all; clc
%% Reading all images from image directory
img_dir = 'images';
img_files = [dir(fullfile(img_dir, '*.jpg')); dir(fullfile(img_dir, '*.JPG')); ...
            dir(fullfile(img_dir, '*.png'))];
imgs = {};
for ii = 1:length(img_files)
    imgs{ii, 1} = imread(fullfile(img_dir, img_files(ii).name));
end %for
        
%% main pipeline
% convert images to Grayscale


% Define standard deviation for gaussian smoothing filter
std_gaussian = 2;

% x_derivative_gauss = Sx_gaussian(std_gaussian);
% y_derivative_gauss = Sy_gaussian(std_gaussian);

[x_derivative_gauss, y_derivative_gauss] = gaussian_derivative(5, 3);

comp = {};
for ii = 1:length(imgs)
    gray_img = im2gray(imgs{ii});
    %gray_img = imgaussfilt(gray_img_, 2);
    
    grad_x = img_conv(gray_img ,(x_derivative_gauss));
    grad_y = img_conv(gray_img ,(y_derivative_gauss));
    [Gmag, Gdir] = imgradient(gray_img,'sobel');
    grad_mag = sqrt(grad_x .^ 2 + grad_y .^ 2);
    grad_mag=(grad_mag - min(min(grad_mag))) / (max(max(grad_mag)) - min(min(grad_mag))); 
    
    % edge directions in degrees between -180+180
    edge_dir=atan2d(grad_y,grad_x); 
    comp{1, ii} = Gmag;
    comp{2, ii} = grad_mag;
    comp{3, ii} = Gdir;
    comp{4, ii} = edge_dir;
    
    non_max_supp = non_max_suppression(gray_img, grad_mag, edge_dir);
%     non_max_supp = non_max_suppression(gray_img, Gmag, Gdir);
    img_tracked = double_thresholding_tracking(gray_img, non_max_supp);
    figure()
    imshow(img_tracked)
end %for










       
        
