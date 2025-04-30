function [ys,params,check] = nk_model_steadystate(ys,exo,M_,options_)

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;

%% Model equations block - Default and Natural Model
% Shock processes
% sM      = 0;
sMC      = 0;

% Inflation
pii     = 0;
cp      = 0;
cpp     = 0;
% Tax surcharge
tauu    = 0;
% Investment adjustment cost
ci      = 0;
cii     = 0;
% Nominal interest rate
rb      = 1/betta - 1;
% Labor supply
L       = 1;
% Cash-in-advance constraint
muu     = betta/(nuu-betta*(nuu-1));
% Marginal cost
mc      = rhoo;
% Capital-labor ratio
kl = ( alp*rhoo*(1-tauK)/((1-betta*(1-delt))/betta) )^(1/(1-alp));
% Government spending
gs = (1+rb/(1+rb)*(nuu+tauC))^(-1) ...
        * ( rb/(1+rb)*(nuu+tauC)*(1-delt*kl^(1-alp)) ...
            - lgY_ss*rb/(1+rb) ...
            + (tauL*(1-alp)+tauK*alp)*mc );
% Consumption-labor ratio
cl = (1-gs)*kl^(alp) - delt*kl ;
% Labor disutility parameter given normalization L=1
vphi    = (1-alp)*rhoo*(1-tauL)/(1+tauC)*muu ...
           * kl^(alp) * cl^(-sig);
% Private consumption
C       = cl*L;
% Capital stock
K       = kl*L;
% Money supply
m       = (nuu)*(1+tauC+tauu)*C;
% Private investment
X       = delt*K;
% Real GDP / output
Y       = L^(1-alp)*K^alp;
% Government spending
g_ss    = gs*Y;
% Real wage
w       = (1-alp)*Y/L*mc;
% Marginal utility
muc     = C^(-sig);
% Private capital law of motion penalty price
tet     = muu;
% Capital interest rate
r       = alp*Y/K*mc;
% Taxes implied by government budget constraint
lg      = m - (1+rb)/rb*( g_ss-(tauC)*C-(tauL)*w*L-(tauK)*r*K );

%% end own model equations

params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end