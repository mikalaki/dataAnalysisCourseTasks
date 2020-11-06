%% Data analysis - Exercise 3.3 - Confidence Interval of Mean value (exponential distribution)
clear all;
clc;

%% distribution parameters
lambda = 1/15 ;
mu = 1/lambda;

% Programm parameters
alpha = 0.05;
% nubmer of samples:
M=1000;
% sample size: (for (a) n =5 and for (b) n =100)
n=5;

% Creating my samples
samples = exprnd(mu,n,M) ;
% in every column of samples matrix we have one of the M samples.

lambdaInCIcounter = 0;
sumOfH0acceptance =0;
% Calculating confidence intervals for every sample and update the counter
% value
for i = 1:M
    [h,p,ci,stats] = ttest(samples(:,i),mu,'Alpha',alpha);
    % Sum of how many times mu = 1/(lambda) is inside confidence interval.
    if ci(1) <= mu && ci(2) >= mu
        lambdaInCIcounter = lambdaInCIcounter + 1;
    end
    % see how many times the H0 (null hypothesis( can be accepted.
    if h == 0
        sumOfH0acceptance = sumOfH0acceptance + 1;
    end
end
fprintf("For M=%d samples and samplesize n=%d the 1/15(1/lambda) is inside confidence interval with percentage %f %%. \n" ... 
    ,M,n,(lambdaInCIcounter / M)*100);





