function ccvSonuc = captureCamVideo(SubjName,Mov,DeviceName)

clc,
% handles = guidata(GuiHandle1);
% set(handles.text5,'String','Kayýt Baþlýyor...');
% vidobj =  videoinput('winvideo', 2, 'RGB24_1280x960');

vidobj =  videoinput('winvideo', DeviceName, 'RGB24_640x480');
% src = getselectedsource(vidobj);
% src.FrameRate = '24.0000';

% set(vidobj,'FrameRate',24);

% vidobj.FrameRate = 24;
% set(vidobj.Source,'FrameRate',23.976)
% src = getselectedsource(vidobj);
% src.FrameRate = '15.0000';
set(vidobj,'TriggerRepeat',23);
set(vidobj,'FramesPerTrigger',30);

set(vidobj, 'LoggingMode', 'disk')
currentFolder = pwd;
mkdir(SubjName);
filename = strcat(currentFolder,'\',SubjName,'\',SubjName,'_',Mov,'_',date,'.avi')
logfile = VideoWriter(filename,'Uncompressed AVI')
% logfile.FrameRate = 23.976;

% logfile.getProfiles
% set(logfile,'Width',1280);
% set(logfile,'Height',960);

vidobj.DiskLogger = logfile;

start(vidobj)
disp('video capturing process has been started...')

wait(vidobj, 26)
%% burada islemciye cok yuklenildiginde sorun cikabilir
% while (vidobj.FramesAcquired ~= vidobj.DiskLoggerFrameCount) 
%     pause(.1)
% end


% delete(vidobj)
% disp('video object has been deleted.')
% clear vidobj

ccvSonuc = 0;
end