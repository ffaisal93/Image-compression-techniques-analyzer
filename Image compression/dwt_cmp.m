function [ RGB ] = dwt_cmp( original,rate )

%% Compression using Discrete Wavelet Transform 
RGB=zeros(size(original));


[cA1,cH1,cV1,cD1] = dwt2(original,'haar'); %using haar wavelet

%% 3 loops-
%there are four matrix parts but first cA1 matrix cotain most of the
%informations.So we eliminate values from other three matrix-cH1,cV1,cD1 


for i=1:3 %this is for cH1 matrix
    x=cH1(:,:,i);
    x1=x(:);
    [B,index]=sort(x1);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(x));
    m=max(index);
    %%%% Determines Compression Quality
    rate1=(rate*m)/100;
    rate1=round(rate1);
    for k=1:rate1
    compressed_dct(index(k))=x1(index(k));
    end
    cH1(:,:,i)=compressed_dct;
    
end

for i=1:3 %this is for cV1 matrix
    x=cV1(:,:,i);
    x1=x(:);
    [B,index]=sort(x1);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(x));
    m=max(index);
    %%%% Determines Compression Quality
    rate1=(rate*m)/100;
    rate1=round(rate1);
    for k=1:rate1
    compressed_dct(index(k))=x1(index(k));
    end
    cV1(:,:,i)=compressed_dct;
    
end

for i=1:3 %this is for cD1 matrix
    x=cD1(:,:,i);
    x1=x(:);
    [B,index]=sort(x1);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(x));
    m=max(index);
    %%%% Determines Compression Quality
    rate1=(rate*m)/100;
    rate1=round(rate1);
    for k=1:rate1
    compressed_dct(index(k))=x1(index(k));
    end
    cD1(:,:,i)=compressed_dct;
    
end

%%now inverse DWT using haar wavelet

RGB1 = idwt2(cA1,cH1,cV1,cD1,'haar');
[r c ch]=size(original);
RGB=imresize(RGB1,[r,c]); %resize as original image


end

