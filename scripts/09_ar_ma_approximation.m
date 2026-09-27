close all; clear; clc;
%%
% AR(2) xt = 0.3*x(t-1) - 0.7*x(t-2)+e(t)
% x(t) = e(t) +0.3*e(t-1)-0.61*e(t-2)...
% T(K) = 0.3*t(k-1)-0.7*T(k-2)

% dla N=3000 wygenerować AR(2), N(0,1)

N = 3000;
szum = randn(N,1);
xAR = szum;
xAR(1) = szum(1);
xAR(2) = 0.3*xAR(1)+szum(2);

for k = 3 : N
    xAR(k) = szum(k) + 0.3*xAR(k-1) - 0.7*xAR(k-2);
end

M = 50;
theta = ones(1,M);
theta(2) = 0.3;

for k = 3 : M
    theta(k) = 0.3 * theta(k-1) - 0.7 * theta(k-2);
end

xMA = szum;
for k = 2:N
    for m = 1 : min(k-1, M-1)
        xMA(k) = xMA(k) + szum(k-m) * theta(m+1);
    end
end
[mean(xAR) mean(xMA)]
[var(xAR) var(xMA)]
xx = [xAR xMA];

close all; clear; clc;
%%

N = 3000;
szum = randn(N,1);
xAR = szum;
xAR(1) = szum(1);
xAR(2) = -0.4*xAR(1)+szum(2);

for k = 3 : N
    xAR(k) = szum(k) - 0.4*xAR(k-1) + 0.5*xAR(k-2);
end

M = 50;
theta = ones(1,M);
theta(2) = -0.4;

for k = 3 : M
    theta(k) = -0.4 * theta(k-1) + 0.5 * theta(k-2);
end

xMA = szum;
for k = 2:N
    for m = 1 : min(k-1, M-1)
        xMA(k) = xMA(k)+szum(k-m)*theta(m+1);
    end
end

[mean(xAR) mean(xMA)]
[var(xAR) var(xMA)]
xx = [xAR xMA];


close all; clear; clc;
%%
N = 3000; M = 50;
szum = randn(N, 1);
xMA = szum; xAR = szum;

for k = 2 : N
    xMA(k) = szum(k) + 0.5 * szum(k-1);
end

theta = (-0.5).^(1:M);

for k = 2 : N
    for m = 1 : min(k-1, M)
        xAR(k) = xAR(k-m)*theta(m);
    end
end

[mean(xAR) mean(xMA)]
[var(xAR) var(xMA)]
xx = [xAR xMA]

close all; clear; clc;
%%

N = 3000; M = 50;
szum = sqrt(2) * randn(N, 1);
xAR = szum; xMA = szum;

for k = 2 : N
    xMA(k) = szum(k) - 0.4 * szum(k-1);
end

theta = (0.4).^(1:M);

for k = 2 : N
    for m = 1 : min(k-1, M)
        xAR(k) = xAR(k) - xAR(k-m) * theta(m);
    end
end

[mean(xAR) mean(xMA)]
[var(xAR) var(xMA)]
xx = [xAR xMA]

close all; clear; clc;
%%

N = 3000; M = 200;
szum = randn(N, 1);
xMA = szum; xAR = szum;

xMA(2) = xMA(2) + 0.5*szum(1)
for k = 3 : N
    xMA(k) = xMA(k) + 0.5 * szum(k-1) + 0.2 * szum(k-2);
end

theta = (0.5)*ones(1,M);
theta(2) = -0.5*theta(1)+0.2;

for k = 3 : M
    theta(k) = -0.5*theta(k-1) - 0.2*theta(k-2);
end
xAR(2) = xAR(2)+theta(1)*xAR(1);
for k = 3 : N
    for m = 1 :min(k-1,M)
        xAR(k) = xAR(k) + xAR(k-m) * theta(m);
    end
end

[mean(xAR) mean(xMA)]
[var(xAR) var(xMA)]
xx = [xAR xMA]