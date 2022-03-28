% 快速傅里叶fft的用法
% 采样率
fs = 100;
% 正弦曲线频率
hz = 20;
% 正弦曲线幅度
amp = 5;
t = 0:1/fs:2*pi;
X = amp*sin(2*pi*hz*t)+10*sin(2*pi*15*t)+15*sin(2*pi*30*t);
% 时域的波形
figure
plot(X);

L = length(X);
Y = fft(X);
P1 = abs(Y/L);
freq1 = fs*(0:L-1)/L;
% 频域的波形
figure
subplot(2,2,1);
plot(freq1, P1);
xlabel('频率/hz');
ylabel('幅度');
title('原始结果');

% 合并，乘以2。
P2 = 2*P1(1:floor(L/2)+1);
freq2 = fs*(0:floor(L/2))/L;

% 只要频率在20到2500的频段。
P2 = P2(freq2>20&freq2<2500);
freq2 = freq2(freq2>20&freq2<2500);

subplot(2,2,2);
plot(freq2, P2);
xlabel('频率/hz');
ylabel('幅度');
title('实际结果');

% 分为32份
nbins = 32;
% 每一份的宽度
window = floor(length(freq2)/nbins);
% 平滑数据
P3 = smooth(P2, window);
P4 = P3(1:window:end);
freq3 = freq2(1:window:end);

subplot(2,2,3);
plot(freq2, P2);
hold on;
plot(freq2, P3);
xlabel('频率/hz');
ylabel('幅度');
title('平滑前后对比');
legend({'平滑前', '平滑后'});

subplot(2,2,4);
bar(freq3, P4);
hold on;
plot(freq2, P3, 'linewidth', 2);
xlabel('频率/hz');
ylabel('幅度');
title('平滑处理结果');




