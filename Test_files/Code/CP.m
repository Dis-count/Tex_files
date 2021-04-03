function [omega, K_l, K_r] = CP(v, t, P)
% Set the initial coalition s = {{1},{2},{3}...{v}} or |s|=v-1
% beta is the optimal solution.
% opt_s is a optimal vector solution s.
% t is the time cost for every player.
% v is number of players.
% P is the price.
% m is the number of optimal using machines.
% return subsidy and min / max slope

ini_s = 1 - eye(v);
cV = TotalCost(t, P);  % c_V = m*P +sum_t;

flag = true;
count = 0;

while flag
  [beta, maxr] = LP2(ini_s, v, t, P);
  [delta, opt_s] = DP(v, t, beta,P);

  if delta < -0.001
    ini_s = [ini_s; opt_s];

  else
    omega = cV - maxr;
    % Here use Coalition obtain all maximum unsatisfied coalitions
    unsatisfied = Coalition(ini_s, v, t, P);
    [K_l, K_r] = LP1(unsatisfied, t, P);
    flag = false;
  end

  count = count + 1;
  if count > 100
      disp('There is something wrong in CP')
      break
  end
end

end
