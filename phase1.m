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

% project data on the PCA line
innerDot1 = zeros(1, 1000);
innerDot2 = zeros(1, 1000);

for i=1:1000
    innerDot1(i) = dot(C1(i, :), PCA1(:, 1));
    innerDot2(i) = dot(C2(i, :), PCA2(:, 1));
end

projected1 = innerDot1' * PCA1(:, 1)';
projected2 = innerDot2' * PCA2(:, 1)';

hold on
subplot(2, 2, 1), plot(projected1(:, 1) + C1Mean(1) , projected1(:, 2) + C1Mean(2) , 'g.');
hold on
subplot(2, 2, 2), plot(projected2(:, 1) + C2Mean(1) , projected2(:, 2) + C2Mean(2) , 'g.');


% merging 2 classes
MC = [C1; C2];
[PCAM, Mscore, Mlatent] = pca(MC);
Mean = mean(MC);
figure, plot(MC(:, 1), MC(:, 2), '.');
Mxt = linspace(0, 30);
Myt = linspace(-20, 20);
Ma = PCAM(2, 1) / PCAM(1, 1);
Mb = PCAM(2, 2) / PCAM(1, 2);

% hold on
% plot(Mxt, (Ma * (Mxt - Mean(1))) + Mean(2));

innerDot = zeros(1, 2000);

for i=1:2000
    innerDot(i) = dot(MC(i, :), PCAM(:, 1));
end

projected = innerDot' * PCAM(:, 1)';

hold on
plot(projected(:, 1) , projected(:, 2) + Mean(2), 'g.');

