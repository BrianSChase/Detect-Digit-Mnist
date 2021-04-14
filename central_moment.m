function result = central_moment(shape, i, j)



%% Get M00, M10, M01 to get the averages of x and y to be used in central

shape = (shape > 0);
%Get Area (M00)
[r,c] = size(shape);
M00 = 0;
i0 = 0;
j0 = 0;
for x = 1:r
for y = 1:c
M00 = M00 + x^i0 * y^j0 * shape(x, y);
end
end


%Get M10
M10 = 0;
i10 = 1;
j10 = 0;
for x = 1:r
for y = 1:c
M10 = M10 + x^i10 * y^j10 * shape(x, y);
end
end
avgx = M10/M00;


%Get M01
M01 = 0;
i01 = 0;
j01 = 1;
for x = 1:r
for y = 1:c
M01 = M01 + x^i01 * y^j01 * shape(x, y);
end
end
avgy = M01/M00;

%% Central Moment
CM = 0;
for x = 1:r
for y = 1:c
CM = CM + (x - avgx)^i * (y - avgy)^j * shape(x, y);
end
end

result = CM;
