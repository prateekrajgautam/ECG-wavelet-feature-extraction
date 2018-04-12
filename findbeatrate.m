function[beatrate,beatduration,srate,ra]=findbeatrate(rsquared,threshold,tmax)
dav1=[];
beatrate=0;
ra=zeros(length(rsquared),1);
ra(find(rsquared>3*threshold),1)=rsquared(find(rsquared>3*threshold),1);
len=length(ra);
d=0;
for i=1:len-1
    if ra(i,1)==0&&ra(i+1,1)~=0
        if numel(d)>1
            dav1=[dav1,i-d(1,length(d))];
        end
        d=[d,i];
    end
end
dav1;
beatsamplerate=sum(dav1)/(numel(dav1)-1);
dav=beatsamplerate;

noofsamples=numel(rsquared);
tinterval=tmax*(sum(dav1))/length(ra);
srate=tmax/noofsamples;
srate1=tinterval/noofsamples;
beatduration=dav*srate1;
beatrate=60/beatduration;
end