function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 6
    T = [T; NaN(6 - size(T, 1), 1)];
end
T(1) = params(4)*y(2)^params(3);
T(2) = (1+params(13)+y(13))/(1-params(11)-y(13))*T(1);
T(3) = y(2)^(1-params(8));
T(4) = (1-y(17))*T(3);
T(5) = y(3)^params(8);
T(6) = ((1+y(10))/(1+(y(10))))^params(17)*exp(y(21));
end
