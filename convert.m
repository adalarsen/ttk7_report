clear
close all
[y,Fs] = audioread('files\T65_1_0_18min.mp3','double');

h = 1/Fs;
t_start_bs = 208; t_stop_bs = 210;
t_start_bs_short = 208.4; t_stop_bs_short = 208.7;
t_start_cluster = 641; t_stop_cluster = 645;
t_start_nys = 465; t_stop_nys = 466;

t_start = t_start_bs_short;
t_stop =  t_stop_bs_short;

t = t_start:h:t_stop;

y_start = t_start/h + 1;
t_step = t_stop/h + 1;

sig_44k = y(y_start:(t_step),1);

h = 1/(Fs/11);

t = t_start:h:t_stop;
t = t - t(1,1);
sig_4k = decimate(sig_44k,11);


figure(1)
clf
plot(t,sig_4k,'LineWidth',1),xlabel('Time [s]'),ylabel('[arb. unit]'),title('Raw signal'),grid,set(gca,'FontSize',16);
grid on
                   
FFT_p(sig_4k,(Fs/11),(t_stop - t_start)/h+1);

%spectrogram(sig_4k,'yaxis');

EMD(sig_4k,t);


