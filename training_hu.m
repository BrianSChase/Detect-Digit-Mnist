%Training for classify_digit_hu


moment = zeros(5000,7);
labels = zeros(1,5000);

load_mnist;

for i = 1:5000
        input = mnist_digits(:,:,i);
        labels(1,i) = mnist_labels(i);
        input = (input > 0);
        moment(i,1) = hu_moment(input,1);
        moment(i,2) = hu_moment(input,2);
        moment(i,3) = hu_moment(input,3);
        moment(i,4) = hu_moment(input,4);
        moment(i,5) = hu_moment(input,5);
        moment(i,6) = hu_moment(input,6);
        moment(i,7) = hu_moment(input,7);

    
end



save('training_moments_hu.mat','moment','labels'); 