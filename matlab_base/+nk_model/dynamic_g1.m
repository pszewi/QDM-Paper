function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = nk_model.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(21, 37);
g1(1,10)=(-(getPowerDeriv(y(10),(-params(2)),1)));
g1(1,19)=1;
g1(2,7)=(-((1+params(13)+y(18))/(1-params(11)-y(18))*params(4)*getPowerDeriv(y(7),params(3),1)/(y(19)*y(4))));
g1(2,11)=1;
g1(2,18)=(-(T(1)*(1+params(13)+y(18)+1-params(11)-y(18))/((1-params(11)-y(18))*(1-params(11)-y(18)))/(y(19)*y(4))));
g1(2,19)=(-((-(T(2)*y(4)))/(y(19)*y(4)*y(19)*y(4))));
g1(2,4)=(-((-(y(19)*T(2)))/(y(19)*y(4)*y(19)*y(4))));
g1(3,31)=(-((y(20)*params(5)+1-y(20))*y(32)*(-params(1))/((1+y(31))*(1+y(31)))/y(19)));
g1(3,19)=(-((y(20)*params(5)+1-y(20))*(-(params(1)/(1+y(31))*y(32)))/(y(19)*y(19))));
g1(3,32)=(-((y(20)*params(5)+1-y(20))*params(1)/(1+y(31))/y(19)));
g1(3,4)=params(5);
g1(3,20)=(-(T(3)*(params(5)-1)));
g1(4,13)=(-(y(32)*y(20)*params(1)/y(4)/(1+y(31))));
g1(4,31)=(-(y(32)*(-((1+y(13))*y(20)*params(1)/y(4)))/((1+y(31))*(1+y(31)))));
g1(4,19)=1;
g1(4,32)=(-T(10));
g1(4,4)=(-(y(32)*(1+y(13))*(-(y(20)*params(1)))/(y(4)*y(4))/(1+y(31))));
g1(4,20)=(-(y(32)*(1+y(13))*params(1)/y(4)/(1+y(31))));
g1(5,29)=(-(T(4)*y(20)*(1-params(12)-y(18))));
g1(5,18)=(-(T(4)*y(20)*(-y(29))));
g1(5,19)=(-((y(33)*(1-params(6))+y(20)*y(29)*(1-params(12)-y(18)))*(-(params(1)*y(32)))/(y(19)*y(19))));
g1(5,32)=(-((y(33)*(1-params(6))+y(20)*y(29)*(1-params(12)-y(18)))*params(1)/y(19)));
g1(5,20)=(-(T(4)*y(29)*(1-params(12)-y(18))));
g1(5,21)=1;
g1(5,33)=(-(T(4)*(1-params(6))));
g1(6,9)=(-(y(36)*(-(T(4)*y(33)*y(28)))/(y(9)*y(9))));
g1(6,28)=(-(y(36)*T(4)*y(33)/y(9)));
g1(6,19)=(-(y(36)*y(28)*y(33)*(-(params(1)*y(32)))/(y(19)*y(19))/y(9)));
g1(6,32)=(-(y(36)*y(28)*y(33)*params(1)/y(19)/y(9)));
g1(6,4)=1;
g1(6,21)=(-(1-y(24)-y(25)));
g1(6,33)=(-(y(36)*T(4)*y(28)/y(9)));
g1(6,24)=y(21);
g1(6,25)=y(21);
g1(6,36)=(-(T(4)*y(33)*y(28)/y(9)));
g1(7,6)=(-((1-params(8))*y(14)/y(7)));
g1(7,7)=(-((-((1-params(8))*y(14)*y(6)))/(y(7)*y(7))));
g1(7,11)=1;
g1(7,14)=(-((1-params(8))*y(6)/y(7)));
g1(8,6)=(-(params(8)*y(14)/y(1)));
g1(8,1)=(-((-(y(6)*params(8)*y(14)))/(y(1)*y(1))));
g1(8,12)=1;
g1(8,14)=(-(params(8)*y(6)/y(1)));
g1(9,6)=(-(y(35)*y(30)*(-((1+y(31))/(1+y(13))*y(27)))/(y(6)*y(6))/y(14)/(1-y(34))));
g1(9,27)=(-(y(35)*y(30)*(1+y(31))/(1+y(13))/y(6)/y(14)/(1-y(34))));
g1(9,13)=(-(y(35)*y(30)*y(27)*(-(1+y(31)))/((1+y(13))*(1+y(13)))/y(6)/y(14)/(1-y(34))));
g1(9,14)=(-((-((-params(9))/(y(14)*y(14))))/(1-params(9))+y(35)*(-T(6))/(y(14)*y(14))/(1-y(34))));
g1(9,30)=(-(y(35)*T(5)/y(14)/(1-y(34))));
g1(9,31)=(-(y(35)*y(30)*y(27)*1/(1+y(13))/y(6)/y(14)/(1-y(34))));
g1(9,22)=y(23)/((1-y(22))*(1-y(22)));
g1(9,34)=(-(T(6)/y(14)*y(35)/((1-y(34))*(1-y(34)))));
g1(9,23)=1/(1-y(22));
g1(9,35)=(-(T(6)/y(14)/(1-y(34))));
g1(10,6)=1;
g1(10,9)=(-1);
g1(10,10)=(-1);
g1(11,6)=1;
g1(11,7)=(-(T(11)*(1-y(22))*getPowerDeriv(y(7),1-params(8),1)));
g1(11,1)=(-(T(8)*getPowerDeriv(y(1),params(8),1)));
g1(11,22)=(-(T(11)*(-T(7))));
g1(12,1)=(-(1-params(6)));
g1(12,8)=1;
g1(12,9)=(-(1-y(24)));
g1(12,24)=y(9);
g1(13,10)=(-params(5));
g1(13,17)=1;
g1(14,7)=(-((1+y(13))*(-(y(11)*(y(18)+params(11))))));
g1(14,1)=(-((1+y(13))*(-(y(12)*(y(18)+params(12))))));
g1(14,10)=(-((1+y(13))*(-(params(13)+y(18)))));
g1(14,11)=(-((1+y(13))*(-(y(7)*(y(18)+params(11))))));
g1(14,12)=(-((1+y(13))*(-((y(18)+params(12))*y(1)))));
g1(14,13)=(-(params(16)-y(10)*(params(13)+y(18))-y(7)*y(11)*(y(18)+params(11))-y(12)*(y(18)+params(12))*y(1)+y(3)*1/(1+y(31))-y(17)));
g1(14,31)=(-(y(3)*(-(1+y(13)))/((1+y(31))*(1+y(31)))));
g1(14,3)=(-((1+y(13))/(1+y(31))));
g1(14,16)=1;
g1(14,17)=y(13);
g1(14,18)=(-((1+y(13))*((-y(10))-y(11)*y(7)-y(12)*y(1))));
g1(15,15)=(-(params(10)/2*2*y(15)));
g1(15,22)=1;
g1(16,15)=(-(params(10)*y(15)+params(10)*(1+y(15))));
g1(16,23)=1;
g1(17,2)=(-(params(7)/2*(-y(9))/(y(2)*y(2))*2*(y(9)/y(2)-1)));
g1(17,9)=(-(params(7)/2*2*(y(9)/y(2)-1)*1/y(2)));
g1(17,24)=1;
g1(18,2)=(-((y(2)*y(9)*params(7)*(-y(9))/(y(2)*y(2))-y(9)*params(7)*(y(9)/y(2)-1))/(y(2)*y(2))));
g1(18,9)=(-((params(7)*(y(9)/y(2)-1)+y(9)*params(7)*1/y(2))/y(2)));
g1(18,25)=1;
g1(19,13)=1/(1+(steady_state(8)));
g1(19,15)=(-(exp(y(26))*1/(1+(steady_state(10)))*getPowerDeriv((1+y(15))/(1+(steady_state(10))),params(17),1)));
g1(19,26)=(-T(9));
g1(20,3)=(-params(14));
g1(20,18)=1;
g1(21,5)=(-params(19));
g1(21,26)=1;
g1(21,37)=(-1);

end
