clear variables


image_size = [500 800];
image=zeros(image_size(1),image_size(2),3); %initialize
patterns = struct;
patterns_indices = ["a","b","c","a2","b2","c2"];
patterns_colors = [[1 0 0];[0 1 0];[0 0 1];[1 0 0];[0 1 0];[0 0 1]];

nb_pat = 3;
min_size = 100;
weight = 1;
[patterns] = generate_patterns(patterns, patterns_indices(1:3), nb_pat, min_size, weight);
min_size = 10;
weight = 0.1;
[patterns] = generate_patterns(patterns, patterns_indices(4:6), nb_pat, min_size, weight);

% Adding big patterns
for j=1:5
    for i=1:3%size(patterns_indices,2)
    pattern = getfield(patterns,patterns_indices(i));
    color = patterns_colors(i,:);
        % Adding pattern to a random location of the image
        free_pos_found = 0;
        search_counter = 0;
        while free_pos_found==0
            center_pos_adding = [randi(image_size(1)) randi(image_size(2))];
            search_counter = search_counter+1;
            if mean(image(center_pos_adding(1), center_pos_adding(2), :))<min(mean(image,3),[],'all')+0.005
                image = add_pattern(image, pattern, center_pos_adding, color);
                free_pos_found=1;
            end
            % Stop process if we cant find a free pos
            if search_counter>=100
                disp("didnt find a free pos");
                free_pos_found = 1;
            end
        end
    end
end
% Adding small patterns
for j=1:50
    for i=4:6%size(patterns_indices,2)
    pattern = getfield(patterns,patterns_indices(i));
    color = patterns_colors(i,:);
        % Adding pattern to a random location of the image
        free_pos_found = 0;
        search_counter = 0;
        while free_pos_found==0
            center_pos_adding = [randi(image_size(1)) randi(image_size(2))];
            search_counter = search_counter+1;
            if mean(image(center_pos_adding(1), center_pos_adding(2), :))<100%min(mean(image,3),[],'all')+0.005
                image = add_pattern(image, pattern, center_pos_adding, color);
                free_pos_found=1;
            end
            % Stop process if we cant find a free pos
            if search_counter>=100
                disp("didnt find a free pos");
                free_pos_found = 1;
            end
        end
    end
end

figure, imshow(image)
[X,Y] = meshgrid(1:size(image(:,:,1),1),1:size(image(:,:,1),2));
figure, mesh(sum(image,3))































