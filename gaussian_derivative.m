function [Sx, Sy] = gaussian_derivative(w, sd)

[x,y] = meshgrid(-floor(w/2):floor(w/2), -floor(w/2):floor(w/2));
G = exp(-(x.^2+y.^2)/(2*sd^2))/(2*pi*(sd^2));
G_norm=G/sum(G(:));
Sx = -x.*G_norm/(sd^2);
Sy = -y.*G_norm/(sd^2);

end
