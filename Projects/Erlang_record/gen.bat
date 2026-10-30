set WORKSPACE=..\..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=%WORKSPACE%\DataTables

rem Luban.dll 目标框架为 net8.0，本机只装有更高版本运行时（如 .NET 10）时需要此变量
set DOTNET_ROLL_FORWARD=Major

dotnet %LUBAN_DLL% ^
    -t all ^
    -c erlang-record ^
    -d erlang ^
    --conf %CONF_ROOT%\luban.conf ^
    -x outputCodeDir=Gen\include ^
    -x outputDataDir=Gen\src ^
    -x pathValidator.rootDir=%WORKSPACE%\Projects\Csharp_Unity_bin ^
    -x l10n.provider=default ^
    -x "l10n.textFile.path=*@%WORKSPACE%\DataTables\Data\l10n\texts.json" ^
    -x l10n.textFile.keyFieldName=key


pause
