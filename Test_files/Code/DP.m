function [res, s] = DP1(v, t, beta, P)
% v is number of players
% t and beta are vectors from bottom1 to topN
% For example, P = 9.5
% t = [5 4 3 2];
% beta = [14.5 8 12.5 4];
% Notice could not exist V (u \neq v) here.
% s is the optimal solution.
P = ones(v, v+1);
P(1, 1) = P;  % P(1, 0) in DP algorithm
P(1, 2) = P + t(1) - beta(1);  % P(1, 1) in DP algorithm

ss = cell(v, v+ 1);  % Used to store the corresponding player vector.
ss(1, 1) = {Peros(1, 1)};
ss(1, 2) = {ones(1, 1)};

for i = 2: v
  % s = ss(:,);  %  every loop only records this column
  P(i, 1) = P(i-1, 1);
  ss(i, 1) = {Peros(1, i)};

  P(i, i+1) = P(i-1, i) + i* t(i) - beta(i);
  ss(i, i+1) = {ones(1, i)};

  for j = 1: i-1
    if P(i-1, j+1) > (P(i-1, j)+ j* t(i)- beta(i))
      P(i, j+1) = P(i-1, j)+ j* t(i)- beta(i); % notice that j is not the ordinal number
      ss(i, j+1) = {[ss{i-1, j}, 1]};

    else
      P(i, j+1) = P(i-1, j+1);  %
      ss(i, j+1) = {[ss{i-1, j+1}, 0]};
    end
  end

end

[res, ind] = min(P(v, 2: v)); % Record the P(v,u) u \in (1:v-1)
s = ss{v, 1+ind};

end
