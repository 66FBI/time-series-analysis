close all; clear; clc;
%% Szereg Fouriera z Kolosa 2024
Fs = 100;
t = -2 : 1/Fs : 4;
x = (1 + 0.5*sign(t).*(t.^2)).*(t<=2) + (t>=0).*(t>2);
XT = ones(size(t));
for n = 1 : 100
    w = n*pi;
    bn = -4*cos(2*w/3)/w+12*sin(2*w/3)/(w*w) + 18*(cos(2*w/3)-1)/(w^3);
    XT = XT + bn*sin(w*t/3);
end
plot(t, x, '.g', t, XT, 'r');

close all; clear; clc;
%% Transformata Fouriera
% t = <0,10>, Fs = 100;
% x: sygnał trójkątny, szer = 4, amp=1, tw=5;
% wykres
Fs = 100;
t = 0 : 1/Fs : 10;
x = 1 * (1-abs(t-5)/2).*(abs(t-5)<2); % trójkąt
subplot(211), plot(t,x);
XT = fft(x);
XT = fftshift(XT);
WA = abs(XT); % widmo aplitudowe
WF = angle(XT); % widmo fazowe, nie potrzebne
f = linspace(-Fs/2, Fs/2, length(t));
subplot(212), plot(f, WA) % ABSOLUTNIE!!! WA nie jest funkcją czasu

close all; clear; clc;
%% Stworzyć sygnał, policzyć fft, wyswietlic sygnal i jego WA
% stworzyc sygnal:
% t = <-5,5>, Fs = 100;
% x - suma skladowych:
% - harmoniczna, f = 17, Amp = 1.5;
% - harmoniczna o okresie 0.1 i Amp = 1.2
% - Gaussa, sr = 5, std = 0.5, amp = 2

Fs = 100;
t = -5 : 1/Fs : 5;
x = 1.5*sin(2*pi*17*t) + 1.2*sin(2*pi*t/0.1) + 2*exp(-((t-5).^2)/(2*0.5^2));

XT = fftshift(fft(x));
WA = abs(XT);
f = linspace(-Fs/2, Fs/2, length(t));
BS = 1.0*(abs(f)<=8 | abs(f)>=14)
xn = real(ifft(ifftshift(BS .* XT)))

subplot(211), plot(t,x,'r', t,xn,'k');
subplot(212), plot(f, WA,'r', f,500*BS,'k')