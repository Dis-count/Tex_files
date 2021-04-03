function [an, index, Subsidy, difference] = Players(n, S0, an)
% At first, we should set up an array to storage the number we need later.
% n is the quantity of players, and m is the number of machine.
% And we suppose m>n.
ann = []; %  ann will be a matrix whose dimension is (2^n-1,n).
A = eye(n);
f = (-1)* ones(n, 1);
% ff2n: Two-level full factorial design
a1 = ff2n(n);
b1 = sum(a1, 2);
c1 = [a1, b1];
d1 = sortrows(c1, [n+1 1:n], 'descend');
e1 = sortrows(d1, n+1);
A = e1(:, 1: n);
A(1, :) = [];  % delete the first row

for i = 1 : n   % i is the number of players
%  In the first loop, find all combinations of k players and put it in an ascending order by default.
    bn = zeros(1, nchoosek(n, i)); % Store the final result.
    dn = zeros(1, i);
    cn = nchoosek(an, i);        % Store the temporary sort result.
    for j = 1: nchoosek(n, i)
        %  The second loop obtain the result in every coalition.
        for k = 1: i     % k in the number of machines.
            s = floor(i/k);  % Obtain the quotient.
            r = rem(i,k);
            a = (s+1): -1: 1;
            repeat = k;   % Repeat the number of machines.
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)* repeat);
            b(r+1: k) = [];
            dn(k) = dot(b, cn(j, :)) + k* S0;
        end

        [minofdn index] = min(dn);  % Find the minimum.
        bn(j) = min(dn);
    end

    ann = [ann bn];
end

[x,y] = linprog(f,A,ann);
Subsidy = ann(end)+y;
Taxation = index * S0 ;
difference = Subsidy - Taxation;

end
