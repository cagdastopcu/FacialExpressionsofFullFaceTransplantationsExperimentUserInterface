function CTCounter(GuiHandle,popup2Value)
handles = guidata(GuiHandle);
imshow('logo.jpg','Parent',handles.axes1)
load('birakin.mat')
FsSes = 48000;
audioObj = audioplayer(birakin,FsSes);
switch popup2Value
    
    case 7
        movementName = 'Sasirma';
        imshow('sasirma.png','Parent',handles.axes1)
        
    case 8
        movementName = 'Kizgin';
        imshow('kizgin.png','Parent',handles.axes1)
    case 9
        movementName = 'Uzgun';
        imshow('uzgun.png','Parent',handles.axes1)
    case 10
        movementName = 'Korku';
        imshow('korkma.png','Parent',handles.axes1)
    case 11
        movementName = 'Mutlu'
        imshow('mutlu.png','Parent',handles.axes1)
    case 12
        movementName = 'Nefret'
        imshow('nefret.png','Parent',handles.axes1)
        
    otherwise
        movementName = 'Problem';
        imshow('logo.jpg','Parent',handles.axes1)
end

set(handles.text4,'String','Kayýt Baþlýyor...');

t = timer('TimerFcn', 'stat=false; disp(''Timer!'')',... 
                 'StartDelay',10);
start(t)
pause(14)
stat=1;
set(handles.text4,'FontSize',90);
i = 0;
while(i<=20)
    
%     ccvsonuc = 1;
%     ccvsonuc = captureCamVideo(subjectName,movementName,camDeviceName);
    
    i5 = mod(i,5);
    if (i5<=3 && i5>=2)
        set(handles.text4,'backgroundcolor','r')
        set(handles.text4,'String','Kas')
        
    elseif i5 == 4
        
        
        set(handles.text4,'backgroundcolor','blue')
        
          set(handles.text4,'String','Býrak')
          
          play(audioObj);
        
    else
        
        set(handles.text4,'backgroundcolor','green')
        
          set(handles.text4,'String',i5)
        
    end
i = i+1;
  pause(1)
%   if ccvsonuc == 0
%       break;
%   end

end

set(handles.text4,'backgroundcolor',[0.941,0.941,0.941])
set(handles.text4,'FontSize',20);
set(handles.text4,'String','Yeni Kayda Hazýr');
imshow('logo.jpg','Parent',handles.axes1)
end