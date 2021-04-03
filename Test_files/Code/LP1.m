function [minr, maxr] = LP9(s, t, P)
% This function is used to give the min and max slope value.
% Notice that s is a matrix. (0-1)
% For example, v = 4
% s=[0 1 1 0;
%    0 1 0 1;
%    0 0 1 1;
%    1 1 1 0;
%    1 1 0 1;
%    1 0 1 1;]
v = length(t);
m_v = Pm(P, t);   % Notice that the result has to add m_v.
s1 = length(s(:, 1));
f = ones(s1, 1);
b = ones(v, 1);
lb = zeros(s1, 1);
ub = ones(s1, 1);

[x, fval1] = linprog(-f, [], [], s', b, lb, ub);
minr = m_v+ fval1;
[x, fval2] = linprog(f, [], [], s', b, lb, ub);
maxr = m_v- fval2;

end
