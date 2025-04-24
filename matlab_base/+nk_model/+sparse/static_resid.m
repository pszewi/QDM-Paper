function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(6, 1);
end
[T_order, T] = nk_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(21, 1);
    residual(1) = (y(14)) - (y(5)^(-params(2)));
    residual(2) = (y(6)) - (T(2)/(y(14)*y(15)));
    residual(3) = (y(15)*params(5)) - (params(1)/(1+y(10))*(y(15)*params(5)+1-y(15)));
    residual(4) = (y(14)) - (y(14)*params(1)*(1+y(8))/(1+y(10)));
    residual(5) = (y(16)) - (params(1)*(y(16)*(1-params(6))+y(15)*y(7)*(1-params(12)-y(13))));
    residual(6) = (y(15)) - (y(16)*(1-y(19)-y(20))+y(20)*params(1)*y(16));
    residual(7) = (y(6)) - ((1-params(8))*y(9)*y(1)/y(2));
    residual(8) = (y(7)) - (y(1)*params(8)*y(9)/y(3));
    residual(9) = (y(18)/(1-y(17))) - ((1-params(9)/y(9))/(1-params(9))+y(18)*(1+y(10))/(1+y(8))/(1-y(17)));
    residual(10) = (y(1)) - (y(5)+y(4)+params(16));
    residual(11) = (y(1)) - (T(4)*T(5));
    residual(12) = (y(3)) - ((1-y(19))*y(4)+(1-params(6))*y(3));
    residual(13) = (y(12)) - (y(5)*params(5));
    residual(14) = (y(11)) - (y(11)*(1+y(8))/(1+y(10))-y(8)*y(12)+(1+y(8))*(params(16)-y(5)*(params(13)+y(13))-y(2)*y(6)*(y(13)+params(11))-y(3)*y(7)*(y(13)+params(12))));
    residual(15) = (y(17)) - (params(10)/2*y(10)^2);
    residual(16) = (y(18)) - ((1+y(10))*y(10)*params(10));
residual(17) = y(19);
residual(18) = y(20);
    residual(19) = ((1+y(8))/(1+(y(8)))) - (T(6));
    residual(20) = (y(13)-(y(13))) - (params(14)*(y(11)-(y(11))));
    residual(21) = (y(21)) - (y(21)*params(19)+x(1));
end
