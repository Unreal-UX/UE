set EnginePath=%~dp0/
setlocal
pushd "%~dp0"
git status
git submodule init
git submodule update
git lfs install
cd ./UnrealEngine/
call setup.bat --force 
call GenerateProjectFiles.bat
rem ./Engine/Build/BatchFiles/Build.bat Unreal Win64 Development "$(Build.SourcesDirectory)/Working/Unreal_Examples/Unreal.uproject" -WaitMutex -FromMsBuild 
