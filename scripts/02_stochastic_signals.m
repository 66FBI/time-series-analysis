close all; clear; clc;

%% Wykres sygnału z sinusem
Fs = 200;
t = 0 : 1/Fs : 10;
Amp = 0.025*t+0.25
x = Amp .* sin(2*pi*10*t);

plot(t,x)

%% Wykres sygnału z sinc
% t = <-5, 10>, Fs = 100;
close all; clear; clc;
Fs = 100;
t = -5 : 1/Fs : 10;
x = sinc(2*t)
plot(t, x)

%% Krzywa Gaussa
close all; clear; clc;
% Fs = 200; t = <-10, 5>;
% Gauss: amp = 1.5; sr = -3, odch = 2.5

Fs = 200;
t = -10 : 1/Fs : 5;
amp = 1.5;
sr = -3;
odch = 2.5;
x = amp * exp(-((t - sr).^2) / (2 * odch^2));
plot(t, x)

%% Rozkłady
close all; clear; clc;
% Wygenerowac 2 wektory:
% x1 - poziomy, 500 elem, R(-2, 2);
% x2 - pionowy, 1000 elem, N(1, war = 3);
% policzyc i wyswietlic srednia, wariancje i odch. stand.

x1 = -2 + (2 - (-2)) * rand(1, 500);
x2 = 1 + sqrt(3) * randn(1000, 1);

fprintf('Statystyki dla sygnału x1:\n');
fprintf('Średnia: %.4f\n', mean(x1));
fprintf('Wariancja: %.4f\n', var(x1));
fprintf('Odchylenie standardowe: %.4f\n\n', std(x1));

fprintf('Statystyki dla sygnału x2:\n');
fprintf('Średnia: %.4f\n', mean(x2));
fprintf('Wariancja: %.4f\n', var(x2));
fprintf('Odchylenie standardowe: %.4f\n', std(x2));

%% Błądzenie losowe 
close all; clear; clc;
% N(0, war = 2), 1000 elem
% wykres, czas = indeks

x = sqrt(2) * randn(1, 1000) + 0.1;
for k = 2:1000
    x(k) = x(k) + x(k-1);
end
plot(1:1000,x)

%% Wykres zmienności liczby pasażerów w czasie 
close all; clear; clc;
a = load("pasazer.txt");
a

czas = a(:,1) + (a(:,2)-1)/12
plot(czas, a(:,3))