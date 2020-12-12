N=10^4;
sent_bits=randi([0,1],1,N); %a sequence of 10^4 random bits
A=10; %amplitude of S(t)
T=10; %duration of S(t)
S=ones(1,T)*A; %rectangular pulse
E=norm(S)^2; %S(t) Energy
h=fliplr(S); %matched filter
bits=(2*sent_bits-1); %mapping the bits with S(t)
x=kron(bits,S);
%Noise that gives SNR=0dB to SNR=7dB
SNR_db=0:0.25:7;
n_var=(E/2)*10.^(-SNR_db/10);
for k=1:length(n_var)
n=randn(1,length(x))*sqrt(n_var(k)); %noise
r=x+n; %recieved signal
z=filter(h,1,r); %applying the recieved signal to matched filter
z=sign(z(T:T:end)); %sampling at T & using thresholding operation
recieved_bits=(z+1)/2; %recovering the sent bits
Pb(k)=mean(abs((sent_bits)-(recieved_bits))); %calculating the bit error
end
%plotting Pb Vs SNR
SNR=10.^(SNR_db/10);
P_theory=(0.5)*erfc(sqrt(2.*SNR)./sqrt(2));
semilogy(SNR_db,Pb,'o',SNR_db,P_theory,'r-')
title ('SNR Vs Probabolity of Error');
xlabel ('SNR (dB)');
ylabel ('Probability of Error');
legend('practical curve','theoratical curve');
grid on;