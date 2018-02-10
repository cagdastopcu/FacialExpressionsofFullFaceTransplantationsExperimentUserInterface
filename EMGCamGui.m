function varargout = EMGCamGui(varargin)
% EMGCAMGUI MATLAB code for EMGCamGui.fig
%      EMGCAMGUI, by itself, creates a new EMGCAMGUI or raises the existing
%      singleton*.
%
%      H = EMGCAMGUI returns the handle to a new EMGCAMGUI or the handle to
%      the existing singleton*.
%
%      EMGCAMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMGCAMGUI.M with the given input arguments.
%
%      EMGCAMGUI('Property','Value',...) creates a new EMGCAMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EMGCamGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EMGCamGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMGCamGui

% Last Modified by GUIDE v2.5 24-Apr-2014 19:27:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EMGCamGui_OpeningFcn, ...
                   'gui_OutputFcn',  @EMGCamGui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EMGCamGui is made visible.
function EMGCamGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EMGCamGui (see VARARGIN)

% Choose default command line output for EMGCamGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EMGCamGui wait for user response (see UIRESUME)
% uiwait(handles.figureEMGCamGui);


% --- Outputs from this function are returned to the command line.
function varargout = EMGCamGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

imshow('logo.jpg','Parent',handles.axes1)
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
popup2Value = get(handles.popupmenu2,'Value')
switch popup2Value
    case 1
        movementName = 'Notral';
    case 2
        movementName = 'KasKaldirma';
    case 3
        movementName = 'GozKapama';
    case 4
        movementName = 'Disleri Gosterme';
    case 5
        movementName = 'IslikCalma';
    case 6
        movementName = 'DisSikma';
    case 7
        movementName = 'Sasirma';
    case 8
        movementName = 'Kizgin';
    case 9
        movementName = 'Uzgun';
    case 10
        movementName = 'Korku';
    case 11
        movementName = 'Mutlu'
    case 12
        movementName = 'Nefret'
        
    otherwise
        movementName = 'Problem';
end

subjectName = get(handles.edit1,'String')
% movementName = get(handles.edit2,'String')
camDeviceName = get(handles.popupmenu1,'Value')
% ccvsonuc = 1;
% ccvsonuc = captureCamVideo(subjectName,movementName,camDeviceName);
%% create job
% global GuiHandle;
GuiHandle = ancestor(hObject, 'figure');
% GuiHandle1 = ancestor(hObject, 'figure');
% functionTestGui(GuiHandle)
% sched = findResource('scheduler','type','local');
% sched = parcluster('scheduler','type','local');

c = parcluster
j = createJob(c);


obj1 = createTask(j, @captureCamVideo,0,{subjectName,movementName,camDeviceName})
% obj2 = createTask(j, @functionTestGui,0,{GuiHandle})

submit(j)
CTCounter(GuiHandle,popup2Value)
wait(j);
% waitForState(j,'finished');
%results = getAllOutputArguments(j);

%% show results
% outmsg1 = get(obj1, 'CommandWindowOutput');
% outmsg2 = get(obj2, 'CommandWindowOutput');
% 
% disp('task1 executed, every 0.05s:');
% datestr(str2num(outmsg1),'dd.mmm.yyyy HH:MM:SS')
% disp('task1 executed, every 0.25s:');
% datestr(str2num(outmsg2),'dd.mmm.yyyy HH:MM:SS')

%% clean up
% destroy(j);

%% Clean Up all Jobs
%sched.findJob.destroy


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text4,'backgroundcolor','black')
close(handles.figureEMGCamGui)
%% close


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info = imaqhwinfo('winvideo');
% infoDeviceStr = strcat(info.DeviceInfo(1).DeviceName,' ',...
%     info.DeviceInfo(2).DeviceName);
for i = 1:length(info.DeviceInfo);
DeviceNameCell(i) = cellstr(info.DeviceInfo(i).DeviceName)
end
set(handles.popupmenu1,'string',DeviceNameCell);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

camDeviceName1 = get(handles.popupmenu1,'Value')
vid1 = videoinput('winvideo',camDeviceName1,'RGB24_640x480');
preview(vid1)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
