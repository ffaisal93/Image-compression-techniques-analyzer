function [mae] = meanAbsoluteError(signal1, signal2)

%% this function calculates meanAbsoluteError
% signal1 is original image
% signal2 is compressed image

originalRowSize = size(signal1,1);
originalColSize = size(signal1,2);

signal1 = signal1(:);
signal2 = signal2(:);

mae = sum(abs(signal1 - signal2))/(originalRowSize*originalColSize);

end

