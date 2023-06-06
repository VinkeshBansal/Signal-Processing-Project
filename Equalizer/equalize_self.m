function [y_out] = equalize_self(M, ak, x, Fs)
wn1 = [0 2500];
wn2 = [2500 3500];
wn3 = [3500 5500];
wn4 = [5500 7500];
wn5 = [7500 9500];
wn6 = [9500 11500];

[n1, Wn1, beta1, ftype1] = kaiserord([wn1(2)-10 wn1(2)+10], [1 0], [0.05 0.01], Fs);
[n2, Wn2, beta2, ftype2] = kaiserord([wn2(1) wn2(1)+10 wn2(2) wn2(2)+10], [0 1 0], [0.01 0.05 0.01], Fs);
[n3, Wn3, beta3, ftype3] = kaiserord([wn3(1) wn3(1)+10 wn3(2) wn3(2)+10], [0 1 0], [0.01 0.05 0.01], Fs);
[n4, Wn4, beta4, ftype4] = kaiserord([wn4(1) wn4(1)+10 wn4(2) wn4(2)+10], [0 1 0], [0.01 0.05 0.01], Fs);
[n5, Wn5, beta5, ftype5] = kaiserord([wn5(1) wn5(1)+10 wn5(2) wn5(2)+10], [0 1 0], [0.01 0.05 0.01], Fs);
[n6, Wn6, beta6, ftype6] = kaiserord([wn6(1) wn6(1)+10 wn6(2) wn6(2)+10], [0 1 0], [0.01 0.05 0.01], Fs);

b1 = fir1(n1,Wn1,ftype1,kaiser(n1+1,beta1),'noscale');
b2 = fir1(n2,Wn2,ftype2,kaiser(n2+1,beta2),'noscale');
b3 = fir1(n3,Wn3,ftype3,kaiser(n3+1,beta3),'noscale');
b4 = fir1(n4,Wn4,ftype4,kaiser(n4+1,beta4),'noscale');
b5 = fir1(n5,Wn5,ftype5,kaiser(n5+1,beta5),'noscale');
b6 = fir1(n6,Wn6,ftype6,kaiser(n6+1,beta6),'noscale');

y1 = filter(b1, 1, x);
y2 = filter(b2, 1, x);
y3 = filter(b3, 1, x);
y4 = filter(b4, 1, x);
y5 = filter(b5, 1, x);
y6 = filter(b6, 1, x);

y1 = y1*ak(1);
y2 = y2*ak(2);
y3 = y3*ak(3);
y4 = y4*ak(4);
y5 = y5*ak(5);
y6 = y6*ak(6);

F1 = fft(y1);
F2 = fft(y2);
F3 = fft(y3);
F4 = fft(y4);
F5 = fft(y5);
F6 = fft(y6);

FF = F1+F2+F3+F4+F5+F6;

y_out = ifft(FF);

end

