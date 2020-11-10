function toolPositionCB(h, varargin)

%使控件处于不可使用状态
set(h, 'Enable', 'off');

subplot(131);
control_line=imline;
addNewPositionCallback(control_line,@toolWarpCB);%加入实时变形
set(h, 'Enable', 'on', 'UserData', [h.UserData, control_line]);
