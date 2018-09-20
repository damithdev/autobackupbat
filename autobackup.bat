ECHO OFF
set source=D:\application\
set source2=C:\configfiles\
set destination=D:\Backup-myApplication\

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFILENAME=%CUR_YYYY%.%CUR_MM%.%CUR_DD%-%CUR_HH%~%CUR_NN%~%CUR_SS%

if exist %destination% goto GO
:GO
mkdir %destination%%SUBFILENAME%\application
mkdir %destination%%SUBFILENAME%\configfiles
xcopy %source%* %destination%%SUBFILENAME%\application /s/d/y/c/v/r
xcopy %source2%* %destination%%SUBFILENAME%\configfiles /s/d/y/c/v/r
echo. 
echo Finished copying %source% to %destination%
echo Finished copying %source2% to %destination%
echo.
echo Created %destination%%SUBFILENAME%
exit