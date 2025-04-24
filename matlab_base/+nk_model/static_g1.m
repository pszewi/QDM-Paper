function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = nk_model.static_g1_tt(T, y, x, params);
end
g1 = zeros(21, 21);
g1(1,5)=(-(getPowerDeriv(y(5),(-params(2)),1)));
g1(1,14)=1;
g1(2,2)=(-((1+params(13)+y(13))/(1-params(11)-y(13))*params(4)*getPowerDeriv(y(2),params(3),1)/(y(14)*y(15))));
g1(2,6)=1;
g1(2,13)=(-(T(1)*(1+params(13)+y(13)+1-params(11)-y(13))/((1-params(11)-y(13))*(1-params(11)-y(13)))/(y(14)*y(15))));
g1(2,14)=(-((-(T(2)*y(15)))/(y(14)*y(15)*y(14)*y(15))));
g1(2,15)=(-((-(y(14)*T(2)))/(y(14)*y(15)*y(14)*y(15))));
g1(3,10)=(-((y(15)*params(5)+1-y(15))*(-params(1))/((1+y(10))*(1+y(10)))));
g1(3,15)=params(5)-params(1)/(1+y(10))*(params(5)-1);
g1(4,8)=(-(y(14)*params(1)/(1+y(10))));
g1(4,10)=(-(y(14)*(-(params(1)*(1+y(8))))/((1+y(10))*(1+y(10)))));
g1(4,14)=1-params(1)*(1+y(8))/(1+y(10));
g1(5,7)=(-(params(1)*y(15)*(1-params(12)-y(13))));
g1(5,13)=(-(params(1)*y(15)*(-y(7))));
g1(5,15)=(-(params(1)*y(7)*(1-params(12)-y(13))));
g1(5,16)=1-params(1)*(1-params(6));
g1(6,15)=1;
g1(6,16)=(-(1-y(19)-y(20)+params(1)*y(20)));
g1(6,19)=y(16);
g1(6,20)=(-(params(1)*y(16)-y(16)));
g1(7,1)=(-((1-params(8))*y(9)/y(2)));
g1(7,2)=(-((-((1-params(8))*y(9)*y(1)))/(y(2)*y(2))));
g1(7,6)=1;
g1(7,9)=(-((1-params(8))*y(1)/y(2)));
g1(8,1)=(-(params(8)*y(9)/y(3)));
g1(8,3)=(-((-(y(1)*params(8)*y(9)))/(y(3)*y(3))));
g1(8,7)=1;
g1(8,9)=(-(params(8)*y(1)/y(3)));
g1(9,8)=(-(y(18)*(-(1+y(10)))/((1+y(8))*(1+y(8)))/(1-y(17))));
g1(9,9)=(-((-((-params(9))/(y(9)*y(9))))/(1-params(9))));
g1(9,10)=(-(y(18)*1/(1+y(8))/(1-y(17))));
g1(9,17)=y(18)/((1-y(17))*(1-y(17)))-y(18)*(1+y(10))/(1+y(8))/((1-y(17))*(1-y(17)));
g1(9,18)=1/(1-y(17))-(1+y(10))/(1+y(8))/(1-y(17));
g1(10,1)=1;
g1(10,4)=(-1);
g1(10,5)=(-1);
g1(11,1)=1;
g1(11,2)=(-(T(5)*(1-y(17))*getPowerDeriv(y(2),1-params(8),1)));
g1(11,3)=(-(T(4)*getPowerDeriv(y(3),params(8),1)));
g1(11,17)=(-(T(5)*(-T(3))));
g1(12,3)=1-(1-params(6));
g1(12,4)=(-(1-y(19)));
g1(12,19)=y(4);
g1(13,5)=(-params(5));
g1(13,12)=1;
g1(14,2)=(-((1+y(8))*(-(y(6)*(y(13)+params(11))))));
g1(14,3)=(-((1+y(8))*(-(y(7)*(y(13)+params(12))))));
g1(14,5)=(-((1+y(8))*(-(params(13)+y(13)))));
g1(14,6)=(-((1+y(8))*(-(y(2)*(y(13)+params(11))))));
g1(14,7)=(-((1+y(8))*(-(y(3)*(y(13)+params(12))))));
g1(14,8)=(-(params(16)-y(5)*(params(13)+y(13))-y(2)*y(6)*(y(13)+params(11))-y(3)*y(7)*(y(13)+params(12))+y(11)*1/(1+y(10))-y(12)));
g1(14,10)=(-(y(11)*(-(1+y(8)))/((1+y(10))*(1+y(10)))));
g1(14,11)=1-(1+y(8))/(1+y(10));
g1(14,12)=y(8);
g1(14,13)=(-((1+y(8))*((-y(5))-y(6)*y(2)-y(7)*y(3))));
g1(15,10)=(-(params(10)/2*2*y(10)));
g1(15,17)=1;
g1(16,10)=(-(y(10)*params(10)+(1+y(10))*params(10)));
g1(16,18)=1;
g1(17,19)=1;
g1(18,20)=1;
g1(19,8)=(1+(y(8))-(1+y(8)))/((1+(y(8)))*(1+(y(8))));
g1(19,10)=(-(exp(y(21))*(1+(y(10))-(1+y(10)))/((1+(y(10)))*(1+(y(10))))*getPowerDeriv((1+y(10))/(1+(y(10))),params(17),1)));
g1(19,21)=(-T(6));
g1(21,21)=1-params(19);

end
