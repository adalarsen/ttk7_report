function [imf,residual] = EMD(signal,t)

t = t - t(1,1);

[imf,residual] = emd(signal,'MaxNumIMF',10);

figure('Name', 'IMFs')
clf
subplot(611),plot(t,imf(:,1),'LineWidth',1),xlabel(''),ylabel('IMF1'),title('IMFs'),grid,set(gca,'FontSize',16);
subplot(612),plot(t,imf(:,2),'LineWidth',1),xlabel(''),ylabel('IMF2'),title(''),grid,set(gca,'FontSize',16);
subplot(613),plot(t,imf(:,3),'LineWidth',1),xlabel(''),ylabel('IMF3'),title(''),grid,set(gca,'FontSize',16);
subplot(614),plot(t,imf(:,4),'LineWidth',1),xlabel(''),ylabel('IMF4'),title(''),grid,set(gca,'FontSize',16);
subplot(615),plot(t,imf(:,5),'LineWidth',1),xlabel(''),ylabel('IMF5'),title(''),grid,set(gca,'FontSize',16);
subplot(616),plot(t,imf(:,6),'LineWidth',1),xlabel('Time [s]'),ylabel('IMF6'),title(''),grid,set(gca,'FontSize',16);
grid on



figure('Name', 'IMFs')
clf
subplot(211),plot(t,imf(:,1)+imf(:,2),'LineWidth',1),xlabel(''),ylabel('IMF1+2+3'),title('IMF 1, 2 & 3 and real signal'),grid,set(gca,'FontSize',16);
subplot(212),plot(t,signal,'LineWidth',1),xlabel(''),ylabel('Signal'),title(''),grid,set(gca,'FontSize',16);
end

