clc;
clear all;
close all;
a=2;
t=0:2*pi/50:2*pi;
x=a*sin(t);
l=length(x);
subplot(2,1,1);
plot(x,'r');
delta=0.2;
hold on
xn=0;
for i=1:l;
if x(i)>xn(i)
d(i)=1;
xn(i+1)=xn(i)+delta;
else
d(i)=0; xn(i+1)=xn(i)-delta;
end
end
stairs(xn)
%hold on
%for i=1:d
if d(i)==0
xn(i+1)=xn(i)-delta;
else
%d(i)=1;
xn(i+1)=xn(i)+delta;
end
%end
plot(xn,'c');
ylim([-2.5,2.5]);
xlim([0,50]);
legend('Analog signal','Delta modulation','Demodulation')
title('DELTA MODULATION / DEMODULATION ');
subplot(2,1,2);
stairs(d);
ylim([-1.5,1.5]);
xlim([0,50]);
title('Digital signal');