%% Data analysis - Exercise 1.3 - Proof: Var[X+Y] != Var[X] + Var[X+Y] when X and Y are not independent 
% The above proof will be achieved by using n multivariate normal random
%  numbers from X and Y.

clc;
clear all;
muX=0;
muY=0;
sigma1=1;
sigma2=3;
corr12=1.5;
%number of random numbers
n= 1000;

%mean of X and Y
mu = [muX muY];
Sigma = [sigma1 corr12; corr12 sigma2];
R = mvnrnd(mu,Sigma,n);

X= R(:,1);
Y= R(:,2); 

varX=var(X);
varY=var(Y);
varXsumY=var(X+Y);

fprintf("From our calculations,we get that Var[X]+Var[Y]=%f and Var[X+Y]=%f .\n", varX+varY, varXsumY);
%Var[X] + Var[Y] is not equal to Var[X+Y]