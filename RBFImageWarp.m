function [x_change,y_change] = RBFImageWarp(im, psrc, pdst)
%psrc:�����߶��׶˵㼯�ϣ�n*2����x,y����x����y����,pdst:�����߶�β�˵㼯��
% input: im, psrc, pdst
%% basic image manipulations
% get image (matrix) size
[h, w, ~] = size(im);
tic;
%����ɫ
%im2=im;
%im2(:,:,:)=190;

%% TODO: compute warpped image
%��ģn��������d����̾�����r��ϵ����=-1
u=-1;
n=size(psrc,1);

x_change=zeros(h,w);
y_change=zeros(h,w);

d=pdist2(psrc,psrc);
for ii=1:n
    d(ii,ii)=h+w;
end
r=min(d);
d(d==(h+w))=0;
%��ϵ������A; DA=P
P=pdst-psrc;
D=(d.^2+(repmat(r,n,1)).^2).^u;
A=D\P;
%RBF�㷨
for i=1:h
    for j=1:w
        f=[j,i];
        %f=(pdist2([j,i],psrc).^2+r.^2).^u*A+f;%pdist2�����ٶȹ���
        
        for k=1:n
            f=A(k,:)*(norm([j,i]-psrc(k,:))^2+r(k)^2)^u+f;
        end
        
        x_change(i,j)=f(1);
        y_change(i,j)=h+1-f(2);
        %f=round(f);
        %if(f(1)>=1&&f(1)<=w)&&(f(2)>=1&&f(2)<=h)
        %   im2(f(2),f(1),:)=im(i,j,:); 
        %end
    end
end
toc;
%for i=2:h-1
%    for j=2:w-1
%        if(im2(i,j,1)==190&&im2(i-1,j,1)~=190)&& im2(i-1,j-1,1)~=190 && im2(i,j+1,1)~=190 && im2(i+1,j,1)~=190 % �жϵ�ǰ���Ƿ�Ϊ��Ѩ��
%            im2(i,j,:) =im2(i,j-1,:);
%        end
%    end
%end