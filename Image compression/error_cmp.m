clear all; close all; clc;

%% 
% This file reads an image and do all compression, error calculation ,time calculation 
% for different compression rate 10,20,30,40,50,60,70,80,90 (percents)
% and plots all result and prints on command window (it might take some times)   


%% read image
original=imread('lena.jpg');
original = double(original)/255;


%% read image from file //to do this comment out this block and cooment in upper block
%name = input('Image name and format % (ex:image.jpg): ','s');
%original=imread(name);


%% loop to calculate all operation for different compression ratio starting from 10 to 90

for i=1:9
    rate=i*10;%compression ratio/rate
    x(1,i)=rate;
   
    %% Image Compression using DCT
    startdct=tic;
    RGB_dct(:,:,:,i)=dct_cmp(original,rate);
    a=toc(startdct);
    timedct(i)=a;
    
    %% Image Compression using FFT
    startfft=tic;
    RGB_fft(:,:,:,i)=fft_cmp(original,rate);
    a=toc(startfft);
    timefft(i)=a;

    %% Image Compression using DWT
    startdwt=tic;
    RGB_dwt(:,:,:,i)=dwt_cmp(original,rate);
    a=toc(startdwt);
    timedwt(i)=a;
    
    %% Error Calculation Part 

    % PSNR
    psnr_Value_dct(i) = PSNR(original, RGB_dct(:,:,:,i));
    psnr_Value_fft(i) = PSNR(original, RGB_fft(:,:,:,i));
    psnr_Value_dwt(i) = PSNR(original, RGB_dwt(:,:,:,i));
     
    % RMSE
    [mse_dct(i), rmse_dct(i)] = RMSE2(double(original), double(RGB_dct(:,:,:,i)));
    [mse_fft(i), rmse_fft(i)] = RMSE2(double(original), double(RGB_fft(:,:,:,i)));
    [mse_dwt(i), rmse_dwt(i)] = RMSE2(double(original), double(RGB_dwt(:,:,:,i)));
     
    % PearsonCorrelationCoefficient
    pcc_dct(i) = compute_PearsonCorrelationCoefficient (double(original), double(RGB_dct(:,:,:,i)));
    pcc_fft(i) = compute_PearsonCorrelationCoefficient (double(original), double(RGB_fft(:,:,:,i)));
    pcc_dwt(i) = compute_PearsonCorrelationCoefficient (double(original), double(RGB_dwt(:,:,:,i)));
     
    % Mean absolute error, MAE
     mae_dct(i) = meanAbsoluteError(double(original), double(RGB_dct(:,:,:,i)));
     mae_fft(i) = meanAbsoluteError(double(original), double(RGB_fft(:,:,:,i)));
     mae_dwt(i) = meanAbsoluteError(double(original), double(RGB_dwt(:,:,:,i)));
     
end



%% plot

 %PLOT PSNR for different compression ratio starting from 10 to 90 on
 %compressed image using DCT,FFT,DWT transform coding
subplot(2,3,1)
plot(x, psnr_Value_dct,'o')
hold on
plot(x, psnr_Value_fft,'*')
hold on
plot(x, psnr_Value_dwt,'+')
legend('dct','fft','dwt');
title('PSNR');


 %PLOT RMSE for different compression ratio starting from 10 to 90 on
 %compressed image using DCT,FFT,DWT transform coding
subplot(2,3,2)
plot(x, rmse_dct,'o')
hold on
plot(x,rmse_fft,'*')
hold on
plot(x,rmse_dwt,'+')
legend('dct','fft','dwt');
title('RMSE');


 %PLOT PearsonCorrelationCoefficient for different compression ratio starting from 10 to 90 on
 %compressed image using DCT,FFT,DWT transform coding
subplot(2,3,3)
plot(x, pcc_dct,'o')
hold on
plot(x,pcc_fft,'*')
hold on
plot(x,pcc_dwt,'+')
legend('dct','fft','dwt');
title('PearsonCorrelationCoefficient');

 %PLOT Mean absolute error, MAE for different compression ratio starting from 10 to 90 on
 %compressed image using DCT,FFT,DWT transform coding
subplot(2,3,4)
plot(x,mae_dct,'o')
hold on
plot(x,mae_fft,'*')
hold on
plot(x,mae_dwt,'+')
legend('dct','fft','dwt');
title('Mean absolute error');


 %PLOT calcuated time for different compression ratio starting from 10 to 90 on
 %compressed image using DCT,FFT,DWT transform coding
subplot(2,3,5)
plot(x,timedct,'o')
hold on
plot(x,timefft,'*')
hold on
plot(x,timedwt,'+')
legend('dct','fft','dwt');
title('TIME');


%% print all result
psnr_Value_dct
psnr_Value_fft=real(psnr_Value_fft)
psnr_Value_dwt

rmse_dct
rmse_fft=real(rmse_fft)
rmse_dwt


mae_dct
mae_fft
mae_dwt

timedct
timefft
timedwt
