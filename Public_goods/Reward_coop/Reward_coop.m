m = 10;
n = 6;
a = zeros(m,n);

investment = round(rand(1,n)*(m-1)+1);

% ave = mean(investment)

a(1,:) = investment;
del_a = investment; % 用于保留复制一份investment

for i = 2:m
    for j = 1:n
        del_a(j)=[];
        ave = mean(del_a);
        ran = round(abs(investment(j)-ave-1)* (rand(1)*0.5+0.5));
        if investment(j) > ave
            investment(j) = round(ave + (rand(1)*2*ran-ran-0.3));
            if investment(j) < 0 
                investment(j) = 0;
            end
        else
            investment(j) = round(ave + (rand(1)*2*ran-ran-0.3));
            if investment(j) < 0 
                investment(j) = 0;
            end
        end
        del_a = investment;
    a(i,:) = investment;
    end
end
a

        