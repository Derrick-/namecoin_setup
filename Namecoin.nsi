; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Namecoin"
!define APPNAMEANDVERSION "Namecoin 00.03.72"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\Namecoin"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "NamecoinSetup0372.exe"

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "$INSTDIR\namecoin-qt.exe"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "COPYING.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

Section "Namecoin" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "bin.00.03.72\libgcc_s_dw2-1.dll"
	File "bin.00.03.72\libstdc++-6.dll"
	File "bin.00.03.72\mingwm10.dll"
	File "bin.00.03.72\namecoin-qt.exe"
	File "bin.00.03.72\namecoind.exe"
	File "bin.00.03.72\qrc_bitcoin.cpp"
	File "bin.00.03.72\QtCore4.dll"
	File "bin.00.03.72\QtGui4.dll"
	File "bin.00.03.72\QtNetwork4.dll"
	File "COPYING.txt"
	File "README_md.txt"
	CreateShortCut "$DESKTOP\Namecoin.lnk" "$INSTDIR\namecoin-qt.exe"
	CreateDirectory "$SMPROGRAMS\Namecoin"
	CreateShortCut "$SMPROGRAMS\Namecoin\Namecoin.lnk" "$INSTDIR\namecoin-qt.exe"
	CreateShortCut "$SMPROGRAMS\Namecoin\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	CreateShortCut "$SMSTARTUP\Namecoin.lnk" "$INSTDIR\namecoin-qt.exe" "-min"

	WriteRegStr HKCU "Software\Namecoin\Namecoin-Qt" "fMinimizeToTray" "true"
	WriteRegStr HKCU "Software\Namecoin\Namecoin-Qt" "fMinimizeOnClose" "true"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} ""
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Namecoin.lnk"
	Delete "$SMPROGRAMS\Namecoin\Namecoin.lnk"
	Delete "$SMPROGRAMS\Namecoin\Uninstall.lnk"
	Delete "$SMSTARTUP\Namecoin.lnk"

	; Clean up Namecoin
	Delete "$INSTDIR\libgcc_s_dw2-1.dll"
	Delete "$INSTDIR\libstdc++-6.dll"
	Delete "$INSTDIR\mingwm10.dll"
	Delete "$INSTDIR\namecoin-qt.exe"
	Delete "$INSTDIR\namecoind.exe"
	Delete "$INSTDIR\qrc_bitcoin.cpp"
	Delete "$INSTDIR\QtCore4.dll"
	Delete "$INSTDIR\QtGui4.dll"
	Delete "$INSTDIR\QtNetwork4.dll"
	Delete "$INSTDIR\COPYING.txt"
	Delete "$INSTDIR\README_md.txt"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\Namecoin"
	RMDir "$INSTDIR\"

SectionEnd

BrandingText "Setup published by THE BEASTLICK INTERNET POLICY COMMISSION"

; eof