function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 09-Jun-2021 22:08:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);

xlabel(handles.axes1,'Time(seconds)')
ylabel(handles.axes1,'Temperature(°C)');
ylim(handles.axes1,[20 40])
title(handles.axes1,'Real-Time Temperature Graph');

(handles.axes2);
xlabel('Time(seconds)');
ylabel('Voltage(volt)');
ylim([3.5 5]);
title('Real-Time Voltage Graph');

% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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





function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start_temp.
function start_temp_Callback(hObject, eventdata, handles)
% hObject    handle to start_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a 
global y

y=25;
for i =1:15
    
    v=readVoltage(a,'A4');
    analog=(v/0.0048875);
    temp=analog*0.48828125;
    y=[y temp];
    plot(handles.axes1,y,'b','LineWidth',2.5)
    xlabel(handles.axes1,'Time(seconds)')
    ylabel(handles.axes1,'Temperature(°C)');
    ylim(handles.axes1,[20 40]) 
    title(handles.axes1,'Real-Time Temperature Graph');
    grid(handles.axes1,'on');

    set(handles.edit5,'String',num2str(temp));
    pause(1); 
end 



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_button.
function check_button_Callback(hObject, eventdata, handles)
% hObject    handle to check_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
global a s
try

        take_com=get(handles.edit1,'String')
        a= arduino(take_com,"UNO",'Libraries','Servo');
        set(handles.edit1,'Backgroundcolor','g');
        set(handles.text4,'Backgroundcolor','g');
        set(handles.text4,'String','Ready');
        s=servo(a,'D2');


catch
        set(handles.edit1,'Backgroundcolor','r');
        set(handles.text4,'Backgroundcolor','r');
        set(handles.text4,'String','Error');
        clear a;
  
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_voltage.
function start_voltage_Callback(hObject, eventdata, handles)
% hObject    handle to start_voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a
global voltage_dat
global s

derece=get(handles.edit3,'String');
if ~isempty(derece)
    if derece=='0'
    writePosition(s,0);
    end
de=180/str2double(derece);
de=1/de;
writePosition(s,de); 
end


voltage_dat=3;
for i =1:15
    v=readVoltage(a,'A1');
    voltage_dat=[voltage_dat v];
    plot(handles.axes2,voltage_dat,'r','LineWidth',1.5)
    (handles.axes2);
    xlabel('Time(seconds)');
    ylabel('Voltage(volt)');
    ylim([3.5 5]);
    title('Real-Time Voltage Graph');
    grid on;
    set(handles.edit6,'String',num2str(v));
    pause(1); 
end 



% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voltage_dat
mkdir('Voltage_Datas')
save('Voltage_Datas/Voltage','voltage_dat') 
fignew = figure('Visible','off'); % Invisible figure
newAxes = copyobj(handles.axes2,fignew); % Copy the appropriate axes
set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading

savefig(fignew,'Voltage_Datas/voltage.fig');
delete(fignew);



% --- Executes on button press in save_temp.
function save_temp_Callback(hObject, eventdata, handles)
% hObject    handle to save_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
mkdir('Temp_Datas')
save('Temp_Datas/Temp','y') 
fignew = figure('Visible','off'); % Invisible figure
newAxes = copyobj(handles.axes1,fignew); % Copy the appropriate axes
set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
savefig(fignew,'Temp_Datas/Temp.fig');
delete(fignew);

% --- Executes on button press in print_voltage.
function print_voltage_Callback(hObject, eventdata, handles)
% hObject    handle to print_voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = getframe(handles.axes2); % Get an image of the app in pixel color values
toShow = figure('Visible','off');
warning('off','images:initSize:adjustingMag') % Turn off a specific imshow warning that sometimes may appear
imshow(f.cdata); % Display the pixel data. 
warning('on','images:initSize:adjustingMag') % Turn the warning back on
set(toShow,'PaperOrientation','landscape',...
           'PaperUnits','normalized','PaperPosition',[0,0,1,1]); % Set some size preferences for printing
printdlg(toShow); % Open print menu
close(toShow) % Close the invisible figure


% --- Executes on button press in print_temp.
function print_temp_Callback(hObject, eventdata, handles)
% hObject    handle to print_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)g
f = getframe(handles.axes1); % Get an image of the app in pixel color values
toShow = figure('Visible','off');
warning('off','images:initSize:adjustingMag') % Turn off a specific imshow warning that sometimes may appear
imshow(f.cdata); % Display the pixel data. 
warning('on','images:initSize:adjustingMag') % Turn the warning back on
set(toShow,'PaperOrientation','landscape',...
           'PaperUnits','normalized','PaperPosition',[0,0,1,1]); % Set some size preferences for printing
printdlg(toShow); % Open print menu
close(toShow) % Close the invisible figure
