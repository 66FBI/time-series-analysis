close all; clear; clc;
%%
% t = <0, 10>, Fs = 100;
% x: suma składowych:
% - harmoniczna o f=2, amp=1
% - liniowa: x(t) = t/8
% - szum z rozkładu normalnego N(0, var=0.01);

Fs = 100;
t = (0 : 1/Fs : 10)';
x = sin(2*pi*2*t) + t/8 + sqrt(0.01)*randn(size(t));
%plot(t,x);

P = 25;
D = 1;
Q = 0;
model = arima(P, D, Q);
% P = P + D;
presample = x(1:model.P);
N = length(x);
estym = x(model.P+1:N);
model_est = estimate(model, estym, 'Y0', presample);
ile = 50;
przewid = x(N-2*model.P : N);
wynik = forecast(model_est, ile, przewid);
t2 = 10 + (1:ile)/Fs;
x2 = sin(2*pi*2*t2) + t2/8 + sqrt(0.01)*randn(size(t2));
plot(t, x, 'r', t2, wynik, 'b', t2, x2, 'g')


%% 
close all; clear; clc;
a = load("pasazer.txt");
x = a(:,3);
t = a(:,1) + (a(:,2)-1)/12;
%plot(t,x)

%przesuwamy się parę próbek w lewo, żeby najpierw zobaczyć, czy model dobrze
%przewiduje dane które znamy, zanim będziemy przewidywać przyszłość
N = length(t)-4;

% będziemy przewidywać 6 miesięcy, 4 które znamy, 2 nieznane

P = 24; % 2 lata, bo sezonowość
D = 1;
Q = 0;

model = arima(P, D, Q);
presample = x(1:model.P);
estym = x(1+model.P:N);
przewid = x(N-2*model.P : N);
ile = 6; % tu można zwiększyć, żeby poszaleć dalej w przyszłość
model_est = estimate(model, estym, 'Y0', presample);
wynik = forecast(model_est, ile, przewid);

t2 = t(N) + (1:ile)/12;

plot(t, x, 'r', t2, wynik, 'g')

[wynik(5:6), [1012028; 1102839]] % tak było naprawdę

%% AR(1)
close all; clear; clc;

N = 2500;
szum = sqrt(2) * randn(N, 1); % pierwiastek z wariancji, która wyszła na papierze * losowe
x = szum;
x(1) = 2 + szum(1);

for k = 2 : N
    x(k) = 2 + szum(k) - 0.2*x(k-1);
end

[mean(x) 5/3]
[var(x) 25/12]