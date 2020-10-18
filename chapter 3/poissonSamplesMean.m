%%Function for exercise 3.1b
% This function gets M and n as input arguments, it creates M samples with
% sample size equal to n from Poisson ditribution with parameter lambda.
% After it calculates and plots the histogram of the M mean values of the samples
% and then it returns the mean of the M mean values.

function meanOfmeans = poissonSamplesMean(M,n, lambda)
    %bins = M / 5;
    samples = poissrnd(lambda,M,n) ;
    meanOfSamples = mean(samples');
    
    figure();
    histfit(meanOfSamples);
    
    
    meanOfmeans = mean(meanOfSamples);
    title("Mean Values from Poisson distribution samples");

    legend("mean values histogram","normal distribution");
    

end

