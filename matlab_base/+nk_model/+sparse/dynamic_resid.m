function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = nk_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(21, 1);
    residual(1) = (y(35)) - (y(26)^(-params(2)));
    residual(2) = (y(27)) - (T(2)/(y(35)*y(15)));
    residual(3) = (params(5)*y(15)) - (T(3)*(y(36)*params(5)+1-y(36)));
    residual(4) = (y(35)) - (y(56)*T(10));
    residual(5) = (y(37)) - (T(4)*(y(58)*(1-params(6))+y(36)*y(49)*(1-params(12)-y(34))));
    residual(6) = (y(15)) - (y(37)*(1-y(40)-y(41))+T(4)*y(58)*y(46)/y(25)*y(62));
    residual(7) = (y(27)) - ((1-params(8))*y(30)*y(22)/y(23));
    residual(8) = (y(28)) - (y(22)*params(8)*y(30)/y(3));
    residual(9) = (y(39)/(1-y(38))) - ((1-params(9)/y(30))/(1-params(9))+T(6)/y(30)*y(60)/(1-y(59)));
    residual(10) = (y(22)) - (y(26)+y(25)+params(16));
    residual(11) = (y(22)) - (T(8)*T(11));
    residual(12) = (y(24)) - ((1-y(40))*y(25)+(1-params(6))*y(3));
    residual(13) = (y(33)) - (y(26)*params(5));
    residual(14) = (y(32)) - ((1+y(29))/(1+y(52))*y(11)-y(29)*y(33)+(1+y(29))*(params(16)-y(26)*(params(13)+y(34))-y(23)*y(27)*(y(34)+params(11))-y(28)*(y(34)+params(12))*y(3)));
    residual(15) = (y(38)) - (params(10)/2*y(31)^2);
    residual(16) = (y(39)) - (params(10)*y(31)*(1+y(31)));
    residual(17) = (y(40)) - (params(7)/2*(y(25)/y(4)-1)^2);
    residual(18) = (y(41)) - (y(25)*params(7)*(y(25)/y(4)-1)/y(4));
    residual(19) = ((1+y(29))/(1+(steady_state(8)))) - (T(9));
    residual(20) = (y(34)-(steady_state(13))) - (params(14)*(y(11)-(steady_state(11))));
    residual(21) = (y(42)) - (params(19)*y(21)+x(1));
end
