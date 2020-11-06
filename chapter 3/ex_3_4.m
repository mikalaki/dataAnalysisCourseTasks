%% Data analysis - Exercise 3.4 - Confidence Interval and Null Hypothesis test on StD,Var and mean value, Goodness-of-Fit test
% Confidence Interval (CI) & Null hypothesis(H0) for Standart Deviation
% Confidence Interval (CI) & Null hypothesis(H0) for Mean Value
% Goodness-Of-Fit Test to Normal Distribution and its p-value calculation.
% The data is about the interupt voltage of an insulator liguid.
clear all;
clc;

% sample (data is about the interupt voltage of an insulator liguid) :
sampleData =[41 46 47 47 48 50 50 50 50 50 50 50 ...
       48 50 50 50 50 50 50 50 52 52 53 55 ...
       50 50 50 50 52 52 53 53 53 53 53 57 ...
       52 52 53 53 53 53 53 53 54 54 55 68 ];


% Programm parameters
alpha = 0.05; 
% From older measurements our standart deviation is 5, so variance is 5^2
oldStD = 5 ;
oldVar = oldStD^2;

% 3.4 (a)Variance confidence interval 1st way (without vartest)
DataVariance = var(sampleData);
n = length(sampleData);

VarCI_1 = [ ((n-1)*DataVariance)/chi2inv(1-alpha/2 ,n-1) , ...
            ((n-1)*DataVariance)/chi2inv(alpha/2 ,n-1)] ;
        
fprintf("3.4.a) Variance 95%% confidence Interval : [ %f , %f ]\n",VarCI_1(1),VarCI_1(2)); 

% 3.4 (a)Variance confidence interval 2nd way (with vartest) + (b) StD Null
% Hypothesis test
% We make null hypothesis test (H0) for standart deviation = 5 (oldStD) => 
% => H0 of variance for variance = 25 (oldVar)
[h,p,VarCI_2] = vartest(sampleData,oldVar); % we set oldVar as v input , ci stays the same for different v.
fprintf("3.4.a) Variance 95%% confidence Interval (with vartest) : [ %f , %f ]\n",VarCI_2(1),VarCI_2(2)); 
if(h ==1)
    fprintf("3.4.b) Null hypothesis test for standart deviation equal to 5 is rejected.\n");
else
    fprintf("3.4.b) hypothesis test for standart deviation equal to 5 is accepted.\n");
end

% 3.4 (c) -(d) 95% confindence interval and Null Hypothesis test of mean value.
alpha_mu = 0.05;
given_mu = 52;
[h_mu,p_mu,MeanValueCI] = ttest(sampleData,given_mu,"Alpha",alpha_mu);
fprintf("3.4.c) Mean value 95%% confidence Interval  : [ %f , %f ]\n",MeanValueCI(1),MeanValueCI(2)); 
if(h_mu ==1)
    fprintf("3.4.d) Null hypothesis test for mean value equal to 5KV is rejected.\n");
else
    fprintf("3.4.d) hypothesis test for mean value equal to 5KV is accepted.\n");
end

% 3.4 (e) Goodness-Of-Fit Test to Normal Distribution and its p-value calculation
[h_gof,p_gof] = chi2gof(sampleData);  
if(h_gof ==1)
    fprintf("3.4.e) Goodness-of-fit Test of our data to Normal Distribution is rejected.\n");
else
    fprintf("3.4.e) Goodness-of-fit Test of our data to Normal Distribution is accepted.\n");
end
fprintf("3.4.e) The p-value of goodness-of-fit is %f.\n",p_gof );
figure();
histfit(sampleData,15);
title("Goodness-of-fit for sample's interupt voltage values of an insulator liguid");
legend("Interupt voltage values","Normal Distribution");
xlabel("values");
ylabel("frequency");



