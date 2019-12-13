function varargout = GUI313(varargin)
% GUI313 MATLAB code for GUI313.fig
%      GUI313, by itself, creates a new GUI313 or raises the existing
%      singleton*.
%
%      H = GUI313 returns the handle to a new GUI313 or the handle to
%      the existing singleton*.
%
%      GUI313('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI313.M with the given input arguments.
%
%      GUI313('Property','Value',...) creates a new GUI313 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI313_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI313_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI313

% Last Modified by GUIDE v2.5 12-Dec-2019 21:13:52

% Begin initialization code - DO NOT EDIT



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI313_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI313_OutputFcn, ...
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

global solz
global xbarriers
global zbarriers
global dragcofficent
global mass
global R
global zFinal
global terminated
global xwind
global zwind
global angularV


% --- Executes just before GUI313 is made visible.
function GUI313_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI313 (see VARARGIN)

% Choose default command line output for GUI313
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This creates the 'background' axes
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
I=imread('pm2.jpg');
hi = imagesc(I)
set(hi,'alphadata',.28)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
set(ha,'handlevisibility','off', ...
            'visible','off')

% UIWAIT makes GUI313 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI313_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function value1_Callback(hObject, eventdata, handles)
% hObject    handle to value1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xp = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of value1 as text
%        str2double(get(hObject,'String')) returns contents of value1 as a double


% --- Executes during object creation, after setting all properties.
function value1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_Callback(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solz
solz = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of v as text
%        str2double(get(hObject,'String')) returns contents of v as a double


% --- Executes during object creation, after setting all properties.
function v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vv_Callback(hObject, eventdata, handles)
% hObject    handle to vv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R
R = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vv as text
%        str2double(get(hObject,'String')) returns contents of vv as a double


% --- Executes during object creation, after setting all properties.
function vv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function vvv_Callback(hObject, eventdata, handles)
% hObject    handle to vvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xbarriers
xbarriers = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvv as text
%        str2double(get(hObject,'String')) returns contents of vvv as a double


% --- Executes during object creation, after setting all properties.
function vvv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vvvv_Callback(hObject, eventdata, handles)
% hObject    handle to vvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zbarriers
zbarriers = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvvv as text
%        str2double(get(hObject,'String')) returns contents of vvvv as a double


% --- Executes during object creation, after setting all properties.
function vvvv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vvvvv_Callback(hObject, eventdata, handles)
% hObject    handle to vvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dragcofficent
dragcofficent = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvvvv as text
%        str2double(get(hObject,'String')) returns contents of vvvvv as a double


% --- Executes during object creation, after setting all properties.
function vvvvv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vvvvvv_Callback(hObject, eventdata, handles)
% hObject    handle to vvvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mass
mass = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvvvvv as text
%        str2double(get(hObject,'String')) returns contents of vvvvvv as a double


% --- Executes during object creation, after setting all properties.
function vvvvvv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R
global xbarriers
global zbarriers
global zFinal
global mass
global dragcofficent
global gravity
global solz

solved = 1;
solx=0; %x initial position 
gravity=9.81;

toggle=true;
vs=0; %start value for the initial velocity magnitude
ve=3*1000000000; %end value for the initial velocity magnitude
thetas=0; %start value for the initial angle
thetae=90; %end value for the initial angle

while toggle
    if (abs(ve-vs)<0.001 || abs(thetae-thetas)<0.001) %to exit when the start and end value are almost the same
        toggle=false;
        msgbox('No Possible Solution');
        solved = 0;
    else
        
        v=(ve+vs)/2.0; %initial velocity equal to the average
        theta=(thetae+thetas)/2.0; %initial angle equal to the average
        solvx=v*cosd(theta); % initial velocity in x
        solvz=v*sind(theta);% initial velocity in z
        
        y=[solx;solvx;solz;solvz];
        Opt = odeset('Events', @Event); 
        [t,sol]=ode45(@projectilefun,(0:0.01:100),y,Opt);
        
        difference = sol(end,1)-R; %to calculate the difference between the final x position and the desired range
        
        %to calculate the closest point to the barrier
        check=0;
        dist = abs(sol(:,1)-xbarriers);
        mindist = min(dist);
        idx = find(dist == mindist);
        if((sol(idx,3)<=zbarriers) && xbarriers>0 && mindist<0.1)         
            check=1;
        end
        if (check==1) %hits a barrier
            vs=0;
            ve=3*1000000000;
            thetas=theta;
        elseif (abs(difference) < 0.01) %fells at the position
            toggle=false;
        elseif (difference > 0) %fell after the range
            ve=v;
        elseif (difference <0) %fell before the range
            vs=v;
        end
    end
end

hold on;

%barrier drawing

%projectile drawing
yline(0);
%plot(sol(:,1),sol(:,3));

if(solved)
    if (xbarriers>0) && (zbarriers > 0) 
        line([xbarriers xbarriers],[0 zbarriers],'LineWidth',4);
    end
    title('projectile');
    xlabel('x position');
    ylabel('z position');
    h = animatedline('Color',[0.4 0.6 0.7]);
    set(h,'LineWidth',2);
    addpoints(h,sol(:,1),sol(:,3));
    drawnow
    plot(sol(end,1),sol(end,3),'r*')
    set(handles.iv, 'String', v);
    set(handles.ia, 'String', theta);
    set(handles.time, 'String', t(end));
end
%function to solve the 4 ODE of the accelration to get the x and y
%positions
function [xp] = projectilefun(t,sol)
global dragcofficent
global mass
global gravity
global xwind
global zwind
global angularV

if (angularV == 0)
    xp=zeros(4,1);
    xp(1)=sol(2);    % dx/dt // velocity in x
    xp(2)=(-dragcofficent/mass)*sqrt( ((sol(2))^2) + ((sol(4))^2) )*sol(2)+xwind;   %dvx/dt //acceleration in x
    xp(3)=sol(4);     % dz/dt //velocity in y
    xp(4)=-gravity-(dragcofficent/mass)*sqrt( ((sol(2))^2) + ((sol(4))^2) )*sol(4)+zwind; %dvz/dt // acceleration in y
else
    xp=zeros(4,1);
    xp(1)=sol(2);    % dx/dt // velocity in x
    xp(2)=((-dragcofficent/mass)*sqrt( ((sol(2))^2) + ((sol(4))^2) )*sol(2)+(dragcofficent*angularV*sol(4))/(2*sqrt((sol(2)*angularV)^2+(sol(4)*angularV)^2)))+xwind;   %dvx/dt //acceleration in x
    xp(3)=sol(4);     % dz/dt //velocity in y
    xp(4)=-gravity-(dragcofficent/mass)*sqrt( ((sol(2))^2) + ((sol(4))^2) )*sol(4)+(dragcofficent*angularV*sol(2))/(2*sqrt((sol(2)*angularV)^2+(sol(4)*angularV)^2))+zwind; %dvz/dt // acceleration in y
end
%event function to break ode45 once it reach the final y position
function [value, isterminal, direction] = Event(t, sol)
    global zFinal;
    value = ~(sol(3)<=zFinal);
    isterminal = 1;   % Stop the integration
    direction  = -1; % Negative direction only



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
set([handles.v, handles.vv, handles.vvv, handles.vvvv, handles.vvvvv, handles.vvvvvv, handles.vvvvvvv, handles.vvvvvvvy, handles.vvy, handles.iv, handles.ia, handles.time, handles.av], 'String','');


function vvvvvvv_Callback(hObject, eventdata, handles)
% hObject    handle to vvvvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of vvvvvvv as text
%        str2double(get(hObject,'String')) returns contents of vvvvvvv as a double
global xwind
xwind = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function vvvvvvv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvvvvvv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vvy_Callback(hObject, eventdata, handles)
% hObject    handle to vvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zFinal
zFinal = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvy as text
%        str2double(get(hObject,'String')) returns contents of vvy as a double


% --- Executes during object creation, after setting all properties.
function vvy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vvvvvvvy_Callback(hObject, eventdata, handles)
% hObject    handle to vvvvvvvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zwind
zwind = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of vvvvvvvy as text
%        str2double(get(hObject,'String')) returns contents of vvvvvvvy as a double


% --- Executes during object creation, after setting all properties.
function vvvvvvvy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vvvvvvvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global terminated
terminated = 1



function iv_Callback(hObject, eventdata, handles)
% hObject    handle to iv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iv as text
%        str2double(get(hObject,'String')) returns contents of iv as a double


% --- Executes during object creation, after setting all properties.
function iv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ia_Callback(hObject, eventdata, handles)
% hObject    handle to ia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ia as text
%        str2double(get(hObject,'String')) returns contents of ia as a double


% --- Executes during object creation, after setting all properties.
function ia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function av_Callback(hObject, eventdata, handles)
% hObject    handle to av (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angularV
angularV = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of av as text
%        str2double(get(hObject,'String')) returns contents of av as a double


% --- Executes during object creation, after setting all properties.
function av_CreateFcn(hObject, eventdata, handles)
% hObject    handle to av (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
