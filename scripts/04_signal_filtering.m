close all; clear; clc;

% t = <0, 10>, Fs = 100
% x: suma dwóch funkcji:
% - prostokątnej, sr = 2, szer = 2, amp = 1
% - trójkątnej, tw = 7, szer = 4, amp = 1

% Proszę stworzyć x(t), a następnie przefiltrować:
% - maską uśr jednorodną N - elementową
% - filtrem wiener2 N-element
% - sgolayfilt N-elemen 3. rzedu

N = 29;
Fs = 100;
t = 0 : 1/Fs : 10;
amp = 1;
x = amp * (abs(t-2)<1) + amp * (1 - abs(t - 7)/2) .* (abs(t-7)<2);
x = x + 0.05*randn(size(t))

x1 = conv(x, ones(1,N)/N, 'same');
x2 = wiener2(x, [1, N]);
x3 = sgolayfilt(x, 3, N);
x4 = medfilt1(x, N)

plot(t,x,'r', t,x1,'g', t,x2,'b', t,x3,'c', t,x4,'m')

close all; clear; clc;
%%
a = load("corr_02.txt");
t = a(:,1)';
x = a(:,2)';
subplot(211), plot(t,x);

% amp = 0.8; t = 24-34; pros
dt = t(2) - t(1);
tp = 0:dt:10;
pros = 0.8*ones(size(tp));
xc = xcorr(x, pros);
subplot(212), plot(xc);
tmax = max(t(:));
tc = -tmax:dt:tmax;
nr = find(xc == max(xc), 3, 'first')
tc(nr);

subplot(212), plot(tc,xc);

% trójkąt, szer = 10s, amp = 1
% ODP: 1 i 12
tp = 0:dt:10;
troj = 1*(1-abs(tp-5)/5);
% xc = xcorr(x.^5, troj.^5);
xc = xcorr(1-x, 1-troj) + xcorr(x, troj);
nr = find(xc > 0.99999*max(xc), 3, 'first')
tc(nr);
subplot(212), plot(tc,xc);

% close all; clear; clc;
%%
a = load("2024_Gin_kor_1b.txt");

% wierzchołek krzywej Gausaa, odch = 1.5, amp = 1.3
% 58

t = a(:,1)';
x = a(:,2)';
plot(t,x);
dt = t(2) - t(1);
szer = 6;

tg = -szer:dt:szer;
xg = 1.3*exp(-tg.*tg/(2*1.5^2));
tc = -max(t):dt:max(t);

xc = xcorr(x, xg) + xcorr(1.5-x, 1.5-xg);
nr = find(xc == max(xc), 1);
tc(nr)+szer
plot(t,x,'r', tg+58, xg, '.g')
