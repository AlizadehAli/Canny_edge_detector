function non_max_supp = non_max_suppression(img, grad_mag, edge_dir)

non_max_supp = grad_mag;

for i = 2:size(img, 1) - 1
    for j = 2:size(img, 2) - 1
        if ((edge_dir(i, j) < 22.5 && edge_dir(i, j) >= -22.5) || ...
                (edge_dir(i, j) >= 157.5 && edge_dir(i, j) < -157.5)) %east-west
        
            if(grad_mag(i, j) < grad_mag(i, j+1) || grad_mag(i, j) < grad_mag(i, j-1))
                non_max_supp(i, j) = 0;
            end %if
      
        end %if
              
         if ((edge_dir(i, j) >= 22.5 && edge_dir(i, j) < 67.5) || ...
                 (edge_dir(i, j) <= -22.5 && edge_dir(i, j) > -67.5) ) %northeast-southwest
            if(grad_mag(i, j) < grad_mag(i-1, j+1) || grad_mag(i, j) < grad_mag(i+1, j-1))
                non_max_supp(i, j) = 0;
            end %if
         end %if
        
         if ((edge_dir(i, j) < 112.5 && edge_dir(i, j) >= 67.5) || ...
                 (edge_dir(i, j) <= -67.5 && edge_dir(i, j) > -112.5 )) %north-south
            if (grad_mag(i, j) < grad_mag(i-1, j) || grad_mag(i, j) < grad_mag(i+1, j))
                non_max_supp(i,j) = 0;
            end %if
         end %if
         
         if ((edge_dir(i, j) >= 112.5 && edge_dir(i, j) < 157.5) || ...
                 (edge_dir(i, j) > -157.5 && edge_dir(i, j) <= -112.5)) %northwest-southeast
            if (grad_mag(i, j) < grad_mag(i-1, j-1) || grad_mag(i, j) < grad_mag(i+1, j+1))
                non_max_supp(i,j) = 0;
            end %if
         end %if
    end %for
end %for

end %function