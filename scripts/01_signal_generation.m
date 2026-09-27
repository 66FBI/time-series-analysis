close all; clear; clc;
%% sygnał prostokątny

Fs = 20;		% czestotliwosc probkowania
t = 0 : 1/Fs : 8;	% wektor czasu
Amp = 2;
t1 = 1;		% poczatek sygnalu
t2 = 4;		% koniec sygnalu

x = Amp * (t >= t1 & t <= t2);
mean(x)
plot(t,x); ylim([-0.5, 2.5])

% energia
sum(x.^2)/Fs
x*x'/Fs

close all; clear; clc;
%% sygnał trójkątny

Fs = 20;		% czestotliwosc probkowania
t = -5 : 1/Fs : 5;	% wektor czasu
Amp = 3;
T = 2;		% polowa szerokosci podstawy

x = Amp * (1 - abs(t)/T) .* (abs(t) <= T);
mean(x)
plot(t,x);

% energia
sum(x.^2)/Fs
