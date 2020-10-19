%% Data analysis - Exercise 2.5 - Normal Distribution Problem
%  A factory creates rails, and the rail dimeter followe normal
%  distribution N(4,0.01). We are called to find out :
%  1)If the factory destroys rails with diameter smaller than 3.9, find
%  what is the probability a rail to get destroyed.
%  2) Find the lower diameter limit in order only the 1% of the rails get
%  destroyed.

clc;
clear all;

%rail Diameter : X~ N(4,0.01)
mu = 4; 
sigma = 0.1;

currLowerDiameterLimit = 3.9;

%the probability a rail to get destroyed:
prob1 = normcdf(currLowerDiameterLimit,mu,sigma);
fprintf("The probability a rail to get destroyed is %f or %.2f%% \n",prob1,prob1*100);

%the lower limit in order only the 1% of the rails to get destroyed
newLowerDiameterLimit = norminv(0.01,mu,sigma);
fprintf("The lower diameter limit of a rail,in order only 1%% of rails get destroyed is %f \n",newLowerDiameterLimit);




