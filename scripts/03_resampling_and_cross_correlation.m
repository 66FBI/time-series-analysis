close all; clear; clc;
%% plik kroki

a = readtimetable("kroki.txt");
plot(a.Time, a.Var1);
S_krok = a.Var1;
N = length(S_krok);
kroki = S_krok;

for k = 2 : N
    kroki(k) = S_krok(k)-S_krok(k-1);
    if kroki(k)<0
        kroki(k) = S_krok(k);
    end
end

plot(a.Time, kroki);
a = addvars(a, kroki);
% summary(a);
b = retime(a, "monthly", "mean")

close all; clear; clc;
%% plik kursy

a = readtable("kursy.csv", "ReadVariableNames", true);
data = a.data;
year = floor(data / 10000);
month = mod(floor(data / 100), 100);
day = mod(data, 100);

time = datetime(year, month, day);
a.data = time;
b = table2timetable(a);

b1 = retime(b, "daily", "nearest");
b2 = retime(b, 'daily', "linear");
b3 = retime(b, "daily", "spline");
b1m = retime(b1, 'monthly', "mean");
b2m = retime(b2, 'monthly', "mean");
b3m = retime(b3, 'monthly', "mean");

plot(b1m.data, b1m.EUR, "r", b2m.data, b2m.EUR, "g", b3m.data, b3m.EUR, "b");

close all; clear; clc;
%% Splot, korelacja

x = [2, 0, -4, 3];
y = [1, -2, 3];

conv(x, y, "same");
xcorr(x, y);

x1 = [1, -2+1i, 0, 2i];
y1 = [2, -3i, 1];

conv(x1, y1)
xcorr(x1, y1)

close all; clear; clc;
%% Sygnały ze splotem

% t = <0, 12>, Fs = 100
% x: trójkątny, tw = 6, szer = 4, amp = 1
% y: prostokątny, szer = w, amp = 1/(w*Fs); srodek dla t = 6; w = 2;

Fs = 100;
t = 0 : 1/Fs : 12;

tw = 6;
szer = 4;
amp = 1;

% x = amp*(1-abs(t-6)/2) .* (abs(t-6)<2);
x = sinc(2*pi*4*t)

w = 0.5;
amp = 1/(w*Fs);

% y = (amp) * (abs(t-6)<w/2);

N = 35
y = ones(1,N)/N

xy = conv(x,y,"same");

subplot(211), plot(t, x, "r", t, xy, "g")
% subplot(212), plot(t,y)