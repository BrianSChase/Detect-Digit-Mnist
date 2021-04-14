function result = classify_digit_hu(digit)

digit = (digit > 0);



%% Moments from input image (digit)
digit_moments = zeros(1,7);
digit_moments(1,1) = hu_moment(digit,1);
digit_moments(1,2) = hu_moment(digit,2);
digit_moments(1,3) = hu_moment(digit,3);
digit_moments(1,4) = hu_moment(digit,4);
digit_moments(1,5) = hu_moment(digit,5);
digit_moments(1,6) = hu_moment(digit,6);
digit_moments(1,7) = hu_moment(digit,7);



%% Calculate distances
dist = zeros(5000,7);
load('training_moments_hu.mat','moment','labels');

for i = 1:5000
    for j = 1:7
        dist(i,j) = sqrt(sum(sum((digit_moments(1,j) - moment(i,j))^2)));
    end
end

%% Find smallest distance
sum_dist = sum(dist, 2);     
        
[x,digit_id] = min(sum_dist);

result = labels(1,digit_id);