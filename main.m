clc;
clear all;
probs=3;
iter=30;
%%minD=zeros(1,iter);
%%maxD=zeros(1,iter);
meaD=zeros(1,iter);

%%minT=zeros(1,iter);
%%maxT=zeros(1,iter);
meaT=zeros(1,iter);

tick=zeros(1,iter);
stdD=0;
stdT=0;
vecMeaD=zeros(probs,4);
vecMeaT=zeros(probs,4);
for i=1:probs
    for j=1:iter
        clc;
        disp(['Iteration ',  num2str(j)]);
        title(['Iteracion ',num2str(j),' archivo ',num2str(i)]);
       
        [pD, pT, tick(j) ] = MOACO(i*20);
        
       % minD(j)=min(pD);
        %maxD(j)=max(pD);
        meaD(j)=mean(pD);
        
        %minT(j)=min(pT);
        %maxD(j)=max(pT);
        meaT(j)=max(pT);
     end
    %%vecMeaD(i,:)=[i*20 min(minD) max(maxD(1,:)) mean(meaD) std(meaD) mean(tick)];
    %%vecMeaT(i,:)=[i*20 min(minT) max(maxT(1,:)) mean(meaT) std(meaT) mean(tick)];    
    vecMeaD(i,:)=[i*20 mean(meaD) std(meaD) mean(tick)];
    vecMeaT(i,:)=[i*20 mean(meaT) std(meaT) mean(tick)];  
    csvwrite('spea_D.csv' ,vecMeaD);
    csvwrite('spea_T.csv' ,vecMeaT); 
end
csvwrite('spea_D.csv' ,vecMeaD);
csvwrite('spea_T.csv' ,vecMeaT);    