%% Selma BOUDISSA 
% Autonomous Robotic
% MSCV 1
% Project: Maltlab Toolbox
% Date: 07/05/2018





function varargout = toolbox(varargin)
% TOOLBOX MATLAB code for toolbox.fig
%      TOOLBOX, by itself, creates a new TOOLBOX or raises the existing
%      singleton*.
%
%      H = TOOLBOX returns the handle to a new TOOLBOX or the handle to
%      the existing singleton*.
%
%      TOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOLBOX.M with the given input arguments.
%
%      TOOLBOX('Property','Value',...) creates a new TOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before toolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to toolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help toolbox

% Last Modified by GUIDE v2.5 22-Apr-2018 23:02:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @toolbox_OpeningFcn, ...
                   'gui_OutputFcn',  @toolbox_OutputFcn, ...
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


% --- Executes just before toolbox is made visible.
function toolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to toolbox (see VARARGIN)

% Choose default command line output for toolbox
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes toolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = toolbox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Load the output image

I = imread('cameraman.tif');
%image=imread(I);
axes(handles.axes1);
%Display
imshow(I);




% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uiputfile({'.jpg;.jpeg;*.png','Images (.jpg,.jpeg,*.png)'},'');
if length(PathName) > 1 && length(FileName) > 1
    path = strcat(PathName ,FileName);
    img = getimage(handles.axes2);
    if isempty(img)
        handles.txt.String = 'Nothing to save yet';
    else
    imwrite(img,path)
    handles.txt.String = strcat('Result saved at ',path);
    end
end
        
name=fullfile(PathName,FileName);
imwrite(img,name)

% --- Executes on button press in SaltPepper.
function SaltPepper_Callback(hObject, eventdata, handles)
% hObject    handle to SaltPepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Display
I = imread('cameraman.tif');
SP = imnoise(I,'salt & pepper');
axes(handles.axes2);
%Display
imshow(uint8(SP));


% --- Executes on button press in ROI.
function ROI_Callback(hObject, eventdata, handles)
% hObject    handle to ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I = imread('cameraman.tif');
%usage of roipoly matlab function
ROI= roipoly(I);

% --- Executes on button press in Dilate.
function Dilate_Callback(hObject, eventdata, handles)
% hObject    handle to Dilate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Dilate pushbutton

I = imread('cameraman.tif');

% create a vertical  line shaped structuring element.
se = strel('line',11,90);

% Dilate function
D = imdilate(I,se);

% Display 
axes(handles.axes2);
imshow(D) 

% --- Executes on button press in Colorspace.
function Colorspace_Callback(hObject, eventdata, handles)
% hObject    handle to Colorspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Compute.
function Compute_Callback(hObject, eventdata, handles)
% hObject    handle to Compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Compute the histogram
I = imread('cameraman.tif');

figure()
imhist(I)
title('Computed histogram')


% --- Executes on button press in Equalize.
function Equalize_Callback(hObject, eventdata, handles)
% hObject    handle to Equalize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Equalize the histogram

I = imread('cameraman.tif');
E= histeq(I); % histogram equalization
figure()
imhist(E);
title('Equalized histogram')


% --- Executes on button press in Blur.
function Blur_Callback(hObject, eventdata, handles)
% hObject    handle to Blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Compute the integral image
I = imread('cameraman.tif');
intImage = integralImage(I);

% apply filter
avgH = integralKernel([1 1 7 7], 1/49);
J = integralFilter(intImage, avgH);

%display
J = uint8(J);
axes(handles.axes2);
imshow(J);

% --- Executes on button press in Laplace.
function Laplace_Callback(hObject, eventdata, handles)
% hObject    handle to Laplace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Laplace operator
I = imread('cameraman.tif');
L = del2(I); % laplace operator 
%display
axes(handles.axes2);
imshow(L);



% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% read the image
I = imread('cameraman.tif');

% Sobel function 

S = edge(I,'sobel');

%display 
axes(handles.axes2);
imshow(S);

% --- Executes on button press in Erode.
function Erode_Callback(hObject, eventdata, handles)
% hObject    handle to Erode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Erode pushbutton

I = imread('cameraman.tif');

% create a vertical  line shaped structuring element.
se = strel('line',11,90);

% Erode function
E = imerode(I,se);

% Display 
axes(handles.axes2);
imshow(E)

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close pushbutton

I = imread('cameraman.tif');

% create a vertical  line shaped structuring element.
se = strel('line',11,90);

% Close function
C = imclose(I,se);

% Display 
axes(handles.axes2);
imshow(C)

% --- Executes on button press in Open.
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Open pushbutton

I = imread('cameraman.tif');

% create a vertical  line shaped structuring element.
se = strel('line',11,90);

% Open function
O = imopen(I,se);

% Display 
axes(handles.axes2);
imshow(O)


% --- Executes on button press in Canny.
function Canny_Callback(hObject, eventdata, handles)
% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% read the image
I = imread('cameraman.tif');

% canny function 

C = edge(I,'canny');

%display 
axes(handles.axes2);
imshow(C);


% --- Executes on button press in HoughTransf.
function HoughTransf_Callback(hObject, eventdata, handles)
% hObject    handle to HoughTransf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hough transform
% found line and circle
 I = imread('coins.png');
% HI = edge(I,'canny');
% [H,T,R]=hough(HI,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
% 
% %display
% axes(handles.axes2);
% imshow(imadjust(mat2gray(H)));


% found circle
centers = imfindcircles(I,[15 30]);
%centersStrong5 = centers(1:5,:);
%viscircles(centersStrong5,'EdgeColor','b');

axes(handles.axes2);
imshow(centers);


% --- Executes on button press in CountourDraw.
function CountourDraw_Callback(hObject, eventdata, handles)
% hObject    handle to CountourDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
