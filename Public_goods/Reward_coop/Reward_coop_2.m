m = 10;
n = 6;
a = zeros(m,n);

investment = round(rand(1,n)*9+1);

% ave = mean(investment)

a(1,:) = investment;
del_a = investment; % 用于保留复制一份investment

for i = 2:m
    for j = 1:n
        del_a(j)=[];
        ave = mean(del_a);
        ran = round(abs(investment(j)-ave)* (rand(1)*0.5+0.5));
        if investment(j) > ave
            investment(j) = round(investment(j) - 0.7*(rand(1)*ran));
            if investment(j) < 0 
                investment(j) = 0;
            end
            if investment(j) > 10 
                investment(j) = 10;
            end
        else
            investment(j) = round(ave + (rand(1)*1.3*ran));
            if investment(j) < 0 
                investment(j) = 0;
            end
            if investment(j) > 10 
                investment(j) = 10;
            end
        end
        del_a = investment;
    a(i,:) = investment;
    end
end
a

        