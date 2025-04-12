% sudut = 1; % sudut (1= 0 derajat,2 = 45 derajat, 3 = 90 derajat,4 = 135 derajat)

jarak = [0 2]; % jarak (1;2;3;4) sudut [0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]
level= 16; % Level Kuantisasi (8, 16, 32, 64, 128)
parameter = [1,2,4,5,9]; %3, 5, 6, 9, 12, 13, 14
tic
% ekstrasi_A(jarak,level, parameter);
% % ekstrasi_B(jarak,level, parameter);
% testing_C(jarak,level, parameter);
% ekstrasi_training_GLCM(jarak,level,parameter);

fileTraining  =  xlsread('data_training.xls');
fileTestingA  =  xlsread('data_testing_A.xls');
% fileTestingB  =  xlsread('data_testing_B.xls');
fileTestingC  =  xlsread('data_testing_C.xls');

% fileTraining

% XTrain = fileTraining(2:151,1:7);
XTrain = fileTraining(2:101,1:length(parameter));
YTrain = fileTraining(2:101,length(parameter) + 1 );
% XTrain = normalize(XTrain);

%A
XTest_A = fileTestingA(2:21,:);
YTest_A = {'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1';'1'};
% XTest_A = normalize(XTest_A);
% B
XTest_B = fileTestingB(2:21,:);
YTest_B = {'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2';'2'};
% XTest_B = normalize(XTest_B);
% C
XTest_C = fileTestingC(2:21,:);
YTest_C = {'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';'3';};
% XTest_C = normalize(XTest_C);
% YTest = st(20,1);
% for i = 1 :20
%     YTest(i) = char('1');
% end
% 
% allData = [XTrain ; XTest_A; XTest_B; XTest_C];
% allData = normalize(allData);
% 
% XTrain = allData(1:150,:);
% XTest_A = allData(151:170,:);
% XTest_B = allData(171:190,:);
% XTest_C = allData(191:210,:);
% YTest
% length(YTest)
% Mdl = fitcnb(X,Y);
Mdl = fitcnb(XTrain,YTrain,'ClassNames',{'1','3'});
% Mdl = fitcnb(XTrain,YTrain,'ClassNames',{'1','2','3'})

% Mdl.Prior

label_a = predict(Mdl,XTest_A);
% label_b = predict(Mdl, XTest_B);
label_c = predict(Mdl, XTest_C);
% label

% table(YTest_A,label_a,'VariableNames',...
%     {'TrueLabel A','PredictedLabel A'})
% 
% table(YTest_B,label_b,'VariableNames',...
%     {'TrueLabel B','PredictedLabel B'})
% 
% table(YTest_C,label_c,'VariableNames',...
%     {'TrueLabel C','PredictedLabel C'})

total_benar = 0;
ab = 0;
cb = 0;
cell_a = {'1'};
% cell_b = {'2'};
cell_c = {'3'};

% label_a
for i = 1 : length(label_a)
    a = label_a{i};
    if strcmp(a, cell_a)
        total_benar = total_benar + 1;
        ab = ab + 1;
    end
end

% 
% for  i = 1 : length(label_b)
%     b = label_b{i};
%     if strcmp(b, cell_b)
%         total_benar = total_benar + 1;
%     end
% end
% 
for  i = 1 : length(label_c)
    c = label_c{i};
    if strcmp(c, cell_c)
        total_benar = total_benar + 1;
        cb = cb +1;
    end
end

toc
waktukomputasi = toc;

fprintf('Total Benar : %d ', total_benar);
fprintf('Total Benar A: %d ', ab);
fprintf('Total Benar C: %d ', cb);
akurasi = (total_benar * 100) / 40;
fprintf('\nAkurasi : %7.2f', akurasi);
fprintf('\nWaktu Komputasi : %7.2f', waktukomputasi);


    
    

% cma = confusionchart(YTest_A,label_a);
% cma.Title = 'Prediksi A';
% cmb = confusionchart(YTest_B,label_b);
% cmb.Title = 'PrediksiB';
% cmc = confusionchart(YTest_C,label_c);
% cmc.Title = 'Prediksi C';


