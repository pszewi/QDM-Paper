function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = nk_model.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(21, 1);
    residual(1) = (y(19)) - (y(10)^(-params(2)));
    residual(2) = (y(11)) - (T(2)/(y(19)*y(4)));
    residual(3) = (params(5)*y(4)) - (T(3)*(y(20)*params(5)+1-y(20)));
    residual(4) = (y(19)) - (y(32)*T(10));
    residual(5) = (y(21)) - (T(4)*(y(33)*(1-params(6))+y(20)*y(29)*(1-params(12)-y(18))));
    residual(6) = (y(4)) - (y(21)*(1-y(24)-y(25))+T(4)*y(33)*y(28)/y(9)*y(36));
    residual(7) = (y(11)) - ((1-params(8))*y(14)*y(6)/y(7));
    residual(8) = (y(12)) - (y(6)*params(8)*y(14)/y(1));
    residual(9) = (y(23)/(1-y(22))) - ((1-params(9)/y(14))/(1-params(9))+T(6)/y(14)*y(35)/(1-y(34)));
    residual(10) = (y(6)) - (y(10)+y(9)+params(16));
    residual(11) = (y(6)) - (T(8)*T(11));
    residual(12) = (y(8)) - ((1-y(24))*y(9)+(1-params(6))*y(1));
    residual(13) = (y(17)) - (y(10)*params(5));
    residual(14) = (y(16)) - ((1+y(13))/(1+y(31))*y(3)-y(13)*y(17)+(1+y(13))*(params(16)-y(10)*(params(13)+y(18))-y(7)*y(11)*(y(18)+params(11))-y(12)*(y(18)+params(12))*y(1)));
    residual(15) = (y(22)) - (params(10)/2*y(15)^2);
    residual(16) = (y(23)) - (params(10)*y(15)*(1+y(15)));
    residual(17) = (y(24)) - (params(7)/2*(y(9)/y(2)-1)^2);
    residual(18) = (y(25)) - (y(9)*params(7)*(y(9)/y(2)-1)/y(2));
    residual(19) = ((1+y(13))/(1+(steady_state(8)))) - (T(9));
    residual(20) = (y(18)-(steady_state(13))) - (params(14)*(y(3)-(steady_state(11))));
    residual(21) = (y(26)) - (params(19)*y(5)+x(it_, 1));

end
