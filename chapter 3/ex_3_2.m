%% Data analysis - Exercise 3.2 - Exponential Distribution
clear all;
clc;


%% 3a ??? 
% Show that in a Exponential Distribution the maximum likelihood 
% estimator of lambda (λ) is the sample mean value

% parameters 
n = 1e6;
lambda = 20;

sampleSizes = [ 10 100 1e3 1e4 1e5 1e6 ];
nOfSamples =length(sampleSizes);
meanOfSamples = zeros(nOfSamples,1);
LfuncDerivative = zeros(nOfSamples,1);

for i = 1:nOfSamples
    n = sampleSizes(i);
    sample = exprnd(lambda,n,1) ;  
    meanOfSamples(i) = mean(sample);
end

figure();
plot(log10(sampleSizes),meanOfSamples,"-*");
hold on;
line([0,log10(sampleSizes(nOfSamples))],[lambda,lambda],'Color','red','LineWidth',2);
title("Exponential Distribution lambda");
xlabel("n: sample size (logarithmic scale)");
legend("sample mean value", "lambda (λ)");

%% 3b
% number of samples:
M = 100;
% sample size:
n = 10000;

lambda = 20;
meanOfmeans = exponentialSamplesMean(M,n,lambda);

fprintf("The mean value of the means of the M samples is %f . \n",meanOfmeans);






