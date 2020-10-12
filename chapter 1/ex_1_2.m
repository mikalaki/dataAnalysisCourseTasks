%% Data analysis - Exercise 1.2 - Exponential distribution random number generaton
%  In this exercise we are called to generate random numbers from
%  exponential distribution by using the uniform distribution at [0,1].

clc;
clear all;
%histogram bins
bins=20;
%number of random numbers
n= 1000;
lamda=1;

randomNumbers=zeros(n,1);


for i=1:n
    randomNumbers(i) = randomExp(lamda);
end

histfit(randomNumbers,bins,'exponential');
title("Histogram from our random number generator.");
legend("Our numbers' distribution.","Exponential Distribution");

%function for getting random numbers from exponential distribution
function [randomNumber] = randomExp(lamda)

% lamda is equal to mu (? = lamda is equal to the mean value).
% rand() gives us random numbers from uniform distribution at [0,1].
 randomNumber= expinv(rand(),lamda);
 % randomNumber= - (1/lamda) * log(1-rand());
end

