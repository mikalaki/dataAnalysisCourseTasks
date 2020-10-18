%% Data analysis - Exercise 2.4 - Investigation if E[1/X] = 1/E[X] holds
% Purpuse is to investigate if E[1/X]= 1/ E[X] holds , by using random samples 
% from uniform distribution

clc;
clear all;


%sample sizes for the experiments
sampleSizes = [ 5 10 100 1e3 1e4 1e5 1e6];
nOfSamples =length(sampleSizes);

%val1 array stores the E[1/X] values and 
%val2 array stores the 1/E[X] values
val1 = zeros(nOfSamples,1);
val2 = zeros(nOfSamples,1);

% [a,b] is the interval of our uniform distribution
a = 1;
b = 2;



%This loop is for the different samples of our experiments
for i = 1:nOfSamples
    n = sampleSizes(i);
    %In general, a + (b-a).*rand(N,1) , generate N random numbers in the interval (a,b)
    sample = a + (b-a).*rand(n,1);  
    val1(i) = mean((sample).^-1);
    val2(i) = 1/mean(sample);       
end

figure();
semilogx(sampleSizes,val1,"-*");
hold on;
semilogx(sampleSizes,val2,"-*");
title("Investigation if E[1/X] = 1/E[X] holds");
xlabel("n: sample size");
legend("E[1/X]", "1/E[X]");



