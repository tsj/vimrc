@echo off

copy vimrc %USERPROFILE%\_vimrc
xcopy vimfiles %USERPROFILE%\vimfiles /E /I

