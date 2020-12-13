clc;
clear all;
t = 0:0.001:1;
fm = input('Enter the modulating signal frequency = ');
x = sin(2*pi*fm*t);
subplot(4,2,1);
plot(t,x);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Message Signal');
fs1 = input('Enter Sampling Frequency < Modulating Signal Frequency = ');
fs2 = input('Enter Sampling Frequency = Modulating Signal Frequency = ');
fs3 = input('Enter Sampling Frequency > Modulating Signal Frequency = ');
%Sampling at fs<<2fm
n = 0:1/fs1:1;
x1 = sin(2*pi*fm*n);
subplot(4,2,2);
stem(n,x1);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Undersampled fs<<2fm Signal');
subplot(4,2,3);
plot(n,x1);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Reconstructed Undersampled fs<<2fm Signal');
%Sampling at fs=2fm
n = 0:1/fs2:1;
x2 = sin(2*pi*fm*n);
subplot(4,2,4);
stem(n,x2);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Sampled at Nyquist Rate fs=2fm Signal');
subplot(4,2,5);
plot(n,x2);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Reconstructed Nyquist Rate fs=2fm Signal');
%Sampling at fs>>2fm
n = 0:1/fs3:1;
x3 = sin(2*pi*fm*n);
subplot(4,2,6);
stem(n,x3);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Oversampled fs>>2fm Signal');
subplot(4,2,7);
plot(n,x3);
xlabel('Time ----->');
ylabel('Amplitude ----->');
title('Reconstructed Oversampled fs>>2fm Signal');