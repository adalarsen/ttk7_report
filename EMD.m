function [imf,residual,hilb] = EMD(signal,t)

t = t - t(1,1);

[imf,residual] = emd(signal,'MaxNumIMF',3);

figure(30)
clf
subplot(311),plot(t,imf(:,1),'LineWidth',1),xlabel('Time [s]'),ylabel(''),title('IMF 1'),grid,set(gca,'FontSize',16);
subplot(312),plot(t,imf(:,2),'LineWidth',1),xlabel('Time [s]'),ylabel(''),title('IMF 2'),grid,set(gca,'FontSize',16);
subplot(313),plot(t,imf(:,3),'LineWidth',1),xlabel('Time [s]'),ylabel(''),title('IMF 3'),grid,set(gca,'FontSize',16);


return

s = size(imf);
Fs = 44100;

for i = 1:s(2)
z(:,i) = hilbert(imf(:,i));
instfreq(:,i) = Fs/(2*pi)*diff(unwrap(angle(z(:,i))));
%figure(i+10)
%clf
%plot(t(2:end),instfreq,'LineWidth',1),xlabel('Time [s]'),ylabel('Hz'),title(''),grid,set(gca,'FontSize',16);
%title(['Instantaneous Frequency of IMF', num2str(i)])
end
figure(31)
clf
subplot(311),plot(t(2:end),instfreq(:,1),'LineWidth',1),xlabel('Time [s]'),ylabel('Hz'),title('Instantaneous Frequency 1'),grid,set(gca,'FontSize',16);
xlim([0.005 0.014])
subplot(312),plot(t(2:end),instfreq(:,2),'LineWidth',1),xlabel('Time [s]'),ylabel('Hz'),title('Instantaneous Frequency 2'),grid,set(gca,'FontSize',16);
xlim([0.0005 0.014])
subplot(313),plot(t(2:end),instfreq(:,3),'LineWidth',1),xlabel('Time [s]'),ylabel('Hz'),title('Instantaneous Frequency 3'),grid,set(gca,'FontSize',16);
xlim([0.0005 0.014])
%hilb = z;
end

