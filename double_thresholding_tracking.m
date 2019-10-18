function img_threshold = double_thresholding_tracking(img, non_max_supp)

% Double Thresholding

threshold_low = mean(mean(non_max_supp)); % low threshold 
threshold_high = 4 * mean(mean(non_max_supp)); % high threshold
% high thresholded logical image contains strong edges.
img_threshold_high = non_max_supp > threshold_high; 

% low and high thresholded potential(weak) edges
img_threshold_low = non_max_supp > threshold_low & non_max_supp < threshold_high; 

img_threshold = img_threshold_high;

for i = 2:size(img) - 1
    for j = 2:size(img) - 1
        if ((img_threshold_low(i, j) == 1) && ((img_threshold_high(i-1, j-1) || img_threshold_high(i, j-1) || img_threshold_high(i+1, j-1)...
              || img_threshold_high(i-1, j) || img_threshold_high(i+1, j) || img_threshold_high(i-1, j+1) || ...
              img_threshold_high(i, j+1) || img_threshold_high(i+1, j+1)) == 1))
          img_threshold(i,j) = 1;      
        end
    end
end

end %function