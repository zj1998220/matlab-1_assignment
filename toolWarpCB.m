function toolWarpCB(varargin)

%v = evalin('base','var'); 把基本工作空间中的变量var的值赋给局部变量v。
hlines = evalin('base', 'hToolPoint.UserData');
im = evalin('base', 'im');
%himg1 = evalin('base', 'himg1');
%himg2=evalin('base', 'himg2');

p2p = zeros(numel(hlines)*2,2); 
for i=1:numel(hlines)
    p2p(i*2+(-1:0),:) = hlines(i).getPosition();
end

[x_change1,y_change1]= RBFImageWarp(im, p2p(1:2:end,:), p2p(2:2:end,:));
subplot(132);
cla;surface(x_change1,y_change1,x_change1*0,'LineStyle','none', 'FaceColor','texturemap','CData', im);

[x_change2,y_change2]= IDWImageWarp(im, p2p(1:2:end,:), p2p(2:2:end,:));
subplot(133);
cla;surface(x_change2,y_change2,x_change2*0,'LineStyle','none', 'FaceColor','texturemap','CData', im);
