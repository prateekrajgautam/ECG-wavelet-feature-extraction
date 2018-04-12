function[threshold]=thresholdcalc(wave)
max_wave=max(wave);
mean_wave=mean(wave);
threshold=(max_wave-mean_wave)/2;
end