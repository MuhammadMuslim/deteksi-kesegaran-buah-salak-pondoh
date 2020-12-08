function varargout = gui(varargin)
% GUI M-file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given Input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 23-Nov-2020 15:22:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function urlsalak_Callback(hObject, eventdata, handles)
% hObject    handle to urlsalak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of urlsalak as text
%        str2double(get(hObject,'String')) returns contents of urlsalak as a double


% --- Executes during object creation, after setting all properties.
function urlsalak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to urlsalak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename,pathname] = uigetfile({'*.jpg';'*.*'},'Ambil Gambar');
ambilFoto = imread([pathname,filename]) ;
set(handles.urlsalak,'String',[pathname,filename]) ;
set(handles.Input,'HandleVisibility','ON') ;
set(handles.Identifikasi,'HandleVisibility','OFF') ; 
set(handles.cvt,'HandleVisibility','OFF') ;

imagesc(ambilFoto) ;

set(handles.Input,'XTickLabel','','YTickLabel','');
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    info = imfinfo(fullfile(pathname,filename));
    bitdepth = info.BitDepth;
    if bitdepth ==24
        axes(handles.Input)
        imshow(Img)
        set(handles.popupmenu11,'enable','on')
        set(handles.popupmenu11,'Value',1)
    else
        errordlg('Image must be RGB','File Error');
    end
else
    return 
end
handles.Img = Img;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, ~)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, ~, handles)
n(1) = 10 ;
n(2) = 10 ;
data1 = randn(200,1)+3;
data2 = randn(200,1)+7;
data(1:100,1:2) = [data1(1:100),data2(1:100)];
data(101:200,1:2) = [data2(101:200),data1(101:200)];

load mu.mat ;
load sigma.mat ;

 ambilsalak = getimage(handles.Input);
    %% Olah Data salak 
    imagesalakGray = rgb2gray(ambilsalak) ;
    [p,g] = size(imagesalakGray) ;
    imagesalakVektor = reshape(imagesalakGray,1,p*g) ;
    x_barsalak = mean(imagesalakVektor) ;
    %% Implementasi pada Fungsi gassian
    [gjx_salak]= GJ(miu,sigmah,n,x_barsalak); 
    [gjv_salak,c_salak] = max(gjx_salak) ;
    cDeteksi_salak = c_salak ; 
    %% Implementasi pada FCM
    [center,U,obj_fcm] = fcm(data,2);
    maxU = max(U);
    index1 = find(U(1,:) == maxU);
    index2 = find(U(2, :) == maxU);
    line(center(:,1),center(:,2));
    %%
    %cDeteksi_salak
    salakBaru = 'Periode kesegaran hari 1-10' ;
    salakLama = 'Periode kesegaran hari 11-20' ;
    salakNihil = 'Tidak Terdeteksi' ;
    jmlh0 = '-';
    jmlh1 = '1';
    jmlh2 = '2';
    jmlh3 = '3';
    jmlh4 = '4';
    jmlh5 = '5';
    kla0 = '-';
    kla1 = 'kelas 1';
    kla2 = 'kelas 2';
    kla3 = 'kelas 3';
    kla4 = 'kelas 4';
    kl0 = '-';
    kl1 = 'Segar';
    kl2 = 'Pengurangan kesegaran';
    kl3 = 'Peralihan';
    kl4 = 'Menuju Busuk';
    kl5 = 'Busuk';
    
    if cDeteksi_salak == i 
        set(handles.hasil,'String', salakLama) ;
        set(handles.t1,'String', jmlh2) ;
        set(handles.t2,'String', kl1) ;
        set(handles.t3,'String', kl2) ;
        set(handles.t4,'String', kl3) ;
        set(handles.t5,'String', kl4) ;
        %%set(handles.t5,'String', kl5) ;
        ambilFotoh = imread('salaklama2.jpg');
        set(handles.Identifikasi,'HandleVisibility','ON') ;
        set(handles.Input,'HandleVisibility','OFF') ; 
        set(handles.cvt,'HandleVisibility','OFF') ;
        imagesc(ambilFotoh) ;
        set(handles.Identifikasi,'XTickLabel','','YTickLabel','');
        colormap(gray)
    elseif cDeteksi_salak == 2 
        set(handles.t1,'String', jmlh3) ;
        set(handles.ta1,'String', kla1) ;
        set(handles.ta2,'String', kla2) ;
        set(handles.ta3,'String', kla3) ;
        set(handles.t2,'String', kl1) ;
        set(handles.t3,'String', kl2) ;
        set(handles.t4,'String', kl3) ;
        set(handles.t5,'String', kl4) ;
        set(handles.t6,'String', kl5) ;
        set(handles.tk1,'String', kl1) ;
        set(handles.tk2,'String', kl3) ;
        set(handles.tk3,'String', kl5) ;
        set(handles.tk4,'String', kl0) ;
        set(handles.tk5,'String', kl0) ;
        set(handles.hasil,'String', salakBaru) ;
        fprintf('Jumlah Kelas:%s',jmlh3);
        fprintf('\n Kelas periode:%s',kl0,kl2,kl4);
        ambilFoto = imread('salakbaru2.jpg');
        set(handles.Identifikasi,'HandleVisibility','ON') ;
        set(handles.Input,'HandleVisibility','OFF') ;
        set(handles.cvt,'HandleVisibility','OFF') ;
        imagesc(ambilFoto) ;
        set(handles.Identifikasi,'XTickLabel','','YTickLabel','');
        colormap(gray) 
    else
         set(handles.hasil,'String', salakNihil) ;
         set(handles.Identifikasi,'HandleVisibility','OFF') ;
         set(handles.Input,'HandleVisibility','OFF') ;
         set(handles.cvt,'HandleVisibility','OFF') ;
    end
        cDeteksi_salak
    clear 



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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, ~, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DF.
function DF_Callback(hObject, eventdata, handles)
% hObject    handle to DF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

