@echo off
echo This dashboard refreshes through GitHub Actions using the SharePoint Excel link stored in the FLOORPLAN_XLSX_URL repository secret.
echo.
where gh >nul 2>nul
if errorlevel 1 (
  echo GitHub CLI is not installed on this computer.
  echo Open GitHub, go to Actions, choose "Refresh dashboard from SharePoint Excel", and click "Run workflow".
  pause
  exit /b 1
)

gh workflow run refresh-dashboard.yml
echo.
echo Refresh requested. Check the GitHub Actions page for progress.
pause
