
function result = hu_moment(shape,m)



%% Get M00, M10, M01 to get the averages of x and y to be used in central moment

%Get Area (M00)
[r,c] = size(shape);
M00 = 0;
i = 0;
j = 0;
for x = 1:r
for y = 1:c
M00 = M00 + x^i * y^j * shape(x, y);
end
end


n20 = normalized_moment(shape, 2,0);
n02 = normalized_moment(shape, 0,2);
n11 = normalized_moment(shape, 1,1);
n30 = normalized_moment(shape, 3,0);
n12 = normalized_moment(shape, 1,2);
n21 = normalized_moment(shape, 2,1);
n03 = normalized_moment(shape, 0,3);





%% Hu Moment calculate

I1 = n20 + n02;
I2 = (n20 - n02)^2 + (2*n11)^2;
I3 = (n30 - (3*n12))^2 + ((3*n21) - n03)^2;
I4 = (n30 + n12)^2 + (n21 + n03)^2;
I5 = (n30-(3*n12))*(n30+n12)*((n30+n12)^2 - 3*(n21+n03)^2 + ((3*n21)-n03)*...
(n21+n03)*(3*(n30+n12))^2 - (n21 + n03)^2);
I6 = (n20-n02)*((n30+n12)^2 - (n21+n03)^2) + (4*n11)*(n30+n12)*(n21+n03);
I7 = ((3*n21) - n03)*(n30+n12)*((n30+n12)^2 - 3*(n21+n03)^2)-(n30-(3*n12))*...
    (n21+n03)*(3*(n30+n12)^2 - (n21+n03)^2);

%% Get function result
if(m == 1)
    result = I1;
end
if(m == 2)
    result = I2;
end
if(m == 3)
    result = I3;
end
if(m == 4)
    result = I4;
end
if(m == 5)
    result = I5;
end
if(m == 6)
    result = I6;
end
if(m == 7)
    result = I7;
end