peringatan

load interval.mat

set(handles.k,'String',k) ;
k
x = getimage(handles.Input) ;
%salak = imread(in);
salak1 = rgb2gray(x) ;
salak2 = imresize(salak1,[20,20]);
gambar_salak = reshape(salak2,400,1) ;
gambar_salak = double(gambar_salak) ;

gambar_salak

k 

[interval, m,f,fr,fk] = TDistribusiFrekuensi(gambar_salak,k) 

%newData=[interval(1); interval(2);interval(3);interval(4);interval(5)  m(1);m(2);m(3);m(4);m(5)]
%newData = [m(1);m(2);m(3);m(4);m(5)];
% t=[interval, m,f,fr,fk];
% 
% interval = interval(1:k)
% [x,y]=size(interval);
% a=reshape(interval,x*y,1);
% 
% [x,y]=size(m);
% b=reshape(m,x*y,1);
% [x,y]=size(f);
% c=reshape(f,x*y,1);
% [x,y]=size(fr);
% d=reshape(fr,x*y,1);
% [x,y]=size(fk);
% e=reshape(fk,x*y,1);
% t= [a b c d e];


kolom = {'Interval','M','Frekuensi (F)','Frekuensi Relatif (Fr)','Frekuensi Kumulatif(Fk)'}
in = cell(k,1) ;

for i = 1: k 
    in{i,1} = [num2str(interval(i)) '-' num2str(interval(i+1))];
    in{i,2} = num2str(m(i)) ;
    in{i,3} = num2str(f(i)) ;
    in{i,4} = num2str(fr(i)) ;
    in{i,5} = num2str(fk(i)) ;
end
    data = [in] ;
    

set(handles.tabel,'data',data,'columnName',kolom);


