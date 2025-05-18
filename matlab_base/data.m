% labour share of income
alpha = readtable('../data/labourShareOfIncome_CA.csv');
% Plot alpha
%title('Labour Share of Income')
%plot(alpha.observation_date, alpha.LABSHPCAA156NRUG)
%xlabel('Time')
%ylabel('\alpha')

% inflation
pi = readtable('../data/canada_lng_term_data.xlsx', Range="E1:BQ2", ReadVariableNames=true); 
% pivot_longer
pi_t = stack(pi, pi.Properties.VariableNames(1:end), 'NewDataVariableName', 'pi',  'IndexVariableName','year');
%take mean
mean_pi = mean(pi_t.pi);
% Remove the 'x' prefix and convert to numeric
pi_t.year = str2double(extractAfter(string(pi_t.year), 1));
% col with percent deviation from lr mean
pi_t.dev_pi = (pi_t.pi - mean_pi) ./ mean_pi;
% Convert the numeric years to datetime format
%pi_t.year = datetime(pi_t.year, 1, 1); % Assuming January 1st as the date

%GDP
gdp = readtable('../data/NGDPRSAXDCCAQ.csv', ReadVariableNames=true);
%filter so data is symmetric around IRF period (1979-1999) -> 1961-2017

% apply hpfilter to GDP
[gdp.trend, gdp.cyclical] = hpfilter(gdp.NGDPRSAXDCCAQ, FilterType="one-sided");
% dev in % of actual from hp
gdp.dev_trend = (gdp.NGDPRSAXDCCAQ - gdp.trend) ./ gdp.trend;
%add year col
gdp.year = year(gdp.observation_date);
%calc mean of non-cyclical GDP
mean_detrended_gdp = mean(gdp.trend);
% deviation from non-cyclical mean GDP
gdp.dev_mean = (gdp.NGDPRSAXDCCAQ - mean_detrended_gdp) ./ mean_detrended_gdp;
%join gdp and pi
df = join(gdp, pi_t, 'Keys','year');

% Define the date range for filtering
start_date = datetime('1981-01-01');
end_date = datetime('2001-01-01');

% Filter the table based on the date range and select specific columns
df = df(df.observation_date >= start_date & df.observation_date <= end_date, {'observation_date', 'dev_trend', 'dev_pi'});



writetable(df,'..\data\empirics.csv','Delimiter',' ')  

% Plot 
figure('Name','Data')
T = tiledlayout(1,1);

nexttile
title('Deviation from st. st.') % Title for this tile
plot(df.observation_date, df.dev_trend*100, 'b')
xlabel('Time') 
ylabel('dev from st. st. in %')     
hold on
plot(df.observation_date, df.dev_pi, 'r')   
legend('GDP','\pi') 
hold off

title(T,'Data') % Title for the entire figure

%listing all vars
whos
% end

