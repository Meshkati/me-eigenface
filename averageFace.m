function [ outputVector, outputMatrix] = averageFace( inputMatrix )
%AVERAGEFACE Compute the average face of a data set
%   Each row in data set matrix represents an image vector

inputSize = size(inputMatrix);
facesSum = sum(inputMatrix);

outputVector = facesSum/inputSize(1);

imageSize = sqrt(inputSize(2));
outputMatrix = reshape(outputVector, [imageSize, imageSize]);
end