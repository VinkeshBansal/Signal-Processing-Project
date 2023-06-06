[y, Fs] = audioread("equalizer_noisy.wav");

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

[n1, Wn1, beta1, ftype1] = kaiserord([511 521], [0 1], [0.01 0.05], Fs);

[n2, Wn2, beta2, ftype2] = kaiserord([482 492 499 509], [1 0 1], [0.05 0.01 0.05], Fs);

[n3, Wn3, beta3, ftype3] = kaiserord([451 461 466 476], [1 0 1], [0.05 0.01 0.05], Fs);

[n4, Wn4, beta4, ftype4] = kaiserord([360 370 375 380], [1 0 1], [0.05 0.01 0.05], Fs);

[n5, Wn5, beta5, ftype5] = kaiserord([295 306 314 325], [1 0 1], [0.05 0.01 0.05], Fs);

[n6, Wn6, beta6, ftype6] = kaiserord([265 275 281 291], [1 0 1], [0.05 0.01 0.05], Fs);

[n7, Wn7, beta7, ftype7] = kaiserord([235 245 250 260], [1 0 1], [0.05 0.01 0.05], Fs);

[n8, Wn8, beta8, ftype8] = kaiserord([210 213 218 221], [1 0 1], [0.05 0.01 0.05], Fs);

[n9, Wn9, beta9, ftype9] = kaiserord([172 182 188 198], [1 0 1], [0.05 0.01 0.05], Fs);

[n10, Wn10, beta10, ftype10] = kaiserord([140 150 157 167], [1 0 1], [0.05 0.01 0.05], Fs);

[n11, Wn11, beta11, ftype11] = kaiserord([110 120 127 137], [1 0 1], [0.05 0.01 0.05], Fs);

[n12, Wn12, beta12, ftype12] = kaiserord([78 88 96 106], [1 0 1], [0.05 0.01 0.05], Fs);

[n13, Wn13, beta13, ftype13] = kaiserord([48 58 65 75], [1 0 1], [0.05 0.01 0.05], Fs);

[n14, Wn14, beta14, ftype14] = kaiserord([17 27 35 45], [1 0 1], [0.05 0.01 0.05], Fs);

[n15, Wn15, beta15, ftype15] = kaiserord([545 553 560 568], [1 0 1], [0.05 0.01 0.05], Fs);

[n16, Wn16, beta16, ftype16] = kaiserord([2.1 4.3], [0 1], [0.01 0.05], Fs);


b1 = fir1(n1,Wn1,ftype1,kaiser(n1+1,beta1),'noscale');
b2 = fir1(n2,Wn2,ftype2,kaiser(n2+1,beta2),'noscale');
b3 = fir1(n3,Wn3,ftype3,kaiser(n3+1,beta3),'noscale');
b4 = fir1(n4,Wn4,ftype4,kaiser(n4+1,beta4),'noscale');
b5 = fir1(n5,Wn5,ftype5,kaiser(n5+1,beta5),'noscale');
b6 = fir1(n6,Wn6,ftype6,kaiser(n6+1,beta6),'noscale');
b7 = fir1(n7,Wn7,ftype7,kaiser(n7+1,beta7),'noscale');
b8 = fir1(n8,Wn8,ftype8,kaiser(n8+1,beta8),'noscale');
b9 = fir1(n9,Wn9,ftype9,kaiser(n9+1,beta9),'noscale');
b10 = fir1(n10,Wn10,ftype10,kaiser(n10+1,beta10),'noscale');
b11 = fir1(n11,Wn11,ftype11,kaiser(n11+1,beta11),'noscale');
b12 = fir1(n12,Wn12,ftype12,kaiser(n12+1,beta12),'noscale');
b13 = fir1(n13,Wn13,ftype13,kaiser(n13+1,beta13),'noscale');
b14 = fir1(n14,Wn14,ftype14,kaiser(n14+1,beta14),'noscale');
b15 = fir1(n15,Wn15,ftype15,kaiser(n15+1,beta15),'noscale');
b16 = fir1(n16,Wn16,ftype16,kaiser(n16+1,beta16),'noscale');


[H1, f1] = freqz(b1, 1, 1024, Fs);

figure(2);
plot(f1, abs(H1));
xlim([0 2000]);
grid on


[H2, f2] = freqz(b2, 1, 1024, Fs);

figure(3);
plot(f2, abs(H2));
xlim([300 700]);
grid on

[H3, f3] = freqz(b3, 1, 1024, Fs);

figure(4);
plot(f3, abs(H3));
xlim([100 700]);
grid on

[H4, f4] = freqz(b4, 1, 1024, Fs);

figure(5);
plot(f4, abs(H4));
xlim([0 600]);
grid on

[H5, f5] = freqz(b5, 1, 1024, Fs);

figure(6);
plot(f5, abs(H5));
xlim([0 600]);
grid on

[H6, f6] = freqz(b6, 1, 1024, Fs);

figure(7);
plot(f6, abs(H6));
xlim([0 600]);
grid on

[H7, f7] = freqz(b7, 1, 1024, Fs);

figure(8);
plot(f7, abs(H7));
xlim([0 600]);
grid on

[H8, f8] = freqz(b8, 1, 1024, Fs);

figure(9);
plot(f8, abs(H8));
xlim([0 600]);
grid on

[H9, f9] = freqz(b9, 1, 1024, Fs);

figure(10);
plot(f9, abs(H9));
xlim([0 500]);
grid on

[H10, f10] = freqz(b10, 1, 1024, Fs);

figure(11);
plot(f10, abs(H10));
xlim([0 500]);
grid on

[H11, f11] = freqz(b11, 1, 1024, Fs);

figure(12);
plot(f11, abs(H11));
xlim([0 500]);
grid on

[H12, f12] = freqz(b12, 1, 1024, Fs);

figure(13);
plot(f12, abs(H12));
xlim([0 500]);
grid on

[H13, f13] = freqz(b13, 1, 1024, Fs);

figure(14);
plot(f13, abs(H13));
xlim([0 300]);
grid on

[H14, f14] = freqz(b14, 1, 1024, Fs);

figure(15);
plot(f14, abs(H14));
xlim([0 300]);
grid on

[H15, f15] = freqz(b15, 1, 1024, Fs);

figure(16);
plot(f15, abs(H15));
xlim([200 800]);
grid on

[H16, f16] = freqz(b16, 1, 1024, Fs);

figure(17);
plot(f16, abs(H16));
xlim([0 200]);
grid on

y1 = filter(b1, 1, y);
y2 = filter(b2, 1, y1);
y3 = filter(b3, 1, y2);
y4 = filter(b4, 1, y3);
y5 = filter(b5, 1, y4);
y6 = filter(b6, 1, y5);
y7 = filter(b7, 1, y6);
y8 = filter(b8, 1, y7);
y9 = filter(b9, 1, y8);
y10 = filter(b10, 1, y9);
y11 = filter(b11, 1, y10);
y12 = filter(b12, 1, y11);
y13 = filter(b13, 1, y12);
y14 = filter(b14, 1, y13);
y15 = filter(b15, 1, y14);
y16 = filter(b16, 1, y15);

fre = fft(y16);

L = length(y16);

P2 = abs(fre/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(18);
plot(f,P1);
xlabel("Frequency(Hz)");
ylabel("Amplitude");
title("FFT of Denoised Signal");
grid on

sound(y16, Fs);

