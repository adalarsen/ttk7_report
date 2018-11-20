% clear
close all
%[y,Fs] = audioread('files\T65_1_0_18min.mp3','double');

h = 1/Fs;
t_start_bs = 208; t_stop_bs = 210;
t_start_bs_short = 208.624; t_stop_bs_short = 208.64;
%t_start_bs_short = 208.4; t_stop_bs_short = 208.7;
t_start_cluster = 641; t_stop_cluster = 645;
t_start_nys = 465; t_stop_nys = 466;

t_start = t_start_bs_short;
t_stop =  t_stop_bs_short;

t = t_start:h:t_stop;

y_start = t_start/h + 1;
t_step = t_stop/h + 1;

sig_44k = y(y_start:(t_step),1); %44k sampled signal

%% Signal sampled at 4k hz. 
%h = 1/(Fs/11);
%t = t_start:h:t_stop;
t = t - t(1,1);
%sig_4k = decimate(sig_44k,11); %4k sampled signal
%%
sig_filt = hp_filter(sig_44k,5,200,Fs);

figure(7)
clf
%plot(t,sig_44k'),hold on;
plot(t,sig_filt','LineWidth',1),xlabel('Time [s]'),ylabel('Arbritary unit'),title(''),grid,set(gca,'FontSize',16);
%legend('Raw signal','Filtered signal');



%FFT_p(sig_filt,(Fs/11),(t_stop - t_start)/h+1); 


player = audioplayer(sig_filt,Fs);
play(player)

%FFT_p(imf(:,2),(Fs),(t_stop - t_start)/h+1); 


%figure(9)
%clf
%spectrogram(sig_filt,64,62,512,'',Fs,'yaxis');

[imf, residual] = EMD(sig_filt,t);

return

sig_new = imf(:,1) + imf(:,2);

FFT_p(sig_new, Fs/11, (t_stop - t_start)/h+1);



