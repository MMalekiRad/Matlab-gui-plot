function varargout = main_ui(varargin)
% MAIN_UI MATLAB code for main_ui.fig
%      MAIN_UI, by itself, creates a new MAIN_UI or raises the existing
%      singleton*.
%
%      H = MAIN_UI returns the handle to a new MAIN_UI or the handle to
%      the existing singleton*.
%
%      MAIN_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_UI.M with the given input arguments.
%
%      MAIN_UI('Property','Value',...) creates a new MAIN_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_ui

% Last Modified by GUIDE v2.5 22-Jan-2019 01:18:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_ui_OutputFcn, ...
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


% --- Executes just before main_ui is made visible.
function main_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_ui (see VARARGIN)

% Choose default command line output for main_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_ui wait for user response (see UIRESUME)
% uiwait(handles.main_figure);


% --- Outputs from this function are returned to the command line.
function varargout = main_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in go_btn.
function go_btn_Callback(hObject, eventdata, handles)
% hObject    handle to go_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
yyy = get(handles.ui_buttongroup_colors,'SelectedObject');
tmpPickedColor = get(yyy,'String');

colorBacked = '';

switch tmpPickedColor
   
    case 'Black'
    colorBacked = 'k';
    
    case 'Green'
    colorBacked = 'g';
    
    case 'Red'
    colorBacked = 'r';
    
    case 'Blue'
    colorBacked = 'b';
    
    otherwise
      colorBacked = '';
      
end

axes(handles.ui_axis);
cla;
inputDataFromEditBox1 = get(handles.edit_1,'String');
inputDataFromEditBox2 = get(handles.edit_2,'String');

inputDataFromEditBox1 = str2func(inputDataFromEditBox1);
    try
    inputDataFromEditBox2 = str2num(inputDataFromEditBox2);
    finalDataToPlot = inputDataFromEditBox1(inputDataFromEditBox2);
    finalDataToPlot = plot(finalDataToPlot, [colorBacked]);
    global chBox2;
    if chBox2 ~=0
        legend(finalDataToPlot);
    end
    catch
    msgbox('Please check your input :)','Error Message','error');
  end
% %     
    % inputHandler(plot(inputDataFromEditBox,[colorBacked,styleBaced]));


function edit_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_1 as a double


% --- Executes during object creation, after setting all properties.
function edit_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_2 as text
%        str2double(get(hObject,'String')) returns contents of edit_2 as a double


% --- Executes during object creation, after setting all properties.
function edit_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkox_grid.
function checkox_grid_Callback(hObject, eventdata, handles)
% hObject    handle to checkox_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkox_grid
chBox = get(handles.checkox_grid,'Value');

if chBox ==0
     grid off;
else
    grid on;
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global chBox2;
chBox2 = get(handles.checkbox2,'Value');


% --- Executes on mouse press over axes background.
function ui_axis_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ui_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
yyy = get(handles.ui_buttongroup_colors,'SelectedObject');
tmpPickedColor = get(yyy,'String');

colorBacked = '';

switch tmpPickedColor
   
    case 'Black'
    colorBacked = 'k';
    
    case 'Green'
    colorBacked = 'g';
    
    case 'Red'
    colorBacked = 'r';
    
    case 'Blue'
    colorBacked = 'b';
    
    otherwise
      colorBacked = '';
      
end

axes(handles.ui_axis);
cla;
inputDataFromEditBox5 = get(handles.edit5,'String');
inputDataFromEditBox6 = get(handles.edit6,'String');

inputDataFromEditBox5 = str2func(['@(x)',inputDataFromEditBox5]);
    try
    inputDataFromEditBox6 = str2num(inputDataFromEditBox6);
    finalDataToPlot = inputDataFromEditBox5(inputDataFromEditBox6);
    finalDataToPlot = plot(finalDataToPlot, colorBacked);
    global chBox2;
    if chBox2 ~=0
        legend(finalDataToPlot);
    end
    catch
    msgbox('Please check your input :)','Error Message','error');
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