% --- Executes when entered data in editable cell(s) in table.
function table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getimage(handles.Input) ;
%bakso = imread(in);
salak1 = rgb2gray(x) ;
salak2 = imresize(salak1,[20,20]);
gambar_salak = reshape(salak2,400,1) ;
gambar_salak = double(gambar_salak) ;

gambar_salak
MeanData(gambar_salak);
g = MeanData(gambar_salak);

set(handles.HasilMD,'String',g)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getimage(handles.Input) ;
%bakso = imread(in);
salak1 = rgb2gray(x) ;
salak2 = imresize(salak1,[20,20]);
gambar_salak = reshape(salak2,400,1) ;
gambar_salak = double(gambar_salak) ;

gambar_salak
k = get(handles.HasilMDK,'String') ;
HasilMDK = double(k) ;



% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getimage(handles.Input) ;
%bakso = imread(in);
salak1 = rgb2gray(x) ;
salak2 = imresize(salak1,[20,20]);
gambar_salak = reshape(salak2,400,1) ;
gambar_salak = double(gambar_salak) ;

gambar_salak
%MeanData(gambar_bakso);
%g = VaransiData(gambar_bakso);
variansi = VariansiData(gambar_salak);

set(handles.HasilVD,'String',variansi)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function HasilVD_Callback(hObject, eventdata, handles)
% hObject    handle to HasilVD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HasilVD as text
%        str2double(get(hObject,'String')) returns contents of HasilVD as a double


% --- Executes during object creation, after setting all properties.
function HasilVD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HasilVD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HasilMD_Callback(hObject, eventdata, handles)
% hObject    handle to HasilMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HasilMD as text
%        str2double(get(hObject,'String')) returns contents of HasilMD as a double


% --- Executes during object creation, after setting all properties.
function HasilMD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HasilMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function hasilBayesAyam_Callback(hObject, eventdata, handles)
% hObject    handle to hasilBayesAyam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilBayesAyam as text
%        str2double(get(hObject,'String')) returns contents of hasilBayesAyam as a double


% --- Executes during object creation, after setting all properties.
function hasilBayesAyam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilBayesAyam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasilBeyesSapi_Callback(hObject, eventdata, handles)
% hObject    handle to hasilBeyesSapi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilBeyesSapi as text
%        str2double(get(hObject,'String')) returns contents of hasilBeyesSapi as a double


% --- Executes during object creation, after setting all properties.
function hasilBeyesSapi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilBeyesSapi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.jpg';'*.*'},'Ambil Gambar');  

if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    info = imfinfo(fullfile(pathname,filename));
    bitdepth = info.BitDepth;
    if bitdepth ==24
        axes(handles.input1)
        imshow(Img)
        set(handles.popupmenu9,'enable','on')
        set(handles.popupmenu9,'Value',1)
    else
        errordlg('Image must be RGB','File Error');
    end
else
    return
end

handles.Img = Img;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.jpg';'*.*'},'Ambil Gambar');  

if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    info = imfinfo(fullfile(pathname,filename));
    bitdepth = info.BitDepth;
    if bitdepth ==24
        axes(handles.Input2)
        imshow(Img)
        set(handles.popupmenu9,'enable','on')
        set(handles.popupmenu9,'Value',1)
    else
        errordlg('Image must be RGB','File Error');
    end
else
    return
end

handles.Img = Img;
guidata(hObject, handles);


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9
Img = handles.Img;
val = get(hObject,'Value');

