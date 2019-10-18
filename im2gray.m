%http://www.rapidtables.com/convert/color/rgb-to-hsl.htm
%according to Rec.ITU-R BT.601-7
function [grayIm]=im2gray(Im)
weights = [0.299 0.587 0.114]; % R G B 
Im=im2double(Im);
if size(Im,3)==3
%% RGB to HSL convertion as an alternative method
% R_=Im(:,:,1)/255;
% G_=Im(:,:,2)/255;
% B_=Im(:,:,3)/255;
% Cmax=max(max(R_,G_),B_);
% Cmin=min(min(R_,G_),B_);
% L=(Cmax+Cmin)/2;
%%
    grayIm=zeros(size(Im,1),size(Im,2));
    for i=1:length(weights)
    grayIm=grayIm+Im(:,:,i)*weights(i);
    end
else
grayIm=Im;
display('Image is already graylevel')
end
end