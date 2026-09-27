close all; clear; clc;
%% policzyc recznie: wsp. autokorelacji, wsp. AR i PACF dla AR(3)
x = [-4, 3, 0, 1, 2, 4];

mean(x);
ar = autocorr(x)
[1 -9/40 -1/40]
A = [40 -9 4; -9 40 -9; 4 -9 40];
b = [-9; 4; -1];

phi = inv(A)*b
pc = parcorr(x, Method = 'Yule-Walker')
[1 -9/40 79/1519 488/57528]

close all; clear; clc;
%% AR - AutoRegresja

N = 2000;
x = sqrt(1)*randn(N,1);
x(1) = 2 + x(1);    % średnia + szum
for k = 2 : N
    x(k) = x(k) + 2 + 0.25 * x(k-1);
end

[mean(x) var(x)]
[8/3 16/15]

adftest(x)  % 1 - stacj.
kpsstest(x) % 0 - stacj.

close all; clear; clc;
%%
N = 2000;
x = sqrt(1)*randn(N,1);
x(1) = 0 + x(1);    % średnia + szum
x(2) = 0 + x(2) + 0.4*x(1);
for k = 3 : N
    x(k) = x(k) + 0 + 0.4 * x(k-1) + 0.6*x(k-2);
end

[mean(x) var(x)]
[adftest(x)  kpsstest(x)]

close all; clear; clc;
%% AR(3)
N = 2000;
x = sqrt(1)*randn(N,1);
x(2) = x(2) + 0.1*x(1);
x(3) = x(3) - 0.1*x(2) - 0.5*x(1);
for k = 4 : N
    x(k) = x(k) - 0.1*x(k-1) - 0.5*x(k-2) + 0.05*x(k-3);
end

[mean(x) var(x)]
[adftest(x)  kpsstest(x)]

close all; clear; clc;
%% 
N = 2000;
x = sqrt(1)*randn(N,1);
x(2) = x(2) + 0.1*x(1);
x(3) = x(3) - 0.1*x(2) - 0.2*x(1);
for k = 4 : N
    x(k) = x(k) - 0.1*x(k-1) - 0.2*x(k-2) + 0.3*x(k-3);
end

[mean(x) var(x)]
[adftest(x)  kpsstest(x)]