switch val
    case 1
        axes(handles.Input2)
        imshow(Img)
        R = Img(:,:,1);
        axes(handles.Gray1)
        imshow(R)
        axes(handles.Histogram1)
        imhist(R)
        G = Img(:,:,2);
        axes(handles.Gray2)
        imshow(G)
        axes(handles.Histogram2)
        imhist(G)
        B = Img(:,:,3);
        axes(handles.Gray3)
        imshow(B)
        axes(handles.Histogram3)
        imhist(B)
    case 2
        HSV = rgb2hsv(Img);
        axes(handles.Input2)
        imshow(HSV)
        H = HSV(:,:,1);
        axes(handles.Gray1)
        imshow(H)
        axes(handles.Histogram1)
        imhist(H)
        S = HSV(:,:,2);
        axes(handles.Gray2)
        imshow(S)
        axes(handles.Histogram2)
        imhist(S)
        V = HSV(:,:,3);
        axes(handles.Gray3)
        imshow(V)
        axes(handles.Histogram3)
        imhist(V)
    case 3
        NTSC = rgb2ntsc(Img);
        axes(handles.Input2)
        imshow(NTSC)
        Y = NTSC(:,:,1);
        axes(handles.Gray1)
        imshow(Y)
        axes(handles.Histogram1)
        imhist(Y)
        I = NTSC(:,:,2);
        axes(handles.Gray2)
        imshow(I)
        axes(handles.Histogram2)
        imhist(I)
        Q = NTSC(:,:,3);
        axes(handles.Gray3)
        imshow(Q)
        axes(handles.Histogram3)
        imhist(Q)
    case 4
        YCbCr = rgb2ycbcr(Img);
        axes(handles.Input2)
        imshow(YCbCr)
        Y = YCbCr(:,:,1);
        axes(handles.Gray1)
        imshow(Y)
        axes(handles.Histogram1)
        imhist(Y)
        Cb = YCbCr(:,:,2);
        axes(handles.Gray2)
        imshow(Cb)
        axes(handles.Histogram2)
        imhist(Cb)
        Cr = YCbCr(:,:,3);
        axes(handles.Gray3)
        imshow(Cr)
        axes(handles.Histogram3)
        imhist(Cr)
    case 5
        Grayscale = rgb2gray(Img);
        axes(handles.Input2)
        imshow(Grayscale)
        G1 = Grayscale(:,:,1);
        axes(handles.Gray1)
        imshow(G1)
        axes(handles.Histogram1)
        imhist(G1)
        Re = Grayscale(:,:,2);
        axes(handles.Gray2)
        imshow(Re)
        axes(handles.Histogram2)
        imhist(Re)
        Ey = Grayscale(:,:,3);
        axes(handles.Gray3)
        imshow(Ey)
        axes(handles.Histogram3)
        imhist(Ey)
end


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gui g = new gui2();
g.Show();


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about ab = new about();
ab.Show();


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button = questdlg('Anda Yakin Ingin Keluar?',...
'Exit Dialog','Yes','No','No');
switch button
case 'Yes',
disp('Exiting MATLAB');
exit
case 'No',
quit cancel;
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
n(1) = 10 ;
n(2) = 10 ;

