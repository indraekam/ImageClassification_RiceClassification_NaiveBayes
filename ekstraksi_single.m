function glcm = ekstraksi_single(img,jarak)
%EKSTAKSI_SINGLE Summary of this function goes here
%   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;

% clc; clear; close all; warning off all;
% 
% image_folder_beras = 'data_tes\Beras_Kualitas_A';
% filenames_beras = dir(fullfile(image_folder_beras, '*.jpg'));
% total_images_beras = numel(filenames_beras);


% total_gambar = total_images_beras

% 
%     full_name_beras= fullfile(image_folder_beras, filenames_beras(noIK).name);
    img_filter = image_filtering_noise_removal(img);
    img_segmentasi_roi = segmentasi_warna_roi(img_filter);
    Img = img_segmentasi_roi;
    
    Img = im2double(Img);

    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
   
    
    
    % Ekstraksi Ciri Tekstur GLCM
%     jarak = 4; % jarak dapat diubah
%     sudut = 1; % sudut dapat diubah
    %level = 8; %level dapat diubah
    GrayImg = (0.299*R)+(0.587*G)+(0.144*B)
   GrayImgKuantisasi = round( GrayImg * (2^level)-1);
    
   % GrayImgKuantisasi=grayslice(GrayImg)
    glcm = graycomatrix(GrayImgKuantisasi,'Offset',[0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]);
%     glcm2 = graycomatrix(GrayImg,'Offset',[0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]);
end

