% clc; clear; close all; warning off all;
function ekstrasi_training_GLCM(jarak,level,parameter)

% jarak =[0 2];
% level = 32;
% parameter = [ 9 ];

image_folder_berasA = 'Data Citra Beras New\data_latih\Beras_Kualitas_A';
filenames_berasA = dir(fullfile(image_folder_berasA, '*.jpg'));
total_images_berasA = numel(filenames_berasA);

% image_folder_berasB = 'Data Citra Beras New\data_latih\Beras_Kualitas_B';
% filenames_berasB = dir(fullfile(image_folder_berasB, '*.jpg'));
% total_images_berasB = numel(filenames_berasB);

image_folder_berasC = 'Data Citra Beras New\data_latih\Beras_Kualitas_C';
filenames_berasC = dir(fullfile(image_folder_berasC, '*.jpg'));
total_images_berasC = numel(filenames_berasC);

% total_gambar = total_images_beras
total_gambar = total_images_berasA + total_images_berasC;
% total_gambar = 150;

data_latih = zeros(total_gambar+1,length(parameter));
for i = 1 : length(parameter)
    data_latih(1,i)= i;
end

data_latih(1,length(parameter) +1) = length(parameter) + 1;


noA = 1;
% noB = 1;
noC = 1;
for n = 2:1+total_gambar
    
    if n <= total_images_berasA + 1
        full_name_beras= fullfile(image_folder_berasA, filenames_berasA(noA).name);
        img_filter = image_filtering_noise_removal(full_name_beras);
        img_segmentasi_roi = segmentasi_warna_roi(img_filter);
        Img = img_segmentasi_roi;
        Img = im2double(Img);
        noA = noA + 1;
         R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
   
    
    
    % Ekstraksi Ciri Tekstur GLCM
%     jarak = 4; % jarak dapat diubah
%     sudut = 1; % sudut dapat diubah
    %level = 8; %level dapat diubah
    GrayImg = (0.299*R)+(0.587*G)+(0.144*B);
    % image_num = image_num-1;
    %I = im2double(imread('cameraman.tif'));
     
%     image_num = level;
%     J = round(I.*((2^n)-1));
%     cmap = zeros(2^n,3);
%     for i = 1:2^n
%         cmap(i,:) = (i-1)/((2^n)-1);
%     end
%     axes(ax1)
%     GrayImgKuantisasi = round( GrayImg * (2^level)-1);
    
   % GrayImgKuantisasi=grayslice(GrayImg)
%     glcm = graycomatrix(GrayImgKuantisasi,'Offset',[0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]);
    glcm = graycomatrix(GrayImg,'Offset',jarak, 'NumLevels', level);
    
%     stats = graycoprops(glcm,{'contrast','correlation','energy','homogeneity'});
    stats = haralickTextureFeatures(glcm, 1:14);
    
    for i = 1 : length(parameter)
        data_latih(n,i) = stats(parameter(i));
    end
    
%      
%     elseif n > total_images_berasA + 1 && n <= total_images_berasA + total_images_berasB + 1
%         full_name_beras= fullfile(image_folder_berasB, filenames_berasB(noB).name);
%         img_filter = image_filtering_noise_removal(full_name_beras);
%         img_segmentasi_roi = segmentasi_warna_roi(img_filter);
%         Img = img_segmentasi_roi;
%         Img = im2double(Img);
%         noB = noB + 1;
%          R = Img(:,:,1);
%     G = Img(:,:,2);
%     B = Img(:,:,3);
%    
%     
%     
%     % Ekstraksi Ciri Tekstur GLCM
% %     jarak = 4; % jarak dapat diubah
% %     sudut = 1; % sudut dapat diubah
%     %level = 8; %level dapat diubah
%     GrayImg = (0.299*R)+(0.587*G)+(0.144*B);
%     % image_num = image_num-1;
%     %I = im2double(imread('cameraman.tif'));
%      
%  glcm = graycomatrix(GrayImg,'Offset',jarak, 'NumLevels', level);
%     
% %     stats = graycoprops(glcm,{'contrast','correlation','energy','homogeneity'});
%     stats = haralickTextureFeatures(glcm, 1:14);
%     for i = 1 : length(parameter)
%         data_latih(n,i) = stats(parameter(i));
%     end
  
       
    elseif n > total_images_berasA +1 && n <=  total_images_berasA +  total_images_berasC + 1
        full_name_beras= fullfile(image_folder_berasC, filenames_berasC(noC).name);
        img_filter = image_filtering_noise_removal(full_name_beras);
        img_segmentasi_roi = segmentasi_warna_roi(img_filter);
        Img = img_segmentasi_roi;
        Img = im2double(Img);
        noC = noC + 1;
         R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
   
    
    
    % Ekstraksi Ciri Tekstur GLCM
%     jarak = 4; % jarak dapat diubah
%     sudut = 1; % sudut dapat diubah
    %level = 8; %level dapat diubah
    GrayImg = (0.299*R)+(0.587*G)+(0.144*B);
    % image_num = image_num-1;
    %I = im2double(imread('cameraman.tif'));
     
 glcm = graycomatrix(GrayImg,'Offset',jarak, 'NumLevels', level);
    
%     stats = graycoprops(glcm,{'contrast','correlation','energy','homogeneity'});
    stats = haralickTextureFeatures(glcm, 1:14);
    for i = 1 : length(parameter)
        data_latih(n,i) = stats(parameter(i));
    end
    
    

    end
end

% for i=2:50 + 1
%     data_latih(i,length(parameter) + 1) = 1;
% end
% for i=52:100 + 1
%     data_latih(i,length(parameter)+1) = 2;
% end
% for i=102:150 + 1
%     data_latih(i,length(parameter )+1) = 3;
% end

for i=2:50 + 1
    data_latih(i,length(parameter)+1) = 1;
end

for i=52:100 + 1
    data_latih(i,length(parameter )+1) = 3;
end

   

   
  disp("inipanjang foto" + total_gambar);
s = xlswrite('data_training.xls',data_latih)

