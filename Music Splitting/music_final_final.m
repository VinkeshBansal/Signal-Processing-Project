[x,x_Fs] = audioread('mix2.mp3');

fre0 = fft(y);

L0 = length(y);

P20 = abs(fre0/L0);
P10 = P20(1:L0/2+1);
P10(2:end-1) = 2*P10(2:end-1);
f0 = Fs*(0:(L0/2))/L0;

figure(1);
plot(f0,P10);
xlabel("Frequency(Hz)");
ylabel("Amplitude");
title("FFT of Input Signal");
grid on

[n1, Wn1, beta1, ftype1] = kaiserord([5 30 500 600], [0 1 0], [0.01 0.05 0.01], Fs);

[n2, Wn2, beta2, ftype2] = kaiserord([4000 5000], [0 1], [0.01 0.05], Fs);

[n3, Wn3, beta3, ftype3] = kaiserord([1700 1800 2300 2400], [0 1 0], [0.01 0.05 0.01], Fs);

[n4, Wn4, beta4, ftype4] = kaiserord([2750 2800 3300 3350], [0 1 0], [0.01 0.05 0.01], Fs);

b1 = fir1(n1,Wn1,ftype1,kaiser(n1+1,beta1),'noscale');

y1 = filter(b1, 1, x);

b2 = fir1(n2,Wn2,ftype2,kaiser(n2+1,beta2),'noscale');

y2 = filter(b2, 1, x);

b3 = fir1(n3,Wn3,ftype3,kaiser(n3+1,beta3),'noscale');

y3 = filter(b3, 1, x);

b4 = fir1(n4,Wn4,ftype4,kaiser(n4+1,beta4),'noscale');

y4 = filter(b4, 1, x);

F1 = fft(y1);
F2 = fft(y2);
FF = F1 + F2;

y_v2 = ifft(FF);

audiowrite("inst_final.wav", y2, Fs);
audiowrite("vocal_final.wav", y_v2, Fs);
