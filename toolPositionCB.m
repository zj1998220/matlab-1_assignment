function toolPositionCB(h, varargin)

%ʹ�ؼ����ڲ���ʹ��״̬
set(h, 'Enable', 'off');

subplot(131);
control_line=imline;
addNewPositionCallback(control_line,@toolWarpCB);%����ʵʱ����
set(h, 'Enable', 'on', 'UserData', [h.UserData, control_line]);
