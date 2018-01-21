% handy tools
imageSize = @() 50*50;


% reading train image dataset
trainFile = fopen('faces/train.txt', 'r');
trainFileData = textscan(trainFile, '%s %d');
trainAddresses = trainFileData{1};
trainAddressesLength = length(trainAddresses);

X = zeros(trainAddressesLength, imageSize());

% generating the X matrix
for i = 1:trainAddressesLength
    tempMatrix = imread(trainAddresses{i});
    % convert the matrix into a single column vector 
    tempVector = tempMatrix(:);
    X(i, :) = tempVector;
end

% reading test image dataset
testFile = fopen('faces/test.txt');
testFileData = textscan(testFile, '%s %d');
testAddresses = testFileData{1};
testAddressesLength = length(testAddresses);

X_test = zeros(testAddressesLength, imageSize());

% generating the X_test matrix
for i = 1:testAddressesLength
    tempMatrix = imread(testAddresses{i});
    % convert the matrix into a single column vector
    tempVector = tempMatrix(:);
    X_test(i, :) = tempVector;
end

% computing average face
[avgVector, avgFace] = averageFace(X);
grayAvgFace = mat2gray(avgFace);
subplot(3, 5, 1), imshow(grayAvgFace);
title('Average face');

% computing mean subtraction face
XMeanSubtraction = zeros(trainAddressesLength, imageSize());

for i = 1:trainAddressesLength
    XMeanSubtraction(i, :) = X(i,:) - avgVector;
end

subplot(3, 5, 2), imshow(reshape(mat2gray(XMeanSubtraction(100, :)), [sqrt(imageSize()), sqrt(imageSize())]));
title('100th Mean Subtraction face');

% computing eigenface
[U, S, V] = svd(XMeanSubtraction);
VT = V';

for i = 1:10
    subplot(3, 5, 5 + i), imshow(reshape(mat2gray(VT(i, :)), [sqrt(imageSize()), sqrt(imageSize())]));
    title(strcat(int2str(i), ' th Eigenface'));
end

