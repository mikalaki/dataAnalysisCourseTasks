%function for getting random numbers from exponential distribution, using
%uniform distribution at [0,1]
function [randomNumber] = randomExp(lamda)

% lamda is equal to mu (? = lamda is equal to the mean value).
% rand() gives us random numbers from uniform distribution at [0,1].
randomNumber= expinv(rand(),lamda);
% randomNumber= - (1/lamda) * ln(1-rand());
end

