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

% Loop options
run_loop        = 0;        % Set to "1" if you want to execute the FOR-loop!
loopcount       = 3;
loop_robustness = linspace(1,3,loopcount);

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
% par.stdM    = 0.001;
par.stdMC    = 0.001;

% Shock autocorrelations
% par.rhoM    = 0.5;
par.rhoMC    = 0.6;

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

%% ------------------------------------------------------------------------
% IRF Plotting - Default Model
% -------------------------------------------------------------------------

% Impulse Responses Productivity
figure('Name','IRFs to a marginal cost shock')
tiledlayout(1,2)

nexttile
title('Real GDP')
hold on
plot(Y_eMC./stst.Y.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Inflation')
hold on
plot(pii_eMC.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')


%% ------------------------------------------------------------------------
% IRF ROBUSTNESS ANALYSIS - Labor Supply Elasticity 
% -------------------------------------------------------------------------

if run_loop == 1

for tt = 1:length(loop_robustness)
    % Set Frisch Elasticity of Labor Supply
    par.gam = loop_robustness(tt);
    % Call Dynare to initialize model (YOU DO NOT HAVE DO CHANGE ANYTHING HERE)
    eval(['dynare nk_model.dyn -Dreplic_number=' num2str(replicnumber) ...
	    ' -Dsimul_replic_number=' num2str(simreplicnumber) ' -Ddrop_number=' num2str(dropnumber) ...
	    ' -Dapprox_order=' num2str(approxorder) ' -Dirf_periods=' num2str(irfperiod) ...
	    ' -Dsim_periods=' num2str(simperiod) ' noclearall;']);

    % Calculate Steady States (YOU DO NOT HAVE DO CHANGE ANYTHING HERE)
    for ii = 1:length(oo_.dr.ys)
	    eval(['stst.' strjoin(cellstr(M_.endo_names(ii))) ' = oo_.dr.ys(' num2str(ii) ');']);
    end

    % Save IRFs of each iteration
    output_eM(:,tt)         = Y_eM./stst.Y;
    inflation_eM(:,tt)      = pii_eM;

end

% Impulse Responses Productivity
figure('Name','IRFs to a positive productivity shock (robustness)')
T = tiledlayout(1,2);

nexttile
title('Real GDP') % Title for this tile
hold on
plot(output_eM(:,1).*100,'b-','LineWidth',2);
plot(output_eM(:,2).*100,'r--','LineWidth',2);
plot(output_eM(:,3).*100,'g-.','LineWidth',2);
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Inflation') % Title for this tile
hold on
plot(inflation_eM(:,1).*100,'b-','LineWidth',2)
plot(inflation_eM(:,2).*100,'r--','LineWidth',2)
plot(inflation_eM(:,3).*100,'g-.','LineWidth',2)
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

title(T,'Impulse Responses to a Monetary Policy Shock') % Title for the entire figure
leg = legend('$\gamma = 1$','$\gamma = \frac{1}{2}$','$\gamma = \frac{1}{3}$','Orientation', 'Horizontal');
set(leg, 'Interpreter','latex')
leg.Layout.Tile = 'south';
title(leg,'Frisch Elasticity')

end


% ----------------------------- End of File -------------------------------