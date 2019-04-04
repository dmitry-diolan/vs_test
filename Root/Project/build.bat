echo off

set devenv="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe"
del build_output.log

%devenv% "Project.sln" /Rebuild "Release|x64" /out build_output.log
IF NOT %ERRORLEVEL% == 0 (
echo "Project Release|x64 Error"
goto error )
echo "Project Release|x64 OK"

%devenv% "Project.sln" /Rebuild "Release|x86" /out build_output.log
IF NOT %ERRORLEVEL% == 0 (
echo "Project Release|x86 Error"
goto error )
echo "Project Release|x86 OK"

:error

echo Finish