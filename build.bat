
set AndroidProject=D:\AndroidProject\E-Ink-Launcher

rd /s /q build
mkdir build
#SET CGO_ENABLED=1
SET GOARCH=amd64
SET GOOS=windows
go build -ldflags="-w -s"
move /y fillRam.exe build\fillRam.exe
SET GOARCH=386
go build -ldflags="-w -s"
move /y fillRam.exe build\fillRam-i386.exe
SET CGO_ENABLED=0
SET GOOS=linux
go build -ldflags="-w -s"
@REM mkdir %AndroidProject%\app\libs\x86
@REM copy /y fillRam %AndroidProject%\app\libs\x86\libfillRam.so
move /y fillRam build\fillRam-linux-i386
SET GOARCH=amd64
go build -ldflags="-w -s"
move /y fillRam build\fillRam-linux
SET GOARCH=arm
go build -ldflags="-w -s"
mkdir %AndroidProject%\app\libs\armeabi
copy /y  fillRam %AndroidProject%\app\libs\armeabi\libfillRam.so
move /y fillRam build\fillRam-linux-arm
SET GOARCH=mips
go build -ldflags="-w -s"
move /y fillRam build\fillRam-linux-mips
SET GOARCH=arm64
go build -ldflags="-w -s"
mkdir %AndroidProject%\app\libs\arm64-v8a
copy /y  fillRam %AndroidProject%\app\libs\arm64-v8a\libfillRam.so
move /y fillRam build\fillRam-linux-arm64
SET GOOS=darwin
go build -ldflags="-w -s"
move /y fillRam build\fillRam-darwin-arm64
SET GOARCH=amd64
go build -ldflags="-w -s"
move /y fillRam build\fillRam-darwin