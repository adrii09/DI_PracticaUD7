; ================================
; CONFIGURACIÓN GENERAL
; ================================

Name "MiApp"
OutFile "HolaApp.exe"
InstallDir "$PROGRAMFILES\MiApp"
RequestExecutionLevel admin

; Interfaz moderna
!include "MUI2.nsh"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "Spanish"

; ================================
; INSTALACIÓN
; ================================

Section "Instalar"

  SetOutPath $INSTDIR

  ; Copiar el JAR (ajusta el nombre)
  File "hola.jar"

  ; Crear acceso directo en escritorio
  CreateShortcut "$DESKTOP\MiApp.lnk" "javaw.exe" "-jar $INSTDIR\MiApp.jar"

  ; Crear acceso en menú inicio
  CreateDirectory "$SMPROGRAMS\MiApp"
  CreateShortcut "$SMPROGRAMS\MiApp\MiApp.lnk" "javaw.exe" "-jar $INSTDIR\MiApp.jar"

  ; Desinstalador
  WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; ================================
; DESINSTALACIÓN
; ================================

Section "Uninstall"

  Delete "$DESKTOP\MiApp.lnk"
  Delete "$SMPROGRAMS\MiApp\MiApp.lnk"
  RMDir "$SMPROGRAMS\MiApp"

  Delete "$INSTDIR\hola.jar"
  Delete "$INSTDIR\uninstall.exe"

  RMDir "$INSTDIR"

SectionEnd