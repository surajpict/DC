%Program to Generate Gaussian distribution function for different alfa
pkg load statistics % provides extra functionality
x=-5:0.5:5;
y=normpdf(x,0,1); % mean=0, std deviation=1 normpdf in built function
subplot(1,3,1)
plot(x,y)
axis([-5 5 0 1]) % x and y axis scale
title('mean=0, std dev=1')
x=-5:0.5:5;
y=normpdf(x,0,0.5) % mean=0, std deviation=0.5 normpdf in built function
subplot(1,3,2)
plot(x,y)
axis([-5 5 0 1])
title('mean=0, std dev=.5')
x=-5:0.5:5;
y=normpdf(x,1,1) % mean=1, std deviation=1 normpdf in built function
subplot(1,3,3)
plot(x,y)
axis([-5 5 0 1])
title('mean=1, std dev=1')

%x = -5:0.5:5
%y = normpdf(x,0,1);
%subplot(1,3,1);
%plot(x,y);
%axis([-5 5 0 1]);
%title("mean = 0 std deviation = 1");
