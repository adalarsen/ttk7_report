function [comp_1] = masking(signal,frq1,frq2,t)

signal_n = normalize(signal);

mask1 = sin(frq1*2*pi*t);
mask2 = sin(frq2*2*pi*t);
x_p1 = signal_n + mask1';
x_m1 = signal_n - mask1';

[imfp, resp] = EMD(x_p1,t);
[imfm, resm] = EMD(x_m1,t);
%[imfm, res] = EMD(signal_n,t);

imf = (imfp + imfm)/2;
imf(:,1) = imf(:,1) - mask1; 

figure(20)
clf
subplot(311),plot(t,imf(:,1),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);
subplot(312),plot(t,imf(:,2),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);
subplot(313),plot(t,imf(:,3),'LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);

comp_1 = imfp(:,1) - mask1';


end

