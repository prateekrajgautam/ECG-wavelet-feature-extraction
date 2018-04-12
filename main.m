clear all
close all
clc
select=input('enter a no to select mat file \n Options \n 0 for advanced options\n 1 for ECGDATA\n 2 for ravi \n 3 for matlabnew\n \n\n\');%select data
switch select
    case 1
        load('ECGDATA');
        ecg=ECG_1;
        v=ecg;
        tmax=max(Time_Adjusted);
        t=Time_Adjusted;
    case 2
        load('ravidata');
        ecg=v;
        tmax=max(t);
    case 3
        load('matlabnew');
        ecg=v;
        tmax=max(t);
    otherwise
        name=input('enter the name of mat file consisting \necg samples in variable ''v'' \n and \ntime in variable ''t''\n\n\n','s')
        load(name);
        ecg=v;
        tmax=max(t);
end
sr=numel(ecg)/max(tmax);
srate=['sampeling rate is ' num2str(sr)];
disp(srate)
rt=['recording_time=' num2str(tmax) 'sec'];
disp(rt)
[c,l,d1,d2,d3,d4,d5,d6,d7,d8,cleanecg]=wavelettransform(ecg);% wavelet transform and noise removal
threshold=thresholdcalc(cleanecg);% caclulate threshold for R wave
[rsquared]=rdetect(c,l,d3,d4,d5,cleanecg);% detect and square R wave
[beatrate,beatduration,srate,ra]=findbeatrate(rsquared,threshold,tmax);% find beat rate using rpeak and threshold
plotecg(ecg,ra,beatrate,srate,t);% plot the orignal signal and detected r-peak

