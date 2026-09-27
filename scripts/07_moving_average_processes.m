close all; clear; clc;
%% AR3
N = 3000;
x = sqrt(2)*randn(N,1);

x(1) = x(1) - 1;
x(2) = x(2) - 1;
x(3) = x(3) - 1;
for k = 4 : N
    x(k) = x(k)-1 + x(k-3)/4;
end

[mean(x) var(x)]
[adftest(x)  kpsstest(x)]

close all; clear; clc;
%% MA(1)
N = 3000;
los = sqrt(1) * randn(N,1);
x = los;
x(1) = -2 + los(1);
for k = 2 : N
    x(k) = -2 + los(k) - 0.7 * los(k-1);
end

[mean(x), var(x)]
ac = autocorr(x);
ac(1:2)

close all; clear; clc;
%% MA(2)
N = 3000;
los = sqrt(2) * randn(N,1);
x = los;
x(1) = 0 + los(1);
x(2) = los(2) - 1/2 * los(1);
for k = 3 : N
    x(k) = los(k) - 1/2 * los(k-1) + 1/4 * los(k-2);
end

[mean(x), var(x)]
[0, 21/8]
ac = autocorr(x);
ac(1:3)'
[1 -10/21 4/21]

close all; clear; clc;
%% MA(3)
N = 3000;
los = sqrt(1) * randn(N,1);
x = los;
x(1) = 0.5 + los(1);
x(2) = 0.5 + los(2) - 2/5 * los(1);
x(3) = 0.5 + los(3) - 2/5 * los(2) + 1/5 * los(1);
for k = 4 : N
    x(k) = 0.5 + los(k) - 2/5 * los(k-1) + 1/5 * los(k-2) - 1/10 * los(k-3);
end

[mean(x), var(x)]
[0.5 1.21]

ac = autocorr(x);
ac(1:4)'
[1 -50/121 24/121 -10/121]
