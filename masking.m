function [comp_1] = masking(signal,frq1,frq2,t)

signal_n = normalize(signal);

mask1 = sin(frq1*2*pi*t);
mask2 = sin(frq2*2*pi*t);
x_p = signal_n + mask1';
x_m = signal_n - mask1';

[imfp, res] = EMD(x_p,t);
%[imfm, res] = EMD(signal_n,t);

figure(20)
clf
subplot(311),plot(t,imfp(:,1),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);
subplot(312),plot(t,imfp(:,2),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);
subplot(313),plot(t,imfp(:,3),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);

comp_1 = imfp(:,1) - mask1';


end

