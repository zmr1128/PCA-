%%
%loading all .mat files
files = dir('**/*.mat');    
for i = 1:length(files)
    load(files(i).name);
end
%%
%arranging videos by test number
test_1 = {vidFrames1_1 vidFrames2_1 vidFrames3_1};
test_2 = {vidFrames1_2 vidFrames2_2 vidFrames3_2};
test_3 = {vidFrames1_3 vidFrames2_3 vidFrames3_3};
test_4 = {vidFrames1_4 vidFrames2_4 vidFrames3_4};
test = {test_1 test_2 test_3 test_4};
%%
%converting videos to grayscale
test_gray = cell(1,4);
for k = 1:4
    test_gray{k} = cell(1,3);
for j = 1:length(test{k})
    for i = 1:size(test{k}{j},4)
    test_gray{k}{j}(:,:,:,i) = rgb2gray(test{k}{j}(:,:,:,i));
    end
    test_gray{k}{j} = squeeze(test_gray{k}{j});
end
end
%%
%cropping out the videos to find the torchlight
%test 1
A1 = test_gray{1}{1}(:,300:400,:);
B1 = test_gray{1}{2}(:,250:350,:);
C1 = test_gray{1}{3}(230:330,:,:);
%test 2
A2 = test_gray{2}{1}(:,300:480,:);
B2 = test_gray{2}{2}(:,200:380,:);
C2 = test_gray{2}{3}(180:360,:,:);
%test 3
A3 = test_gray{3}{1}(:,250:400,:);
B3 = test_gray{3}{2}(:,230:380,:);
C3 = test_gray{3}{3}(180:330,:,:);
%test 4
A4 = test_gray{4}{1}(:,300:480,:);
B4 = test_gray{4}{2}(:,230:410,:);
C4 = test_gray{4}{3}(150:330,:,:);
%%
%cell of all the cropped videos
test_1cropd = {double(A1) double(B1) double(C1)};
test_2cropd = {double(A2) double(B2) double(C2)};
test_3cropd = {double(A3) double(B3) double(C3)};
test_4cropd = {double(A4) double(B4) double(C4)};
test_cropd = {test_1cropd test_2cropd test_3cropd test_4cropd};
%%
%finding positions of the brightest pixel(the torch light) for each frame
%test 1
[vecx1_1,x1_1] = max(max(test_cropd{1}{1},[],1));
[vecy1_1,y1_1] = max(max(test_cropd{1}{1},[],2));
[vecx2_1,x2_1] = max(max(test_cropd{1}{2},[],1));
[vecy2_1,y2_1] = max(max(test_cropd{1}{2},[],2));
[vecx3_1,x3_1] = max(max(test_cropd{1}{3},[],1));
[vecy3_1,y3_1] = max(max(test_cropd{1}{3},[],2));
%test 2
[vecx1_2,x1_2] = max(max(test_cropd{2}{1},[],1));
[vecy1_2,y1_2] = max(max(test_cropd{2}{1},[],2));
[vecx2_2,x2_2] = max(max(test_cropd{2}{2},[],1));
[vecy2_2,y2_2] = max(max(test_cropd{2}{2},[],2));
[vecx3_2,x3_2] = max(max(test_cropd{2}{3},[],1));
[vecy3_2,y3_2] = max(max(test_cropd{2}{3},[],2));
%test 3
[vecx1_3,x1_3] = max(max(test_cropd{3}{1},[],1));
[vecy1_3,y1_3] = max(max(test_cropd{3}{1},[],2));
[vecx2_3,x2_3] = max(max(test_cropd{3}{2},[],1));
[vecy2_3,y2_3] = max(max(test_cropd{3}{2},[],2));
[vecx3_3,x3_3] = max(max(test_cropd{3}{3},[],1));
[vecy3_3,y3_3] = max(max(test_cropd{3}{3},[],2));
%test 4
[vecx1_4,x1_4] = max(max(test_cropd{4}{1},[],1));
[vecy1_4,y1_4] = max(max(test_cropd{4}{1},[],2));
[vecx2_4,x2_4] = max(max(test_cropd{4}{2},[],1));
[vecy2_4,y2_4] = max(max(test_cropd{4}{2},[],2));
[vecx3_4,x3_4] = max(max(test_cropd{4}{3},[],1));
[vecy3_4,y3_4] = max(max(test_cropd{4}{3},[],2));
%%
%squeezing to get 1-D vectors
%test 1
x1_1 = squeeze(x1_1); x2_1 = squeeze(x2_1); x3_1 = squeeze(x3_1);
y1_1 = squeeze(y1_1); y2_1 = squeeze(y2_1); y3_1 = squeeze(y3_1);
%test 2
x1_2 = squeeze(x1_2); x2_2 = squeeze(x2_2); x3_2 = squeeze(x3_2);
y1_2 = squeeze(y1_2); y2_2 = squeeze(y2_2); y3_2 = squeeze(y3_2);
%test 3
x1_3 = squeeze(x1_3); x2_3 = squeeze(x2_3); x3_3 = squeeze(x3_3);
y1_3 = squeeze(y1_3); y2_3 = squeeze(y2_3); y3_3 = squeeze(y3_3);
%test 4
x1_4 = squeeze(x1_4); x2_4 = squeeze(x2_4); x3_4 = squeeze(x3_4);
y1_4 = squeeze(y1_4); y2_4 = squeeze(y2_4); y3_4 = squeeze(y3_4);

