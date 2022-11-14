% Program to plot PSD and Autocorrelation of White Gaussian Random Process
pkg load statistics
y=normrnd(0,1,1,200); %generates 200 samples ,mean=0 std deviation =1
Gy=periodogram(y); % Returns periodogram (PSD) of y
Ry=abs(ifft(Gy,256));% computes ifft and control size of transform by 256
Ry=[Ry(130:256)' Ry(1:129)']
t=-127:1:128; % Defining time shift for auto correlation function Ry

subplot(1,2,1)
plot(Gy)
xlabel('frequencysamples');
title('PSD')

subplot(1,2,2)
plot(t,Ry)
xlabel('time shift')
title('autocorrelation')


%pkg load statistics
%y = normrnd(0,1,1,200);
%Gy = periodogram(y);
%Ry = abs(ifft(Gy,256));
%Ry = [Ry(130:256)'Ry(1:129)']
