%device select
% import java.lang.*
info = imaqhwinfo('winvideo');

% strArray = java_array('java.lang.String', length(info.DeviceInfo));
%     
% strArray(1:length(info.DeviceInfo)) = java.lang.String(info.DeviceInfo(1:length(info.DeviceInfo)).DeviceName);

% cellDeneme = cell(size(info.DeviceInfo));
for i = 1:length(info.DeviceInfo);
cc(i) = cellstr(info.DeviceInfo(i).DeviceName)
end