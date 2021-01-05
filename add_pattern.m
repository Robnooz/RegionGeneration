function image = add_pattern(image, pattern, center_pos_adding, color)
    pattern_size = size(pattern);
    image_size = size(image);
    for i=1:pattern_size(1)
        for j=1:pattern_size(2)
            pos_i = i+center_pos_adding(1) - floor(pattern_size(1)/2);
            pos_j = j++center_pos_adding(2) - floor(pattern_size(2)/2);

            % Check if we are not out of image boundaries
            if [pos_i>=1 pos_j>=1 pos_i<=image_size(1) pos_j<=image_size(2)] == [1 1 1 1]
                % Store image pixel in a pixel variable
                pixel = [image(pos_i,pos_j,1) image(pos_i,pos_j,2) image(pos_i,pos_j,3)];
                % Add color*pattern(i,j) to the pixel
                % And make it so that pixel is not lower than 0 and bigger
                % than 1
%                 pixel = max([0 0 0],min([1 1 1],max(pixel,color*pattern(i,j))));
                pixel = max([0 0 0],min([1 1 1],pixel + color*pattern(i,j)));
                image(pos_i,pos_j,1)=pixel(1); image(pos_i,pos_j,2)=pixel(2); image(pos_i,pos_j,3)=pixel(3);
            end
        end
    end
    
end