REM build onionshare.exe
pyinstaller install\pyinstaller.spec -y

REM sign onionshare.exe
REM signtool.exe sign /v /d "OnionShare" /a /tr http://timestamp.globalsign.com/scripts/timstamp.dll /fd sha256 build\exe.win32-3.5\onionshare.exe

REM build an installer, dist\OnionShare_Setup.exe
cd build
candle.exe -out OnionShare.wixobj ..\install\OnionShare.wxs
light.exe -b ..\dist\onionshare -out ..\dist\OnionShare.msi OnionShare.wixobj
cd ..

REM sign OnionShare.msi
REM signtool.exe sign /v /d "OnionShare" /a /tr http://timestamp.globalsign.com/scripts/timstamp.dll /fd sha256 dist\OnionShare.msi