%%
%aligning the data for consistent signal patterns
l = 150;
%1
x1_1 = x1_1(10:l); x2_1 = x2_1(60:l+50); x3_1 = x3_1(10:l);
y1_1 = y1_1(10:l); y2_1 = y2_1(60:l+50); y3_1 = y3_1(10:l);
%2
x1_2 = x1_2(10:l); x2_2 = x2_2(60:l+50); x3_2 = x3_2(40:l+30);
y1_2 = y1_2(10:l); y2_2 = y2_2(60:l+50); y3_2 = y3_2(40:l+30);
%3
x1_3 = x1_3(1:l-9); x2_3 = x2_3(66:l+56); x3_3 = x3_3(31:l+21);
y1_3 = y1_3(1:l-9); y2_3 = y2_3(66:l+56); y3_3 = y3_3(31:l+21);
%4
x1_4 = x1_4(10:l); x2_4 = x2_4(55:l+45); x3_4 = x3_4(7:l-3);
y1_4 = y1_4(10:l); y2_4 = y2_4(55:l+45); y3_4 = y3_4(7:l-3);

final_1 = [x1_1 y1_1 x2_1 y2_1 x3_1 y3_1];
final_2 = [x1_2 y1_2 x2_2 y2_2 x3_2 y3_2];
final_3 = [x1_3 y1_3 x2_3 y2_3 x3_3 y3_3];
final_4 = [x1_4 y1_4 x2_4 y2_4 x3_4 y3_4];
final = {final_1 final_2 final_3 final_4};
%%
%subtracting the final matrix with its mean along the columns
X = cell(1,4);
for it = 1:4
    avg{it} =  mean(final{it});
    for iter = 1:size(final{it},2)
        X{it}(:,iter) = final{it}(:,iter)-avg{it}(iter);
    end
    X{it} = X{it}';
end
%%
%SVD of the final matrix
%reconstructing the data using PCA
%Evaluating the covariance of the reconstructed data
u = cell(1,4); s = cell(1,4); v = cell(1,4);
Y = cell(1,4);
cx = cell(1,4); cy = cell(1,4);
for m = 1:4
    [u{m},s{m},v{m}] = svd(X{m},'econ');
    Y{m} = u{m}'*X{m};
    cx{m} = cov(X{m}');
    cy{m} = cov(Y{m}');
end
%%
%plotting the results
for n = 1:4
    figure(n)
    subplot(2,1,1)
    for i = 1:6
        hold on
        plot(final{n}(:,i))
    end
    xlabel('time');ylabel('Position of the torchlight');
    title('Original data before PCA');
    legend('x1 data','x2 data','x3 data','y1 data','y2 data','y3 data','location','best')
    subplot(2,1,2)
    for i = 1:6
        hold on
        plot(Y{n}(i,:))
    end
    xlabel('time');ylabel('Position signal');
    title('Data after PCA');
end