load mu.mat ;
load sigma.mat ;


 ambilsalak1 = getimage(handles.Input);
 
   % FimageBA = strcat('dataTraining\salakBaru\',int2str(i),'.jpg') ;
   % FimageBS = strcat('dataTesting\salakLama\',int2str(i),'.jpg') ;
    
    %% Olah Data salak 
   
    imagesalakGray1 = rgb2gray(ambilsalak1) ;
    
    [p,g] = size(imagesalakGray1) ;
    imagesalakVektor = reshape(imagesalakGray1,1,p*g) ;
    x_barsalak = mean(imagesalakVektor) ;
    %% Implementasi pada Fungsi Diskriminan
    
    [gjx_salak]= GJ(miu,sigmah,n,x_barsalak); 
    %[gjv_salak,c_salak] = max(gjx_salak) ;%tinggal cari ara  min max nya dibisa 2
    [gjv_salak,c_salak1] = min(gjx_salak)
    %cDeteksi_salak = c_salak ; 
    cDeteksi_salak1 = c_salak1 ; 
    
    %cDeteksi_salak
    
    salakBaru1 = 'Bagus dengan kandungan vitamin yang masih utuh' ;
    salakLama1 = 'Kurang pedas dengan kandungan vitamin telah berkurang' ;
    salakNihil1 = 'Tidak Terdeteksi' ;
    
    if cDeteksi_salak1 == i 
        set(handles.hasil,'String', salakBaru1) ;
        ambilFoto = imread('salakbaru.jpg');
        set(handles.Identifikasi,'HandleVisibility','ON') ;
        set(handles.Input,'HandleVisibility','OFF') ;   
        imagesc(ambilFoto) ;
        set(handles.Identifikasi,'XTickLabel','','YTickLabel','');
        colormap(gray)
    else
         set(handles.hasil,'String', salakNihil1) ;
          set(handles.Identifikasi,'HandleVisibility','OFF') ;
         set(handles.Input,'HandleVisibility','OFF') ;  
    end
        cDeteksi_salak1
    clear 


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = get(handles.HasilMD,'string');
axes(handles.grafik);
eztplot(input);
set(handles.grafik,'XMinorTick','on');
grid on


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
Img = handles.cvt;
pixel_dist = 1;
GLCM = graycomatrix(Img,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
 
Contrast = stats.Contrast;
Correlation = stats.Correlation;
Energy = stats.Energy;
Homogeneity = stats.Homogeneity;
 
data = get(handles.uitable1,'Data');
data{1,1} = num2str(Contrast(1));
data{1,2} = num2str(Contrast(2));
data{1,3} = num2str(Contrast(3));
data{1,4} = num2str(Contrast(4));
data{1,5} = num2str(mean(Contrast));
 
data{2,1} = num2str(Correlation(1));
data{2,2} = num2str(Correlation(2));
data{2,3} = num2str(Correlation(3));
data{2,4} = num2str(Correlation(4));
data{2,5} = num2str(mean(Correlation));
 
data{3,1} = num2str(Energy(1));
data{3,2} = num2str(Energy(2));
data{3,3} = num2str(Energy(3));
data{3,4} = num2str(Energy(4));
data{3,5} = num2str(mean(Energy));
 
data{4,1} = num2str(Homogeneity(1));
data{4,2} = num2str(Homogeneity(2));
data{4,3} = num2str(Homogeneity(3));
data{4,4} = num2str(Homogeneity(4));
data{4,5} = num2str(mean(Homogeneity));
 
set(handles.uitable1,'Data',data,'ForegroundColor',[0 0 0])


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
Imgx = handles.Input;
val = get(hObject,'Value');
Grayscale = rgb2gray(Imgx);
imshow(Grayscale)
G1 = Grayscale(1,2,3);
axes(handles.cvt)
imshow(G1)


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
Img = handles.Img;
val = get(hObject,'Value');
set(handles.cvt,'HandleVisibility','ON') ;
set(handles.Identifikasi,'HandleVisibility','OFF') ;   
set(handles.Input,'HandleVisibility','OFF') ;

switch val
    case 1
        Grayscale = rgb2gray(Img);
        axes(handles.Input)
        imshow(Grayscale)
        G1 = Grayscale(:,:,1);
        axes(handles.cvt)
        imshow(G1)
    case 2
        Lab = rgb2lab(Img);
        axes(handles.Input)
        imshow(Lab)
        %G1 = Lab(:,:,3);
        axes(handles.cvt)
        %imshow(G1)
end

% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
untitled g3 = new untitled();
g3.Show();


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
 funcString = 'x.^2'; %-x.^2 lengkung bawah %x.^2 lengkung atas
 funcHandle = str2func(['@(x)' funcString]);
 x = linspace(0,21);
 y = funcHandle(x);


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
 funcString = '-x.^2'; %-x.^2 lengkung bawah %x.^2 lengkung atas
 funcHandle = str2func(['@(x)' funcString]);
 x = linspace(0,21);
 y = funcHandle(x);
 plot(handles.Identifikasi2,x,y,'--', 'LineWidth',2);



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t1 as text
%        str2double(get(hObject,'String')) returns contents of t1 as a double


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function t3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function t4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function t5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function t6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
