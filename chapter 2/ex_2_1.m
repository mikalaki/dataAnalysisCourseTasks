%% Data analysis - Exercise 2.1 - Probability Definition Proof
%  In this exercise we are called to implement an experiment where by
%  simulating a coin flip multiple times, and by rising the number of flips
%  we get an experimental proof of probability  definition, which is  
%" P(x=Xi)= (limit n to inf of (ni/n)), where ni is the number that random
%  variable X get the value X. and n is the total number of experiments "

clear all;
clc;

nOfRepetitions = [ 4 10 100 1000 1e4 1e5 1e6];
numberOfExperiments = length(nOfRepetitions);
headFrequency = zeros(5,1);
trailFrequency = zeros(5,1);

%this loop scans all the experiments (different total number of flips for each experiment)
for i=1 : numberOfExperiments 
    nOfHeads=0;
    nOfTrails=0;
    %this loop is for every coin flip simulation
    for j= 1 : nOfRepetitions(i)
        %we consider 1 be the heads, unidrnd(2) produces randomly 1 or 2
        thisFlip = unidrnd(2);
        if(thisFlip ==1)
            nOfHeads=nOfHeads+1;
        %we consider 2 be the trails, unidrnd(2) produces randomly 1 or 2    
        elseif(thisFlip ==2)
            nOfTrails=nOfTrails+1;
        end     
    end
    headFrequency(i)=  (nOfHeads /nOfRepetitions(i));
    trailFrequency(i)= (nOfTrails /nOfRepetitions(i));
    fprintf('for %d total coin flips, the trail relative frequency is %f or %f %%. \n',nOfRepetitions(i),trailFrequency(i),trailFrequency(i)*100 );
    fprintf('for %d total coin flips, the head relative frequency is  %f or %f %%. \n',nOfRepetitions(i),headFrequency(i),headFrequency(i)*100 );
end