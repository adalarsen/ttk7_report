%clear
%close all
%[y,Fs] = audioread('files\T65_1_0_18min.mp3','double');


h = 1/Fs;
t = 0:h:0.1;

t_start_bs_short = 208.4; t_stop_bs_short = 208.7;
t_start = t_start_bs_short;
t_stop =  t_stop_bs_short;

t = t_start:h:t_stop;

y_start = t_start/h + 1;
t_step = t_stop/h + 1;

sig_44k = y(y_start:(t_step),1); %44k sampled signal


%% Real sound

player = audioplayer(sig_44k,Fs);
play(player)

pause(1)

%% After filtering
sig_filt = hp_filter(sig_44k,5,200,Fs);

player = audioplayer(sig_filt,Fs);
play(player)

pause(1)

%% Built up by the frequency components
c1 = 0.02*sin(1400*2*pi*t);
c2 = sin(900*2*pi*t);
c3 = 0.5*sin(800*2*pi*t);
c4 = 0.01*sin(400*2*pi*t);
c5 = 0.01*sin(200*2*pi*t);

s = c1 + c2 + c3 + c4 + c5;

player = audioplayer(s,Fs);
play(player)