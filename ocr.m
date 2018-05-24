
valimg_org = imread('Letter_T.png');
%valimg = reshape(im2bw(rgb2gray(imresize(valimg_org,[30 30]))),[],1);

valimg1 = extractLBPFeatures(rgb2gray(valimg_org));

number_of_letters = 26;
number_of_samples = 40;


prepared_images = [];
prepared_images1 = [];

files = dir('training\*.png');
for file = files'
    %img = reshape(im2bw(rgb2gray(imresize(imread(strcat('training\',file.name)),[30 30]))),[],1);
    
    img1 = extractLBPFeatures(rgb2gray(imread(strcat('training\',file.name))));
    img1 = img1';
    %img = extractHOGFeatures(imread(strcat('training\',file.name)));
    
    %prepared_images = [prepared_images img];
   
    prepared_images1 = [prepared_images1 img1];

end
[rows,cols] = size(prepared_images);


%{
[k j] = size(files);
target = [];
for i = 1:number_of_letters
   new_row = [];
   
   for j = 1:k
       if (j > (i-1)*number_of_samples) && (j <= i*number_of_samples)
         new_row = [new_row 1];
       else
         new_row = [new_row 0];
       end
   end
   
   target = [target; new_row];
end
%}

target = (load('target.mat'));
target = target.target;

%CREATE NEW NET IF YOU HAVE TO
%net_1 = feedforwardnet(100);
%net_1 = configure(net_1,prepared_images1,target);
net_1 = (load('net_1.mat'));
net_1 = net_1.net_1;


%net_1.adaptFcn = 'trains';
%net_1.divideFcn = 'dividerand';
%net_1.divideMode = 'sample';
%net_1.layers{1}.transferFcn = 'logsig';
%net_1.layers{2}.transferFcn = 'tansig';
%net_1.trainFcn = 'trainlm';
%net_1.performFcn = 'mse';


%TRAIN IF YOU HAVE TO
%[net_1,tr] = train(net_1,prepared_images1,target);

%RESULT = net_1(valimg);
RESULT = net_1(valimg1');

[r,c] = find(RESULT == max(RESULT));
LETTER = letter_resolver(r);

subplot(1,2,1);
imshow(valimg_org);

str = sprintf("This is letter :  %s", LETTER);
title(str);

