function [ RGB ] = dct_cmp( original,rate )

%% Compression using Discrete Cosine Transform 

RGB=zeros(size(original));

%% Compression using Discrete Cosine Transform 

for i=1:3% This loop is used because RGB images have 3 dimensions
im=original(:,:,i);

img_dct=dct2(im);
img_pow=(img_dct).^2;
img_pow=img_pow(:);
[B,index]=sort(img_pow);%no zig-zag
B=flipud(B);
index=flipud(index);
compressed_dct=zeros(size(im));% zero matrix of original image size
m=max(index);

%%%% Determines Compression Quality
rate1=(rate*m)/100;
rate1=round(rate1);

for k=1:rate1
compressed_dct(index(k))=img_dct(index(k)); %inserting values depending on comprerssion rate
end
img_dct=idct2(compressed_dct);

RGB(:,:,i)=img_dct;

end % This loop is used because RGB images have 3 dimensions



end

