clear all; close all; clc;

%%
% 1.This file reads an image and compress it using DCT,FFT,DWT
% 2.First it asks for image name,format(ex:image.jpg) 
%   and compression rate(1<x<100)
% 3.Then save all three compressed images to file
% 4.Then there is error calculation part 
%   where we calculate PSNR,PCC,RMSE,MAE
%   and print these values on command window



%% read image from file
name = input('Image name and format % (ex:image.jpg): ','s');
original=imread(name);
%original=imresize(original,[100,100]);
rate = input('Compression Quality % (1<x<100):  '); 
original = double(original)/255;

RGB_dct=zeros(size(original));
RGB_fft=zeros(size(original));
RGB_dwt=zeros(size(original));



%% Image Compression using DCT
RGB_dct=dct_cmp(original,rate);


%% Image Compression using FFT
RGB_fft=fft_cmp(original,rate);

%% Image Compression using DWT
RGB_dwt=dwt_cmp(original,rate);


%% PLOT ORIGINAL AND COMPRESSED IMAGES
subplot(2,2,1);
imshow(original)

title('Original image');

subplot(2,2,2);
imshow(RGB_dct);

title('DCT Compressed Image');


subplot(2,2,3);
imshow(RGB_fft);

title('FFT Compressed Image');

subplot(2,2,4);
imshow(RGB_dwt);

title('DWT Compressed Image');

%% Save to File
imwrite(RGB_dct, 'compresseddct.jpg');
imwrite(RGB_fft, 'compressedfft.jpg');
imwrite(RGB_dwt, 'compresseddwt.jpg');


%% %% Error Calculation Part 

%% PSNR
psnr_Value_dct = PSNR(original, RGB_dct);
    
psnr_Value_fft = PSNR(original, RGB_fft);
   
psnr_Value_dwt = PSNR(original, RGB_dwt);
fprintf('PSNR DCT = +%5.5f dB \n', psnr_Value_dct);   
fprintf('PSNR FFT = +%5.5f dB \n', psnr_Value_fft);
fprintf('PSNR DWT = +%5.5f dB \n', psnr_Value_dwt);
    
%% RMSE
[mse_dct, rmse_dct] = RMSE2(double(original), double(RGB_dct));
    fprintf('MSE DCT = %5.5f \n', mse_dct);
    fprintf('RMSE DCT = %5.5f \n', rmse_dct);
[mse_fft, rmse_fft] = RMSE2(double(original), double(RGB_fft));
    fprintf('MSE FFT = %5.5f \n', mse_fft);
    fprintf('RMSE FFT = %5.5f \n', rmse_fft);
[mse_dwt, rmse_dwt] = RMSE2(double(original), double(RGB_dwt));
    fprintf('MSE DWT = %5.5f \n', mse_dwt);
    fprintf('RMSE DWT = %5.5f \n', rmse_dwt);

%% PearsonCorrelationCoefficient
pcc_dct = compute_PearsonCorrelationCoefficient (double(original), double(RGB_dct));
    fprintf('PearsonCorrelationCoefficient DCT (original vs compressed) = %5.5f \n', pcc_dct);
pcc_fft = compute_PearsonCorrelationCoefficient (double(original), double(RGB_fft));
    fprintf('PearsonCorrelationCoefficient FFT (original vs compressed) = %5.5f \n', pcc_fft);
pcc_dwt = compute_PearsonCorrelationCoefficient (double(original), double(RGB_dwt));
    fprintf('PearsonCorrelationCoefficient DWT (original vs compressed) = %5.5f \n', pcc_dwt);
    
%% Mean absolute error, MAE
mae_dct = meanAbsoluteError(double(original), double(RGB_dct));
    fprintf('Mean Absolute Error DCT = %5.5f \n', mae_dct);
mae_fft = meanAbsoluteError(double(original), double(RGB_fft));
    fprintf('Mean Absolute Error FFT = %5.5f \n', mae_fft);
mae_dwt = meanAbsoluteError(double(original), double(RGB_dwt));
    fprintf('Mean Absolute Error DWT = %5.5f \n', mae_dwt);



