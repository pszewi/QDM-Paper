% labour share of income
alpha = readtable('../data/labourShareOfIncome_CA.csv');
% Plot alpha
plot(alpha.observation_date, alpha.LABSHPCAA156NRUG)

%listing all vars
whos

