@echo off
echo ==========================================
echo      AQI Monitor - Startup Script
echo ==========================================

echo.
echo [1/3] Checking for conflicting processes on port 8080...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8080" ^| find "LISTENING"') do (
    echo Found blocking process PID: %%a
    taskkill /F /PID %%a
    echo Process terminated.
)

echo.
echo [2/3] Cleaning previous builds...
call mvn clean

echo.
echo [3/3] Starting Backend & Frontend (Unified)...
echo This may take a minute. The dashboard will be available at http://localhost:8080
echo.

call mvn spring-boot:run -DskipTests "-Dspring-boot.run.jvmArguments=-Xmx4g"

pause
