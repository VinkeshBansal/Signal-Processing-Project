function [M] = MovingAverage(A, n)

l = length(A);
sum = 0;
M = zeros(l, 1);
B = A;

for k = 1:l
    sum = sum + A(k);
    B(k) = sum/n;
    M(k) = B(k);

    if(k > n)
        M(k) = B(k) - B(k - n);
    end
end
end

