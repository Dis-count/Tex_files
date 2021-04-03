function Construct(t)
%  This function is used to construct the price-subsidy function.
%  t could be set to [7, 6.5,6.5,4,4,3.5,2.5,2, 1.5,1];
interval = Pretreatment(t);
x = []; % Restore the value of price at the breakpoints.
y = []; % Restore the value of subsidy at the breakpoints.

for i = 1: length(interval)-1
  aa = interval(i, 1: 2);
  [list_x, list_y] = IPCtest(t, [aa(1), aa(2)- 0.5]);
  x = [x, list_x];
  y = [y, list_y];
end

x = [x, 0, interval(1, 2)];
y = [y, 0, 0];
point_xy = [x; y];
point_xy = sortrows(point_xy', 1)';

plot(point_xy(1, :),point_xy(2, :));
saveas(gcf, 'IPC.pdf');

end
