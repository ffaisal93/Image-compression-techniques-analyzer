clear all; close all; clc;

%%
% 1.This file use three standard test images to compare 
%   different transform coding techinques
% 2.Here we used lena.png,airplane.png and baboon.png as  standard test image
% 3.Then we compressed these images using DCT,FFT,DWT 
%   and recorded each PSNR ratio original and compressed image
% 4.As compression ratio we used 20,40,60 & 80 percents


%% This loop runs 3 times as there are 3 test images

for ll=1:3
 
%% read image    
if(ll==1)
    str='lena.png'   
    original=imread(str);
end


if(ll==2)
    str='airplane.png' 
    original=imread(str);
end

if(ll==3)
    str='baboon.png' 
    original=imread(str);
end



%% For each image this loop performs compression operations for different compression rate
for i=1:4
   
    rate=i*20; %compression ratio/rate
    x(1,i)=rate; 
   
    %% Image Compression using DCT
    RGB_dct(:,:,:,i)=dct_cmp(original,rate);
    
     psnr_Value_dct(i) = PSNR(original, RGB_dct(:,:,:,i));%calculate PSNR
     
     
   %% Image Compression using FFT
   
    RGB_fft(:,:,:,i)=fft_cmp(original,rate);
   psnr_Value_fft(i) = PSNR(original, RGB_fft(:,:,:,i));%calculate PSNR
     
    %% Image Compression using DWT
   
    RGB_dwt(:,:,:,i)=dwt_cmp(original,rate);
    psnr_Value_dwt(i) = PSNR(original, RGB_dwt(:,:,:,i));%calculate PSNR
 
    
end

   %% plot PSNR of different images using DCT
if(ll==1) %for lena.png
    subplot(2,2,1)
  plot(x, psnr_Value_dct,'r-o') 
 
end

if(ll==2) %for airplane.png
    subplot(2,2,1)
  plot(x, psnr_Value_dct,'g-*') 
 
end

if(ll==3) %for baboon.png
    subplot(2,2,1)
  plot(x, psnr_Value_dct,'b-+') 
 title('PSNR-DCT');
end

hold on;

 Legend=cell(3,1)%  three positions 
 Legend{1}=' lena.png' ;
 Legend{2}=' airplane.png';
 Legend{3}=' baboon.png';

 legend(Legend);

 
%% plot PSNR of different images using FFT 

if(ll==1)%for lena.png
    subplot(2,2,2)
  plot(x, psnr_Value_fft,'r-o') 
 
end

if(ll==2) %for airplane.png
    subplot(2,2,2)
  plot(x, psnr_Value_fft,'g-*') 
 
end

if(ll==3) %for baboon.png
    subplot(2,2,2)
  plot(x, psnr_Value_fft,'b-+') 
  title('PSNR-FFT');
 
end

hold on;

 Legend=cell(3,1)%  three positions 
 Legend{1}=' lena.png' ;
 Legend{2}=' airplane.png';
 Legend{3}=' baboon.png';
 legend(Legend);
  
 

 %% plot PSNR of different images using DWT 
 
if(ll==1) %for lena.png
    subplot(2,2,3)
  plot(x, psnr_Value_dwt,'r-o') 
 
end

if(ll==2) %for airplane.png
    subplot(2,2,3)
  plot(x, psnr_Value_dwt,'g-*') 
 
end

if(ll==3) %for baboon.png
    subplot(2,2,3)
  plot(x, psnr_Value_dwt,'b-+') 
  title('PSNR-DWT');
 
end

hold on;

 Legend=cell(3,1)%  three positions 
 Legend{1}=' lena.png' ;
 Legend{2}=' airplane.png';
 Legend{3}=' baboon.png';
 legend(Legend);
  


end
   

