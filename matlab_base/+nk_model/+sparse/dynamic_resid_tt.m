function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(1) = params(4)*y(23)^params(3);
T(2) = (1+params(13)+y(34))/(1-params(11)-y(34))*T(1);
T(3) = params(1)/(1+y(52))*y(56)/y(35);
T(4) = params(1)*y(56)/y(35);
T(5) = (1+y(52))/(1+y(29))*y(43)/y(22);
T(6) = T(5)*y(51);
T(7) = y(23)^(1-params(8));
T(8) = (1-y(38))*T(7);
T(9) = ((1+y(31))/(1+(steady_state(10))))^params(17)*exp(y(42));
T(10) = (1+y(29))*y(36)*params(1)/y(15)/(1+y(52));
T(11) = y(3)^params(8);
end
