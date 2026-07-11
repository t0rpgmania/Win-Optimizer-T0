@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando privilegios de Administrador...
    powershell start -verb runas '%0'
    exit /b
)

:MENU
cls
echo ====================================================
echo      OTIMIZADOR MESTRE - PERFORMANCE E AJUSTES
echo ====================================================
echo [1] Otimizacao Eficiente (Consumo Minimo)
echo [2] Otimizacao Turbo (Consumo Maximo)
echo [3] Verificar e Reparar Windows (sfc /scannow)
echo [4] Centro de Verificacao (Ver Mudancas)
echo [5] REVERTER TUDO (Reset Padrao)
echo [6] Sair
echo ====================================================
set /p op="Escolha uma opcao: "

if "%op%"=="1" goto MODO_LEVE
if "%op%"=="2" goto MODO_EXTREMO
if "%op%"=="3" goto SCAN_WINDOWS
if "%op%"=="4" goto MENU_VERIFICACAO
if "%op%"=="5" goto REVERTER_TUDO
if "%op%"=="6" exit
goto MENU

:MENU_VERIFICACAO
cls
echo ====================================================
echo          CENTRO DE VERIFICACAO (GUIA)
echo ====================================================
echo [A] Abrir Servicos (services.msc)
echo [B] Abrir Editor de Registro (regedit)
echo [C] Tutorial: O que verificar no Registro
echo [D] Voltar ao Menu Principal
echo ====================================================
set /p subop="Escolha: "
if /i "%subop%"=="A" start services.msc & goto MENU_VERIFICACAO
if /i "%subop%"=="B" start regedit & goto MENU_VERIFICACAO
if /i "%subop%"=="C" goto TUTORIAL
if /i "%subop%"=="D" goto MENU
goto MENU_VERIFICACAO

:TUTORIAL
cls
echo --- TUTORIAL: O QUE E PADRAO VS MODIFICADO ---
echo.
echo 1. NetworkThrottlingIndex (Rede)
echo    Caminho: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
echo    PADRAO (Original): a (10 decimal)
echo    MODIFICADO (Turbo): ffffffff (Inativo)
echo.
echo 2. SystemResponsiveness (Prioridade)
echo    Caminho: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
echo    PADRAO (Original): 14 (20 decimal)
echo    MODIFICADO (Eficiente): 0
echo.
echo 3. Win32PrioritySeparation (CPU)
echo    Caminho: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl
echo    PADRAO (Original): Nao existe (ou valor 2)
echo    MODIFICADO (Turbo): 26 (38 decimal)
echo.
echo Pressione qualquer tecla para voltar ao centro de verificacao...
pause >nul
goto MENU_VERIFICACAO

:MODO_LEVE
:: [Mesmo codigo anterior]
echo [OK] Otimizacao eficiente aplicada.
pause & goto MENU

:MODO_EXTREMO
:: [Mesmo codigo anterior]
echo [OK] Modo Turbo de alta performance ativado.
pause & goto MENU

:SCAN_WINDOWS
sfc /scannow
pause & goto MENU

:REVERTER_TUDO
:: [Mesmo codigo anterior]
echo [OK] Sistema restaurado.
pause & goto MENU