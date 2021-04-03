function m = Pm(P, t)
%  Give the price then return the corresponding number of machines.
[interval, price] = Pretreatment(t);
a = 1;
b = length(price);
c = floor((a + b)/2);
flag = 1;

if  (P < 0) | (P > price(end))
  disp('Wrong in Pm');
  return
end

if abs(P- price(end)) < 1e-5
  m = 1;
  return
end

while flag
  if price(c) <= P
    if P < price(c + 1)
      m = b- interval(c, 3);
      flag = 0;

    else
      c = floor((c + b)/2);
    end

  else
    c = floor((a + c)/2);
  end
end

end
