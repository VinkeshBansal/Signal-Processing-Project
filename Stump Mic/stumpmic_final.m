%% For 1.mp4 Pad Signal

[y1, Fs1] = audioread('1.mp4');

%% Filter the signal

y1_out = MovingAverage(y1, 75);

fre0 = fft(y1_out);

L0 = length(y1_out);

P20 = abs(fre0/L0);
P10 = P20(1:L0/2+1);
P10(2:end-1) = 2*P10(2:end-1);
f0 = Fs1*(0:(L0/2))/L0;

y1_mat = [f0.', P10];

[u,v] = max(y1_mat(:,2));

q1 = y1_mat(v, 1);

figure(1);
plot(f0,P10);
xlim([0 5000]);

%% For 2.mp4 Bat Signal


[y2, Fs2] = audioread('2.mp4');

y2_out=[];
y2_out(1) = median([0 0 y2(1) y2(2) y2(3)]);
y2_out(2) = median([0 y2(1) y2(2) y2(3) y2(4)]);
for i=3:length(y2)-2
    y2_out(i)=median([y2(i-2) y2(i- 1) y2(i) y2(i + 1) y2(i + 2)]);
end

y2_outf = y2_out;

y2_outf = y2_outf';

fre2 = fft(y2_outf);

L2 = length(y2_outf);

P22 = abs(fre2/L2);
P12 = P22(1:L2/2+1);
P12(2:end-1) = 2*P12(2:end-1);
f2 = Fs2*(0:(L2/2))/L2;

for pp = 1:100
    P12(pp) = 0;
end

y2_mat = [f2.', P12];

[u2,v2] = max(y2_mat(:,2));

q2 = y2_mat(v2, 1);

figure(2);
plot(f2,P12);
xlim([0 10000]);

%% For 1n.mp4 Pad Signal

[y3, Fs3] = audioread('1n.mp4');

y3_out = MovingAverage(y3, 75);


fre3 = fft(y3_out);

L3 = length(y3_out);

P23 = abs(fre3/L3);
P13 = P23(1:L3/2+1);
P13(2:end-1) = 2*P13(2:end-1);
f3 = Fs3*(0:(L3/2))/L3;

y3_mat = [f3.', P13];

[u3,v3] = max(y3_mat(:,2));

q3 = y3_mat(v3, 1);

figure(3);
plot(f3,P13);
xlim([0 20000]);

%% For 2n.mp4 Bat Signal

[y4, Fs4] = audioread('2n.mp4');

y4_out=[];
y4_out(1) = median([0 0 y4(1) y4(2) y4(3)]);
y4_out(2) = median([0 y4(1) y4(2) y4(3) y4(4)]);
for i=3:length(y4)-2
    y4_out(i)=median([y4(i-2) y4(i- 1) y4(i) y4(i + 1) y4(i + 2)]);
end

y4_outf = y4_out;

y4_outf = y4_outf';


fre4 = fft(y4_outf);

L4 = length(y4_outf);

P24 = abs(fre4/L4);
P14 = P24(1:L4/2+1);
P14(2:end-1) = 2*P14(2:end-1);
f4 = Fs4*(0:(L4/2))/L4;

for pp = 1:100
    P14(pp) = 0;
end

y4_mat = [f4.', P14];

[u4,v4] = max(y4_mat(:,2));

q4 = y4_mat(v4, 1);

figure(4);
plot(f4,P14);
xlim([0 20000]);



%% Classifying the Signals

% Threshold Frequency is set as 750 Hz as per ....

thf = 750;

if (q1 < thf)
    disp("Ball Strikes the Pad");
else
    disp("Ball Strikes the Bat");
end

if (q2 < thf)
    disp("Ball Strikes the Pad");
else
    disp("Ball Strikes the Bat");
end

if (q3 < thf)
    disp("Ball Strikes the Pad");
else
    disp("Ball Strikes the Bat");
end

if (q4 < thf)
    disp("Ball Strikes the Pad");
else
    disp("Ball Strikes the Bat");
end
