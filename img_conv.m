function img_out = img_conv(img, mask)

if size(img,3)>2
img=im2gray(img);
end %if

% zero padding
padded_img = zeros(size(img,1) + size(mask,1) - 1, size(img,2) + size(mask,1)-1);
padded_img(floor(length(mask) / 2):(size(padded_img, 1) - ceil(length(mask) / 2)), ...
        floor(length(mask) /2 ):(size(padded_img, 2) - ceil(length(mask) / 2))) = img;

img_out = zeros(size(img));
for a = 1:size(img, 1)
    for b = 1:size(img,2)
        x = padded_img(a:a+size(mask,1) - 1, b:b + size(mask,1) - 1);
    img_out(a,b) = sum(sum(x .* mask));
    end
end %for

end %for

