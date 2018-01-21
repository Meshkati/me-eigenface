% setting given MU and SIGMA
MU1 = [10; 10];
MU2 = [22; 10];
SIGMA = [4, 4; 4, 9];

% computing classes
C1 = mvnrnd(MU1, SIGMA, 1000);
C2 = mvnrnd(MU2, SIGMA, 1000);

% computing PCAs
PCA1 = pca(C1);
PCA2 = pca(C2);

v1 = ones(1, 1000);
v2 = ones(1, 1000);

C1Mean = mean(C1)
C2Mean = mean(C2)

xt = linspace(0, 30);
a1 = PCA1(2, 1) / PCA1(1, 1);
b1 = PCA1(2, 2) / PCA1(1, 2);

a2 = PCA2(2, 1) / PCA2(1, 1);
b2 = PCA2(2, 2) / PCA2(1, 2);


subplot(2, 2, 1), plot(xt, (a1 * (xt - C1Mean(1)) ) + C1Mean(2) , xt, ( b1 * (xt - C1Mean(1)) ) + C1Mean(2));
title('Class 1');
hold on
subplot(2, 2, 1), plot(C1(:, 1), C1(:, 2), '.');

subplot(2, 2, 2), plot(xt, (a2 * (xt - C2Mean(1)) ) + C2Mean(2) , xt, ( b2 * (xt - C2Mean(1)) ) + C2Mean(2));
title('Class 2');
hold on
subplot(2, 2, 2), plot(C2(:, 1), C2(:, 2), '.');