function[]=plotecg(ecg,ra,beatrate,srate,t)
high=max(ra);
% subplot(211);plot(ecg);title('Orginal ECG');
subplot(211);plot(t,ecg,'r');title('Orginal ECG');
subplot(212);plot(srate.*[1:length(ra)],ra,'r');title('R-peak detected ');
legend([num2str(beatrate) ' beats/min'])
text(length(ra)/2,high,['Beat Rate = ',num2str(fix(beatrate))],'EdgeColor','red');
xlabel('time (in sec)')
saveas(gcf,'ecgresult','fig')
saveas(gcf,'ecgresult','jpg')
x=['beat rate for input signal is detected ' num2str(floor(beatrate)) ' beats per minute'];
disp(x);
end