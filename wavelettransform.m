function[c,l,d1,d2,d3,d4,d5,d6,d7,d8,cleanecg]=wavelettransform(ecg)
ecgsmooth=ecg-smooth(ecg,150);%eliminate baseline drift
[c,l]=wavedec(ecgsmooth,8,'db4');%wavelettransform
[d1,d2,d3,d4,d5,d6,d7,d8]=detcoef(c,l,[1,2,3,4,5,6,7,8]);
[thr,sorh,keepapp]=ddencmp('den','wv',ecgsmooth);
cleanecg=wdencmp('gbl',c,l,'db4',8,thr,sorh,keepapp);
