function [ F ] = eigenfacefeature( inputMatrix, rank )
%EIGENFACEFEATURE Computes the F matrix for the eigenface feature in rank
%r
%  [ F ] = eigenfacefeature( X, rank )

[U, S, V] = svd(inputMatrix);
VT = V';

F = inputMatrix * VT(1:rank, :)';
end

