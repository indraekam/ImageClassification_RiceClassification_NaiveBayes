function varargout = klasifikasi_beras(varargin)
% KLASIFIKASI_BERAS MATLAB code for klasifikasi_beras.fig
%      KLASIFIKASI_BERAS, by itself, creates a new KLASIFIKASI_BERAS or raises the existing
%      singleton*.
%
%      H = KLASIFIKASI_BERAS returns the handle to a new KLASIFIKASI_BERAS or the handle to
%      the existing singleton*.
%
%      KLASIFIKASI_BERAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLASIFIKASI_BERAS.M with the given input arguments.
%
%      KLASIFIKASI_BERAS('Property','Value',...) creates a new KLASIFIKASI_BERAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before klasifikasi_beras_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to klasifikasi_beras_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help klasifikasi_beras

% Last Modified by GUIDE v2.5 23-Jul-2022 17:08:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @klasifikasi_beras_OpeningFcn, ...
                   'gui_OutputFcn',  @klasifikasi_beras_OutputFcn, ...
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


% --- Executes just before klasifikasi_beras is made visible.
function klasifikasi_beras_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to klasifikasi_beras (see VARARGIN)
 I = imread('logo1.jpg');
 J = imread('logo2.jpg');
 axes(handles.axes_logoKiri);
 imshow(I);
 axes(handles.axes_logoKanan);
 imshow(J);


% Choose default command line output for klasifikasi_beras
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes klasifikasi_beras wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = klasifikasi_beras_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_proses.
function btn_proses_Callback(hObject, eventdata, handles)
% hObject    handle to btn_proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get Jarak
handles.jarak =  str2double(get(handles.txt_jarak, 'String'));
fprintf("ini jarak: %d ", handles.jarak);

% jarak = [0 2]; % jarak (1;2;3;4) sudut [0 jarak;-jarak jarak;-jarak 0;-jarak -jarak]
% Get Sudut
if handles.checkbox_nol.Value
    handles.sudut = [0 handles.jarak];
elseif handles.checkbox_empatlima.Value 
    handles.sudut = [-handles.jarak handles.jarak];
elseif handles.checkbox_sembilan.Value
    handles.sudut = [-handles.jarak 0];
elseif handles.checkbox_satutigalima.Value
    handles.sudut = [-handles.jarak -handles.jarak];
end

disp(handles.sudut)
    
% Get Level
% Level Kuantisasi (8, 16, 32, 64, 128)
if handles.popup_level.Value == 1
    handles.level = 8;
elseif handles.popup_level.Value == 2
    handles.level = 16;
elseif handles.popup_level.Value == 3
    handles.level = 32;
elseif handles.popup_level.Value == 4
    handles.level = 64;
elseif handles.popup_level.Value == 5
    handles.level = 128;
end

fprintf("ini level: %d ", handles.level);




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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_reset.
function btn_reset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox_nol.
function checkbox_nol_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_nol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_nol


% --- Executes on button press in checkbox_sembilan.
function checkbox_sembilan_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_sembilan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_sembilan


% --- Executes on button press in checkbox_empatlima.
function checkbox_empatlima_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_empatlima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_empatlima


% --- Executes on button press in checkbox_satutigalima.
function checkbox_satutigalima_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_satutigalima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_satutigalima



function txt_jarak_Callback(hObject, eventdata, handles)
% hObject    handle to txt_jarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_jarak as text
%        str2double(get(hObject,'String')) returns contents of txt_jarak as a double


% --- Executes during object creation, after setting all properties.
function txt_jarak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_jarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_level.
function popup_level_Callback(hObject, eventdata, handles)
% hObject    handle to popup_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_level contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_level


% --- Executes during object creation, after setting all properties.
function popup_level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_contrast.
function checkbox_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_contrast


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox_correlation.
function checkbox_correlation_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_correlation


% --- Executes on button press in btnPilihFile.
function btnPilihFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnPilihFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Citra Host
[filename, pathname]=uigetfile( {'*.*'},'Choose Host Image'); % Choosing file image host
getfilename = fullfile(pathname,filename); % mengambil path & file name citra host
[filepath2,name2,ext2] = fileparts(getfilename); % mengambil masing-masing nama path, nama file dan ekstensi file
citra_host = imread(getfilename); % membaca citra host
citra_host = imresize(citra_host,[512 512]);
[baris_host,kolom_host,layer_host] = size(citra_host); % mengambil ukuran baris, kolom dan layer warna citra
% if layer_host > 1 % jika layer warna lebih dari 1
%      citra_host = rgb2gray(citra_host); % dilakukan pengubahan citra dari rgb ke grayscale
% end
guidata(hObject, handles);
axes(handles.axes3); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(citra_host); %memunculkan gambar
Img = rgb2gray(citra_host);
% Img = imread(fullfile(pathname,filename));
% Img = grayslice(Img,5);
% m = double(max(Img(:)));
axes(handles.axes4); %memilih axes1 sebagai letak gambar yang dimunculkan
% imshow(Img, colormap(jet(m))); %memunculkan gambar
imshow(Img)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
