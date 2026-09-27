close all; clear; clc;
%% Szereg Fouriera (parz)
Fs = 100;
t = -3 : 1/Fs : 9;
x = (1-abs(t)/2).*(abs(t)<=2);
XT = ones(size(t))/3;
for n = 1 : 100
    an = 3 * (1-cos(2*n*pi/3))/(n*n*pi*pi);
    XT = XT + an*cos(n*pi*t/3);
end
plot(t, x, '.g', t, XT, 'k');

close all; clear; clc;
%% Szereg Fouriera (nparz)
Fs = 100;
t = -6 : 1/Fs : 4;
x = (-1)*(t<-2) + (t+1).*(abs(t)<=2) + 3*(t>2);
XT = ones(size(t));
for n = 1 : 100
    w = n*pi;
    bn = 8*sin(w/2)/(w*w)-4*cos(w)/w;
    XT = XT + bn*sin(w*t/4);
end
plot(t, x, '.g', t, XT, 'r');


%%