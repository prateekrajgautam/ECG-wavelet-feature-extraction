function[rsquared]=rdetect(c,l,d3,d4,d5,cleanecg)
a5=appcoef(c,l,'db4',5);
C1=[a5;d5;d4;d3];
L1=[length(a5);length(d5);length(d4);length(d3);length(cleanecg)];
rfind=waverec(C1,L1,'db4');
rsquared=rfind.^2;

end