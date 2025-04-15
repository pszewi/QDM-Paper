%% ************************************************************************
% Quantitative Dynamic Macroeconomics
% Project: New-Keynesian (NK) Model with Capital and Fiscal Policy
% Konstantin Gantert - Tilburg University
% 01/04/2025
% *************************************************************************
%% ------------------------------------------------------------------------
% .:. Model Selection and Housekeeping .:.
% -------------------------------------------------------------------------
% Clear workspace
clear all;
clc;

% Dynare options
approxorder     = 1;        % Set Approximation Order
irfperiod       = 20;       % Set Impulse Response Function Periods
simperiod       = 20000;    % Set Simulation Periods
replicnumber    = 10;       % Set Number of Replications
simreplicnumber = 10;       % Set Number of Simulation Replications
dropnumber      = 1000;     % Set Number of Simulation Periods dropped

%% ------------------------------------------------------------------------
% Parameters
% -------------------------------------------------------------------------
% Households
par.betta   = 0.99;
par.sig     = 2;
par.gam     = 4;
par.nuu     = 0.5;
par.delt    = 0.025;
par.phiX    = 2;

% Firms
par.alp     = 0.3;
par.rhoo    = 0.8;
par.kap     = 60;

% Government
par.lgY_ss  = 0.2;
par.tauL    = 0.2;
par.tauK    = 0.2;
par.tauC    = 0.2;
par.gamLG   = 0.2;

% Monetary policy
par.tetPi   = 1.5;

% Shock standard deviations
par.stdM    = 0.001;

% Shock autocorrelations
par.rhoM    = 0.5;

%% ------------------------------------------------------------------------
% Impulse Response Analysis - Default Model
% -------------------------------------------------------------------------
% Call Dynare to initialize model (YOU DO NOT HAVE TO CHANGE ANYTHING HERE)
eval(['dynare nk_model.dyn -Dreplic_number=' num2str(replicnumber) ...
	' -Dsimul_replic_number=' num2str(simreplicnumber) ' -Ddrop_number=' num2str(dropnumber) ...
	' -Dapprox_order=' num2str(approxorder) ' -Dirf_periods=' num2str(irfperiod) ...
	' -Dsim_periods=' num2str(simperiod) ' noclearall;']);

% Calculate Steady States (YOU DO NOT HAVE TO CHANGE ANYTHING HERE)
for ii = 1:length(oo_.dr.ys)
	eval(['stst.' strjoin(cellstr(M_.endo_names(ii))) ' = oo_.dr.ys(' num2str(ii) ');']);
end

% ----------------------------- End of File -------------------------------