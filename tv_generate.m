
%%%% tv generation for an input picture

function tvgrad=tv_generate(Iin,epsi,hf1x,hf1y,hf2x,hf2y)
%%Iin£ºÍ¼Ïñ
% epsi£ºeps
%epsi=1e-8;
%h1x=[0 0 0;-1 1 0;0 0 0];
%h1y=[0 -1 0;0 1 0;0 0 0];
%h2x=[0 0 0;0 1 -1;0 0 0];
%h2y=[0 0 0;0 1 0;0 -1 0];
%%À©Í¼
Iin=[Iin(:,1),Iin,Iin(:,end)];
Iin=[Iin(1,:);Iin;Iin(end,:)];

d1x=filter2(hf1x,Iin);
d1y=filter2(hf1y,Iin);
fenmu=epsi+d1x.*d1x+d1y.*d1y;
fenmu=sqrt(fenmu);

guodux=d1x./fenmu;
guoduy=d1y./fenmu;

d2x=filter2(hf2x,guodux);
d2y=filter2(hf2y,guoduy);

tvgrad=d2x+d2y;
tvgrad=tvgrad(2:end-1,2:end-1);
end



