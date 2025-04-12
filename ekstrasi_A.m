% clc; clear; close all; warning off all;
function ekstrasi_A(jarak,level, parameter)

% jarak = 2;
% level = 32;
image_folder_beras = 'Data Citra Beras New\data_tes\Beras_Kualitas_A';
filenames_beras = dir(fullfile(image_folder_beras, '*.jpg'));
total_images_beras = numel(filenames_beras);



total_gambar = total_images_beras

data_tes = zeros(total_gambar+1,length(parameter));
for i = 1 : length(parameter)
    data_tes(1,i)= i;
end


noIK = 1;
for n = 2:1+total_images_beras
    full_name_beras= fullfile(image_folder_beras, filenames_beras(noIK).name);
    img_filter = image_filtering_noise_removal(full_name_beras);
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
    GrayImg = (0.299*R)+(0.587*G)+(0.144*B);
%    GrayImgKuantisasi = round( GrayImg * (2^level)-1);
    
   % GrayImgKuantisasi=grayslice(GrayImg)
%     glcm = graycomatrix(GrayImgKuantisasi,'Offset',[0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]);
% glcm2 = graycomatrix(GrayImg,'Offset',[0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]);
    glcm = graycomatrix(GrayImg,'Offset',jarak, 'NumLevels', level);
    
%     stats = graycoprops(glcm,{'contrast','correlation','energy','homogeneity'});
    stats = haralickTextureFeatures(glcm, 1:14);
     for i = 1 : length(parameter)
        data_tes(n,i) = stats(parameter(i));
    end
    
%    

    
    noIK = noIK +1;
end
s = xlswrite('data_testing_A.xls',data_tes)

end
