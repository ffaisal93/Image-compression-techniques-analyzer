function [mse, rmse] = RMSE2(signal1, signal2)

%% this function calculates MSE and RMSE
% signal1 is original image
% signal2 is compressed image
originalRowSize = size(signal1,1);
originalColSize = size(signal1,2);

signal1 = signal1(:);
signal2 = signal2(:);

mse = sum((signal1 - signal2).^2)./(originalRowSize*originalColSize);
rmse = sqrt(mse);

end

