clear all; close all; clc;

%%read test image
original=imread('lena.png');
original=imresize(original,[140,200]);
original = double(original)/255;

%% read image from file //to do this comment out this block and cooment in upper block
%name = input('Image name and format % (ex:image.jpg): ','s');
%original=imread(name);
%original = double(original)/255;



%% loop to calculate all operation for different compression ratio starting from 10 to 90
for i=1:9
    rate=i*10; %compression ratio/rate
    x(1,i)=rate;
   
    %% Image Compression using DCT

    RGB_dct(:,:,:,i)=dct_cmp(original,rate);

    
    %% Image Compression using FFT

    RGB_fft(:,:,:,i)=fft_cmp(original,rate);


    %% Image Compression using DWT

    RGB_dwt(:,:,:,i)=dwt_cmp(original,rate);

    

end



%%plot result
%there will be total nine ploted image of compression ratio-1050,90 on  
%compressed image using DCT,FFT,DWT transform coding

k=1;
for i=1:4:9
   subplot(3,3,k);
   imshow(RGB_dct(:,:,:,i));
   str=sprintf('%2.0f percent dct',i*10);
   title(str);
    
   subplot(3,3,k+3);
   imshow(RGB_fft(:,:,:,i));
   str1=sprintf('%2.0f percent fft',i*10);
   title(str1);
   
   subplot(3,3,k+6);
   imshow(RGB_dwt(:,:,:,i));
   str2=sprintf('%2.0f percent dwt',i*10);
   title(str2);
   k=k+1
   
end



