function [y] = hp_filter(signal,order, cut, sampled)

cut = cut*2*pi;
sampled = sampled*2*pi;

[b,a] = butter(order,cut/(sampled/2),'high');
filtsig = filter(b,a,signal);
y = filtsig;
end

