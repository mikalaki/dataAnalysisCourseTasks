%%Function for exercise 3.2b
% This function gets M and n as input arguments, it creates M samples with
% sample size equal to n from exponential ditribution with parameter lambda.
% After it calculates and plots the histogram of the M mean values of the samples
% and then it returns the mean of the M mean values.

function meanOfmeans = exponentialSamplesMean(M,n, lambda)
    %bins = M / 5;
    samples = exprnd(lambda,M,n) ;
    meanOfSamples = mean(samples');
    
    figure();
    histfit(meanOfSamples);
    
    
    meanOfmeans = mean(meanOfSamples);
    title("Mean Values from Exponential distribution samples");

    legend("mean values histogram","normal distribution");
    

end

