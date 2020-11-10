%% read image
im = imread('../TestImage/warp_test.bmp');
[h, w, ~] = size(im);
[x_change,y_change]=meshgrid(1:w,1:h);
%% draw 2 copies of the image
figure('Units', 'pixel', 'Position', [100,100,1000,700], 'toolbar', 'none');
subplot(131); imshow(im); title({'Source image', 'Press the red tool button to add point-point constraints', 'Press the blue tool button to compute the RBFwarpped image'});
subplot(132); himg1 = surface(x_change,y_change,x_change*0,'LineStyle','none', 'FaceColor','texturemap','CData', im);axis equal; axis off;
              axis([0 h 0 w]);title({'RBFWarpped Image'});
subplot(133); himg2 = surface(x_change,y_change,x_change*0,'LineStyle','none', 'FaceColor','texturemap','CData', im);axis equal; axis off;
              axis([0 h 0 w]);title({'IDWWarpped Image'});
hToolPoint = uipushtool('CData', reshape(repmat([1 0 0], 100, 1), [10 10 3]), 'TooltipString', 'add point constraints to the map', ...
                        'ClickedCallback', @toolPositionCB, 'UserData', []);%CData:Í¼±ê
hToolWarp = uipushtool('CData', reshape(repmat([0 0 1], 100, 1), [10 10 3]), 'TooltipString', 'compute RBF and IDW warped image', ...
                       'ClickedCallback', @toolWarpCB);
%% TODO: implement function: RBFImageWarp and IDWImageWarp
% check the title above the image for how to use the simple user-interface to define point-constraints and compute the warpped image