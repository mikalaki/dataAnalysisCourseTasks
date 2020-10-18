%% Data analysis - Exercise 2.6 - Programmatically Proof of Central Limit Theorem (CLT)
% 100 random variables from U(0,1) distribution and Y beeing their
% average random variable. Using 10000 samples of Y we proove the CLT

clc;
clear all;

% Parameters
nOfInitialRandVar = 100;
%   number of Y samples
n = 1e4;
%bins = 150;

% initialize a matrix of 100*10000 when each line is a random variable.
% and by finding tha mean of each column we get the 100000 samples of Y.
mat = rand(nOfInitialRandVar,n);
Y=mean(mat);

histfit(Y);
title("Proof of central limit theorem.");
ylabel("Histogram");
legend("Y distribution","Normal distribution");

