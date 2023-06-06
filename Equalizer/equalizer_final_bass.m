[y, Fs] = audioread("equalizer_bass.mp3");

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

ak = [5, 5, 4, 2, 1, 1];

y_final = equalize_bass(6, ak, y, Fs);

fre = fft(y_final);

L = length(y_final);

P2 = abs(fre/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(2);
plot(f,P1);
xlabel("Frequency(Hz)");
ylabel("Amplitude");
title("FFT of Bass Boosted Signal");
grid on