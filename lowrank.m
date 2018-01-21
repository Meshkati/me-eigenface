function [ min, X_R ] = lowrank(X, rank )
%LOWRANK Computes the r low rank approximation of matrix
%   [ X_R, min ] = lowrank(U, S, V, rank)

[U, S, V] = svd(X);
X_R = U(:, 1:rank) * S(1:rank, 1:rank) * V(:, 1:rank)';
dif = X - X_R;
min = norm(dif, 'fro');
end
