%% Data analysis - Exercise 3.5 - Confidence Interval and Null Hypothesis test on StD and mean value, Goodness-of-Fit test + Application
clear all;
clc;

% The data is from the Old Faithful gazer in US, 
% 1st column: waiting time of eruption,1989 in minutes
% 2nd column: eruption's duration,1989 in minutes
% 3rd column: waiting time of eruption,2006 in minutes
data = importdata("eruption.dat.txt");

% Programm parameters
alpha = 0.05; 
% 3.5 (a) StD (Standart Deviation) Confindence interval and Null Hypothesis
% test for the 3 different characteristics
stD_a_waitingTime = 10 ;
var_a_waitingTime = stD_a_waitingTime^2;

stD_a_duration = 10 ;
var_a_duration = stD_a_duration^2;

% The variance's values I want to apply null hypothesis testing.
variancesTest = [var_a_waitingTime,var_a_duration,var_a_waitingTime];

% Initialization of variables when null hypothesis test results will be
% saved
hTests_var = zeros(3,1);
% Initialization of variables where Variance confidence intervals will be
% saved
Var_CIs = zeros(3,2);
StD_CIs = zeros(3,2);

indications = ["waiting time of eruption,1989,","eruption's duration,1989,","waiting time of eruption,2006,"];
fprintf("3.5.a)\n");
for i = 1:3
    [hTests_var(i),p,Var_CIs(i,:),stats] = vartest( data(:,i),variancesTest(i),"Alpha",alpha);
    StD_CIs = sqrt(Var_CIs);
    fprintf("For standart deviation of %s the confidence interval is [ %f , %f ]\n",indications(i),StD_CIs(i,1),StD_CIs(i,2));  
    if(hTests_var(i) ==1)
        fprintf("Null hypothesis that standart deviation of %s equal to %d is rejected.\n\n",indications(i), sqrt(variancesTest(i)) );
    else
        fprintf("Null hypothesis that standart deviation of %s equal to %d is accepted.\n\n",indications(i), sqrt(variancesTest(i)) );
    end
end
% 3.5 (b) Mean Value Confindence interval and Null Hypothesis
% test for the 3 different characteristics
meanValuesForTest = [75,2.5,75];
hTests_mu = zeros(3,1);
mu_CIs = zeros(3,2);
fprintf("3.5.b)\n");
for i = 1:3
    [hTests_mu(i),p,mu_CIs(i,:),stats] = ttest(data(:,i),meanValuesForTest(i),"Alpha",alpha);
    fprintf("For mean value of %s the confidence interval is [ %f , %f ]\n",indications(i),mu_CIs(i,1),mu_CIs(i,2));  
    if(hTests_mu(i) ==1)
        fprintf("Null hypothesis that mean value of %s equal to %d is rejected.\n\n",indications(i), meanValuesForTest(i) );
    else
        fprintf("Null hypothesis that mean value of %s equal to %d is accepted.\n\n",indications(i), meanValuesForTest(i) );
    end
end

% 3.5 (c) Goodness-of-Fit to Normal Distribution of the Data.
hTests_gof = zeros(3,1);
p_values_gof = zeros(3,1);
fprintf("3.5.c)\n");
for i = 1:3
    [hTests_gof(i),p_values_gof(i),stats] = chi2gof(data(:,i));
    
    fprintf("For %s the p-value of goodness of fit to normal distribution is %f .\n",indications(i),p_values_gof(i));  
    if(hTests_gof(i) ==1)
        fprintf("Null hypothesis that the data of %s comes from a normal distribution is rejected.\n\n",indications(i) );
    else
        fprintf("Null hypothesis that the data of %s comes from a normal distribution is accepted.\n\n",indications(i) );
    end
     
    % Ploting a histogram of our values along with normal distribution.
    figure();
    histfit(data(:,i),20);
    ourTitle=sprintf("Goodness-of-fit for %s",indications(i));
    ourLegend_arg_1=sprintf("%s values",indications(i)); 
    title(ourTitle);
    legend(ourLegend_arg_1,"Normal Distribution");
    xlabel("values");
    ylabel("frequency");
end
%% Can the bellow sentence be accepted?
%   ”With an error of 10
%    minutes, Old Faithful will erupt 65 minutes after an eruption lasting
%    less than 2.5 minutes or 91 minutes after an eruption lasting more
%    than 2.5 minutes.”
% Answer: -> We will make our analysis based on the previous questions'
% solution and of course our given data for year 1989,as we have both
% waiting times and eruptions' durations. (conclusion in ln. 127)

% The waiting times after eruptions that lasts less than 2.5 minutes:
waiting_times_all = data(:,1);
waiting_times_less = waiting_times_all(data(:,2)<2.5 );

% The waiting times after eruptions that lasts more than 2.5 minutes:
waiting_times_more = waiting_times_all(data(:,2)>=2.5);

mu_waiting_time_l = 65; %expected waiting time where eruption lasts less than 2.5 minutes
mu_waiting_time_m = 91; %expected waiting time where eruption lasts more than 2.5 minutes
ex_StD = 10;
ex_var = ex_StD^2;

% Getting CI for mean value and null Hypothesis test for mean value.
[hTest_mu_waitT_l,p_wT_l,mu_waitTime_l_CI,~] = ttest(waiting_times_less,mu_waiting_time_l,"Alpha",alpha);
[hTest_mu_waitT_m,p_wT_m,mu_waitTime_m_CI,~] = ttest(waiting_times_more,mu_waiting_time_m,"Alpha",alpha);

% Getting CI for mean value and null Hypothesis test for variable - Standart Deviation.
[hTest_var_waitT_l,p_Var_waitT_l,Var_waitT_l_CI,stats] = vartest( waiting_times_less,ex_var,"Alpha",alpha);
[hTest_var_waitT_m,p_Var_waitT_m,Var_waitT_m_CI,~] = ttest(waiting_times_more,ex_var,"Alpha",alpha);

% Get StD CIs from Variance CIs
StD_waitT_l_CI  = sqrt( Var_waitT_l_CI );
StD_waitT_m_CI  = sqrt( Var_waitT_m_CI );

fprintf("For waiting times after eruptions that lasts less than 2.5 min mean value confidence interval is [ %.3f , %.3f ]\n", ...
    mu_waitTime_l_CI(1),mu_waitTime_l_CI(2));
fprintf("For waiting times after eruptions that lasts less than 2.5 min StD confidence interval is [ %.3f , %.3f ]\n\n", ...
    StD_waitT_l_CI(1),StD_waitT_l_CI(2));

fprintf("For waiting times after eruptions that lasts more than 2.5 min mean value confidence interval is [ %.3f , %.3f ]\n", ...
    mu_waitTime_m_CI(1),mu_waitTime_m_CI(2));
fprintf("For waiting times after eruptions that lasts more than 2.5 min StD confidence interval is [ %.3f , %.3f ]\n", ...
    StD_waitT_m_CI(1),StD_waitT_m_CI(2));

% From the values printed above we see that the waiting times are in general
% are smaller, than these that are documented in the sentence of wikipedia,
% but considered that is documented an error of 10, in the values
% documented, if we subtract 10 for them, we the values left are in our
% mean value CI. So we can say that this sentence is no completely false,
% but it would be more accurate if the documented values where inside mean
% values CI , and our standart deviation was about 10. 


