%Training for classify_digit_cm



moment = zeros(5000,8);
labels = zeros(1,5000);

load_mnist;

for i = 1:5000
        input = mnist_digits(:,:,i);
        labels(1,i) = mnist_labels(i);
        input = (input > 0);
        moment(i,1) = central_moment(input,0,0);
        moment(i,2) = central_moment(input,1,0);
        moment(i,3) = central_moment(input,0,1);
        moment(i,4) = central_moment(input,1,1);
        moment(i,5) = central_moment(input,1,2); 
        moment(i,6) = central_moment(input,2,1);
        moment(i,7) = central_moment(input,2,2);       
        moment(i,8) = central_moment(input,3,0);
    
end



save('training_moments.mat','moment','labels'); 