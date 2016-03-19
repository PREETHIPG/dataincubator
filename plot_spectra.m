close all
clc
clear


S =  load('dataMatrixMCF10ASet1');
dataMatrixMCF10ASet1 = S.data_matrix;

S =  load('MCF10AP4HealthyMedia');
dataMatrixMCF10ASet2 = S.data_matrix;

dataMatrixMCF10ASet2((3:4),:) = [];

x = [1801:-1:603];
[rows1,t1] = size(dataMatrixMCF10ASet1);

[pc1,zscores1,pcvars1] = princomp(dataMatrixMCF10ASet1,'econ');
[pc2,zscores2,pcvars2] = princomp(dataMatrixMCF10ASet2,'econ');

pcs = 10;

redDataMatrixMCF10ASet1 = zscores1(:,(1:pcs));
redDataMatrixMCF10ASet2 = zscores2(:,(1:pcs));

for i = 1:rows1
    plot(x,dataMatrixMCF10ASet1(i,:),'r-')
    hold on
end

[rows2,t1] = size(dataMatrixMCF10ASet2);

for i = 1:rows2
    plot(x,dataMatrixMCF10ASet2(i,:),'b-')
    hold on
end

avg_spectra1 = mean(redDataMatrixMCF10ASet1);
avg_spectra2 = mean(redDataMatrixMCF10ASet2);

figure
plot(zscores1(:,1),zscores1(:,2),'ro')
hold on
plot(zscores2(:,1),zscores2(:,2),'b*')

% figure
% plot(x,avg_spectra1,'r-')
% hold on
% plot(x,avg_spectra2,'b-')

avg_spectra1 = avg_spectra1';
avg_spectra2 = avg_spectra2';
S1 = cov(redDataMatrixMCF10ASet1);
S2 = cov(redDataMatrixMCF10ASet2);

Sp = ((rows1-1)*S1 + (rows2-1)*S2)/(rows1+rows2-2);
% lambda = 10;
% Sp = Sp + lambda*diag(cols);
cond(Sp)

Tsquare = ((avg_spectra1 - avg_spectra2)'/((Sp*(1/rows1 + 1/rows2))))*(avg_spectra1 - avg_spectra2)

Fstatistic = ((rows1 + rows2 - pcs - 1)*Tsquare) / (pcs*(rows1 + rows2 - 2))

save PCA_with_Tsquare

