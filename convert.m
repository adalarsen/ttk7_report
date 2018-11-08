clear
[y,Fs] = audioread('files\T65_1_0_18min.mp3','double');

h = 1/Fs;
t_start = 3;
t_stop = t_start + 2;

t = t_start:h:t_stop;

y_start = t_start/h + 1;
t_step = t_stop/h + 1;

signal = y(y_start:(t_step),1);
figure(1)
clf
plot(t,signal)
grid on


Fs = 1000;            % Sampling frequency                     
L = 1500;             % Length of signal
Y = fft(signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure(2)
clf
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
grid on

[imf,residual] = emd(signal);

figure('Name', 'IMFs')
clf
subplot(911),plot(t,imf(:,1),'LineWidth',2),xlabel(''),ylabel('IMF1'),title(''),grid,set(gca,'FontSize',16);
subplot(912),plot(t,imf(:,2),'LineWidth',2),xlabel(''),ylabel('IMF2'),title(''),grid,set(gca,'FontSize',16);
subplot(913),plot(t,imf(:,3),'LineWidth',2),xlabel(''),ylabel('IMF3'),title(''),grid,set(gca,'FontSize',16);
subplot(914),plot(t,imf(:,4),'LineWidth',2),xlabel(''),ylabel('IMF4'),title(''),grid,set(gca,'FontSize',16);
subplot(915),plot(t,imf(:,5),'LineWidth',2),xlabel(''),ylabel('IMF5'),title(''),grid,set(gca,'FontSize',16);
subplot(916),plot(t,imf(:,6),'LineWidth',2),xlabel(''),ylabel('IMF6'),title(''),grid,set(gca,'FontSize',16);
subplot(917),plot(t,imf(:,7),'LineWidth',2),xlabel(''),ylabel('IMF7'),title(''),grid,set(gca,'FontSize',16);
subplot(918),plot(t,imf(:,8),'LineWidth',2),xlabel(''),ylabel('IMF8'),title(''),grid,set(gca,'FontSize',16);
subplot(919),plot(t,imf(:,9),'LineWidth',2),xlabel(''),ylabel('IMF9'),title(''),grid,set(gca,'FontSize',16);
grid on
