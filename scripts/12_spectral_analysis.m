close all; clear; clc;
%% 
% 1) dla pliku pasazer.txt przeprowadz wyswietl WA
% 2) dokonaj analizy widma
% 3) usun skladowa roczna

a = load("pasazer.txt");

t = a(:,1) + (a(:,2)-1)/12;
x = a(:,3);

XT = fftshift(fft(x));
WA = abs(XT);
Fs = 12; % probkowanie miesieczne
f = linspace(-Fs/2, Fs/2, length(t))';
subplot(211), plot(t, x);
subplot(212), plot(f, WA);

LP = 1./(1+(f/0.5).^6); % filtr dolnoprzepustowy usuwajacy skladowa roczna
xn = real(ifft(ifftshift(XT .* LP)));
subplot(211), plot(t, x, 'r', t, xn, 'g');
subplot(212), plot(f, WA, 'r', f, 5E7*LP, 'g');

close all; clear; clc;
%% 
% 1) dla pliku temp_pow.txt wyswietl WA
% 2) dokonaj analizy widma
% 3) usun skladowa dobowa

a = load("temp_pow.txt");
t = a(:,1)'/3600; % sekundy na godziny
x = a(:,2)';

Fs = 1;
f = linspace(-Fs/2, Fs/2, length(t));
XT = fftshift(fft(x));
WA = abs(XT);
BS = 1./(1 + (0.01*f./(f.^2-1/(24^2))).^8);
xn = real(ifft(ifftshift(BS .*XT)));
subplot(211), plot(t, x, 'r', t, xn, 'g');
subplot(212), plot(f, WA, 'r', f, 1E4*BS, 'g'); xlim([0, Fs/2]);