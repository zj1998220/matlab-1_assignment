function [x_change,y_change] = IDWImageWarp(im, psrc, pdst)
%psrc:�����߶��׶˵㼯�ϣ�n*2����x,y����x����y����,pdst:�����߶�β�˵㼯��
% input: im, psrc, pdst
%% basic image manipulations
% get image (matrix) size
tic;
[h, w, ~] = size(im);
n=size(psrc,1);

%����ɫ
%im2=im;
%im2(:,:,:)=190;

%im2(:,:,:)=0;
%%
x_change=zeros(h,w);
y_change=zeros(h,w);
%%
%% TODO: compute IDWwarpped image
%ϵ����=2
u=2;
%IDW�㷨
for i=1:h
    for j=1:w
        %sigma=1./(pdist2([j,i],psrc).^u);%pdist2�����ٶȹ���
        
        sigma=zeros(1,n);
        for k=1:n
            sigma(k)=1/(norm([j,i]-psrc(k,:))^u);
        end
        
        if all(sigma~=Inf)
           s=sum(sigma);
        else
           sigma(sigma~=Inf)=0;
           sigma(sigma==Inf)=1;
           s=1;
        end
        
        f=sigma./s*(pdst-psrc+[j,i]);
        %%
         x_change(i,j)=f(1);
         y_change(i,j)=h+1-f(2);
        %f=round(f);
        %if(f(1)>=1&&f(1)<=w)&&(f(2)>=1&&f(2)<=h)
        %    im2(f(2),f(1),:)=im(i,j,:); 
        %end
    end
end
toc;

%assignin('base','x_change',x_change);
%assignin('base','y_change',y_change);
%assignin('base','im2',im2);

%for i=2:h-1
%    for j=2:w-1
%        if(im2(i,j)==0&&im2(i-1,j)>0&& im2(i,j-1)>0&&im2(i+1,j)>0&&im2(i,j+1)>0) % �жϵ�ǰ���Ƿ�Ϊ��Ѩ��
%            im2(i,j,:) =(im2(i,j-1,:)+im2(i,j+1,:)+im2(i-1,j,:)+im2(i+1,j,:))./4;
%        end
%    end
%end