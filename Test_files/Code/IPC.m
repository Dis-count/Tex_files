function [Pstar, omega] = IPCtest(t, Pbig)
% Pretreatment: Give all the sub-intervals [P_m+1,P_m]
% Return intersection set and the corresponding subsidy.
% Then we just need connect these points.
% t = [7.5,6,5.5,4,3,1.5,1.5,1.5];
% Pbig is the interval of price and will gradually decrease
v = length(t);
Pstar = Pbig; % The set of breakpoints
omega = zeros(1, 2);
count = 0;

while ~isempty(Pbig)
  [a1, b1, c1] =  CP(v, t, Pbig(1, 1));   % omega  K_l  K_r
  [a2, b2, c2] =  CP(v, t, Pbig(1, 2));

  if count < 0.5
    omega(1) = a1;
    omega(2) = a2;
  end

  count = count + 1;
  slope =  (a2- a1)/(Pbig(1, 2)- Pbig(1, 1)); % The value is Negative.
  % (z_k-1 select K_r) / (z_k  select K_l)
  if (round(b2, 5) == round(slope, 5))||(abs(c1-slope)< 1e-5)
    Pbig(1, :) = [];
  else
    % How to calculate the intersection point
    zinter = (c1*Pbig(1, 1) - Pbig(1, 2)*b2 + a2 - a1)/(c1- b2);
    omega1 = (zinter - Pbig(1, 2))* b2 + a2;
    [a, b, c] = CP(v, t, zinter);

    if abs(omega1-a) < 1e-5 % Two subsidy equal, this is the breakpoint,
    % then delete this interval, store the breakpoint
      omega = [omega, omega1];
      Pstar = [Pstar, zinter];
      Pbig(1, :) = [];

    else
      Pbig(end+1, :) = [Pbig(1,1), zinter];
      % Notice that there is already add a new row
      Pbig(end+1, :) = [zinter, Pbig(1,2)];
      Pbig(1, :) = [];
    end
  end
end

end
