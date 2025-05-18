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
run_loop        = 1;        % Set to "1" if you want to execute the FOR-loop!
loopcount       = 3;
loop_robustness = linspace(0.5,1.5,loopcount);

% Loop options for policy counterfactuals
% different policies are numbered 1-4 
run_loop_rules        = 1;        % Set to "1" if you want to execute the FOR-loop!
rules = [1:4];

%% ------------------------------------------------------------------------
% Parameters
% -------------------------------------------------------------------------

% BASE PARAMETERS ----------------
% Households
% par.betta   = 0.99;
% par.sig     = 2;
% par.gam     = 4;
% par.nuu     = 0.5;
% par.delt    = 0.025;
% par.phiX    = 2;

% % Firms
% par.alp     = 0.3;
% par.rhoo    = 0.8;
% par.kap     = 60;

% % Government
% par.lgY_ss  = 0.2;
% par.tauL    = 0.2;
% par.tauK    = 0.2;
% par.tauC    = 0.2;
% par.gamLG   = 0.2;

% % Monetary policy
% par.tetPi   = 1.5;

% OUR PARAMETERS ----------------
% Households
par.betta   = 0.94;
par.sig     = 2;
par.gam     = 3;
par.nuu     = 0.5;
par.delt    = 0.1;
% par.phiX    = 2;
par.phiX    = 12;

% Firms
par.alp     = 0.31;
par.rhoo    = 0.8;
% par.kap     = 60;
par.kap     = 120;

% Government
par.lgY_ss  = 0.2;
par.tauL    = 0.225;
par.tauK    = 0.299;
par.tauC    = 0.164;
par.gamLG   = 0.2;


% Monetary policy
par.tetPi   = 1;
par.tetMC = 1.0;
par.tetL = 1.0;

% Shock standard deviations
% par.stdM    = 0.001;
par.stdMC    = 1;

% Shock autocorrelations
% par.rhoM    = 0.5;
par.rhoMC    = 0.5;



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
T = readtable('../data/empirics.csv', ReadVariableNames=true);
T.index = transpose([1:81]);
T = T(mod(T.index,4)==0, :);


% Impulse Responses Productivity
figure('Name','IRFs to a marginal cost shock')
tiledlayout(1,3)

