function cV = TotalCost(t, P)
%  This function returns total cost when using m machines and price is P.
t1 = fliplr(t); % reverse the list
N = length(t);
k = Pm(P, t);

s = floor(N/k);
r = rem(N, k);
a = (s+ 1): -1: 1;
repeat = k;
tmp = repmat(a, repeat, 1);
b = reshape(tmp, 1, length(a)* repeat);
b(1: k-r) = [];
cV = dot(b, t1) + k * P;

end
