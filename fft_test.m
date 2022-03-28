% ���ٸ���Ҷfft���÷�
% ������
fs = 100;
% ��������Ƶ��
hz = 20;
% �������߷���
amp = 5;
t = 0:1/fs:2*pi;
X = amp*sin(2*pi*hz*t)+10*sin(2*pi*15*t)+15*sin(2*pi*30*t);
% ʱ��Ĳ���
figure
plot(X);

L = length(X);
Y = fft(X);
P1 = abs(Y/L);
freq1 = fs*(0:L-1)/L;
% Ƶ��Ĳ���
figure
subplot(2,2,1);
plot(freq1, P1);
xlabel('Ƶ��/hz');
ylabel('����');
title('ԭʼ���');

% �ϲ�������2��
P2 = 2*P1(1:floor(L/2)+1);
freq2 = fs*(0:floor(L/2))/L;

% ֻҪƵ����20��2500��Ƶ�Ρ�
P2 = P2(freq2>20&freq2<2500);
freq2 = freq2(freq2>20&freq2<2500);

subplot(2,2,2);
plot(freq2, P2);
xlabel('Ƶ��/hz');
ylabel('����');
title('ʵ�ʽ��');

% ��Ϊ32��
nbins = 32;
% ÿһ�ݵĿ��
window = floor(length(freq2)/nbins);
% ƽ������
P3 = smooth(P2, window);
P4 = P3(1:window:end);
freq3 = freq2(1:window:end);

subplot(2,2,3);
plot(freq2, P2);
hold on;
plot(freq2, P3);
xlabel('Ƶ��/hz');
ylabel('����');
title('ƽ��ǰ��Ա�');
legend({'ƽ��ǰ', 'ƽ����'});

subplot(2,2,4);
bar(freq3, P4);
hold on;
plot(freq2, P3, 'linewidth', 2);
xlabel('Ƶ��/hz');
ylabel('����');
title('ƽ��������');




