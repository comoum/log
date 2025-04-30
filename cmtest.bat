@echo off

set BUILD_DIR=build

if not exist %BUILD_DIR% (
    mkdir %BUILD_DIR%
) 

cd %BUILD_DIR%
@REM cmake -G "MinGW Makefiles" -DBUILD_TESTING=ON -DCMAKE_FIND_DEBUG_MODE=TRUE .. 
cmake -G "MinGW Makefiles" -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=. .. 
if %ERRORLEVEL% neq 0 (
    @echo cmake failed
    cd ..
    exit /b
)

cmake --build . --config Release
if %ERRORLEVEL% neq 0 (
    @echo build failed
    cd ..
    exit /b
)

cmake --install . --config Release
if %ERRORLEVEL% neq 0 (
    @echo install failed
    cd ..
    exit /b
)

cd ..

@echo build ok! 

echo.

@REM cd /d %~dp0
@REM %BUILD_DIR%\Release\log_test.exe
@REM echo.
