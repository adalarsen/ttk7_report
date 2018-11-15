function [] = FFT_p(signal, Fs,L)

Y = fft(signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure(2)
clf
plot(f,P1,'LineWidth',1),xlabel('time (s)'),ylabel(''),title('Single-Sided Amplitude Spectrum of bowel noise signal'),grid,set(gca,'FontSize',16);
xlabel('f [Hz]')
ylabel('|P1(f)|')
grid on

end

