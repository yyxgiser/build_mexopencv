if exist dist\mexopencv (
   rmdir /s /q dist\mexopencv
)

mkdir dist\mexopencv

cd mexopencv
git checkout 3.4.11
cd ..

copy /y mexopencv_setup.m mexopencv
copy /Y dist\x64\vc16\bin\*dll mexopencv\lib
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "mex_compile; quit"
"C:\Program Files\MATLAB\R2020b\bin\matlab" -nodesktop -wait -sd . -r "cd mexopencv;mexopencv_setup;addpath('utils');MDoc('-clean'); MDoc; quit"

mkdir  dist\mexopencv\bin

xcopy dist\x64\vc16\bin\*.exe dist\mexopencv\bin\
xcopy mexopencv\*.m  mexopencv\README.markdown mexopencv\info.xml  dist\mexopencv\
xcopy mexopencv\+cv dist\mexopencv\+cv\
xcopy mexopencv\+mexopencv dist\mexopencv\+mexopencv\
xcopy mexopencv\doc dist\mexopencv\doc\
xcopy mexopencv\samples dist\mexopencv\samples\
xcopy mexopencv\test dist\mexopencv\test\
xcopy mexopencv\lib dist\mexopencv\lib\
