

function [patterns] = generate_patterns(patterns, patterns_indices, nb_pat, min_size, weight)
    for i=1:nb_pat
        pattern_size = [min_size+randi(2*min_size) min_size+randi(2*min_size)];
        pattern = ones(pattern_size(1), pattern_size(2));
        r = pattern_size/2;
        for j=1:pattern_size(1)
            for k=1:pattern_size(2)
                x2 = (j-floor(pattern_size(1)/2))^2;
                y2 = (k-floor(pattern_size(2)/2))^2;
                a2 = (1*r(1))^2;
                b2 = (1*r(2))^2;
                coef = x2/a2 + y2/b2;
    %             pattern(j,k) = pattern(j,k) - coef;
                pattern(j,k) = pattern(j,k) - sqrt(coef);
            end
        end

        pattern(:,:) = max(pattern(:,:),0);
        pattern(:,:) = min(pattern(:,:),1);
        pattern(:,:) = weight*pattern(:,:);
        patterns = setfield(patterns,patterns_indices(i),pattern);
    end

end