nexttile
title('Real GDP')
hold on
plot(Y_eMC./stst.Y.*100,'LineWidth',2);
%plot actual data
plot(T.dev_trend*100,'LineWidth',2);
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
%plot actual data
plot(T.dev_pi,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Total Hours Worked')
hold on
plot(L_eMC./stst.L.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

saveas(gcf, "output/main_baseline_policy.png")

% ---------------------------------------
%  Second graph
% ---------------------------------------

% Impulse Responses Productivity
figure('Name','IRFs to a marginal cost shock')
tiledlayout(3,3)

nexttile
title('Labour')
hold on
plot(L_eMC/stst.L.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Capital')
hold on
plot(K_eMC/stst.K.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Consumption')
hold on
plot(C_eMC/stst.C.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Wages')
hold on
plot(w_eMC./stst.w.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Return on Capital')
hold on
plot(r_eMC/stst.r.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Investment')
hold on
plot(X_eMC/stst.X.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Interest Rate')
hold on
plot(rb_eMC/stst.rb.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Marginal Costs')
hold on
plot(mc_act_eMC/stst.mc_act.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Money stock')
hold on
plot(m_eMC/stst.m.*100,'LineWidth',2);
% ADD FURTHER SHOCKS SYMMETRICALLY
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

saveas(gcf, "output/other_baseline_policy.png")

%% ------------------------------------------------------------------------
% IRF ROBUSTNESS ANALYSIS - Labor Supply Elasticity 
% -------------------------------------------------------------------------

if run_loop == 1

for tt = 1:length(loop_robustness)
    % Set theta_pi of baseline policy rule
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
    output_eMC(:,tt)         = Y_eMC./stst.Y;
    inflation_eMC(:,tt)      = pii_eMC;
    labour_eMC(:,tt)      = L_eMC./stst.L;

end

% Impulse Responses Productivity
figure('Name','IRFs to a positive productivity shock (robustness)')
F = tiledlayout(1,3);

nexttile
title('Real GDP') % Title for this tile
hold on
plot(output_eMC(:,1).*100,'b-','LineWidth',2);
plot(output_eMC(:,2).*100,'r--','LineWidth',2);
plot(output_eMC(:,3).*100,'g-.','LineWidth',2);
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Inflation') % Title for this tile
hold on
plot(inflation_eMC(:,1).*100,'b-','LineWidth',2)
plot(inflation_eMC(:,2).*100,'r--','LineWidth',2)
plot(inflation_eMC(:,3).*100,'g-.','LineWidth',2)
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Total Hours Worked')
hold on
plot(labour_eMC(:,1).*100,'b-','LineWidth',2)
plot(labour_eMC(:,2).*100,'r--','LineWidth',2)
plot(labour_eMC(:,3).*100,'g-.','LineWidth',2)
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')


title(F,'Impulse Responses to a Marginal Cost Shock') % Title for the entire figure
leg = legend('$\theta_\pi = 0.5$','$\theta_\pi = 1$','$\theta_\pi = 1.5$','Orientation', 'Horizontal');
set(leg, 'Interpreter','latex')
leg.Layout.Tile = 'south';
title(leg,'Policy Rule Parameter')

saveas(gcf, "output/policy_par_variation.png")

end

% ---------------------------------------
%           Policy Counterfactuals
% ---------------------------------------

if run_loop_rules == 1
    
    for tt = rules
        % Change policy 
    % Call Dynare to initialize model (YOU DO NOT HAVE DO CHANGE ANYTHING HERE)
    eval(['dynare nk_model.dyn -Dreplic_number=' num2str(replicnumber) ...
        ' -DRULE=' num2str(tt) ...
            ' -Dsimul_replic_number=' num2str(simreplicnumber) ' -Ddrop_number=' num2str(dropnumber) ...
                ' -Dapprox_order=' num2str(approxorder) ' -Dirf_periods=' num2str(irfperiod) ...
                    ' -Dsim_periods=' num2str(simperiod) ' noclearall;']);

                    % Calculate Steady States (YOU DO NOT HAVE DO CHANGE ANYTHING HERE)
                    for ii = 1:length(oo_.dr.ys)
                        eval(['stst.' strjoin(cellstr(M_.endo_names(ii))) ' = oo_.dr.ys(' num2str(ii) ');']);
                    end
                    
    % Save IRFs of each iteration
    output_eMC(:,tt)         = Y_eMC./stst.Y;
    inflation_eMC(:,tt)      = pii_eMC;
    labour_eMC(:,tt)      = L_eMC./stst.L;

end

% Impulse Responses Productivity
figure('Name','IRFs to a positive mc shock (robustness)')
F = tiledlayout(1,3);

nexttile
title('Real GDP') % Title for this tile
hold on
plot(output_eMC(:,1).*100,'b-','LineWidth',2);
plot(output_eMC(:,2).*100,'r--','LineWidth',2);
plot(output_eMC(:,3).*100,'g-.','LineWidth',2);
plot(output_eMC(:,4).*100,'g-.','LineWidth',2);
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Inflation') % Title for this tile
hold on
plot(inflation_eMC(:,1).*100,'b-','LineWidth',2)
plot(inflation_eMC(:,2).*100,'r--','LineWidth',2)
plot(inflation_eMC(:,3).*100,'g-.','LineWidth',2)
plot(inflation_eMC(:,4).*100,'g-.','LineWidth',2)
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')

nexttile
title('Total Hours Worked')
hold on
plot(labour_eMC(:,1).*100,'b-','LineWidth',2)
plot(labour_eMC(:,2).*100,'r--','LineWidth',2)
plot(labour_eMC(:,3).*100,'g-.','LineWidth',2)
plot(labour_eMC(:,4).*100,'g-.','LineWidth',2)
yline(0,'r')
hold off
axis tight
xlabel('Periods')
ylabel('%-Dev. St.St.')


title(F,'Impulse Responses to a Marginal Cost Shock') % Title for the entire figure
leg = legend('$pol = 1$','$pol = 2$','$pol = 3$', '$pol = 4$','Orientation', 'Horizontal');
set(leg, 'Interpreter','latex')
leg.Layout.Tile = 'south';
title(leg,'Different Policy Rules')


saveas(gcf, "output/policy_rule_variation.png")


end

% ----------------------------- End of File -------------------------------