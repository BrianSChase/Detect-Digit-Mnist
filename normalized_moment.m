function result = normalized_moment(shape, i, j)





%% Get M00, M10, M01 to get the averages of x and y to be used in central moment

%Get Area (M00)
shape = (shape > 0);
[r,c] = size(shape);
M00 = 0;
i0 = 0;
j0 = 0;
for x = 1:r
for y = 1:c
M00 = M00 + x^i0 * y^j0 * shape(x, y);
end
end


%% Normalized Moment
CM = central_moment(shape, i, j);
NM = (CM / (M00^(1+ ((i+j)/2))));

result = NM;
