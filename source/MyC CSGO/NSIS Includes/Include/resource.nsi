; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "resource"
!define APPNAMEANDVERSION "resource 1.0"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\resource"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "C:\Program Files (x86)\Venis\OutFile.exe"

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

Section "resource" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "Additional Files\Default_Steam\cstrike\resource\ClientScheme.res"
	File "Additional Files\Default_Steam\cstrike\resource\CreateMultiplayerGameGameplayPage.res"
	File "Additional Files\Default_Steam\cstrike\resource\CreateMultiplayerGameServerPage.res"
	File "Additional Files\Default_Steam\cstrike\resource\cstrike_english.txt"
	File "Additional Files\Default_Steam\cstrike\resource\GameMenu.res"
	File "Additional Files\Default_Steam\cstrike\resource\game_menu.tga"
	File "Additional Files\Default_Steam\cstrike\resource\game_menu_mouseover.tga"
	File "Additional Files\Default_Steam\cstrike\resource\logo_game.tga"
	File "Additional Files\Default_Steam\cstrike\resource\menu_hl_no_icon.tga"
	File "Additional Files\Default_Steam\cstrike\resource\OptionsSubMultiplayer.res"
	SetOutPath "$INSTDIR\background\"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_1_a_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_1_b_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_1_c_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_1_d_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_2_a_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_2_b_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_2_c_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_2_d_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_3_a_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_3_b_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_3_c_loading.tga"
	File "Additional Files\Default_Steam\cstrike\resource\background\800_3_d_loading.tga"
	SetOutPath "$INSTDIR\UI\"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BackgroundPanel.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BottomSpectator.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyEquipment.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyEquipment_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyEquipment_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyMachineguns_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyMachineguns_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyMenu.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyPistols_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyPistols_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyRifles_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyRifles_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyShotguns_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuyShotguns_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuySubMachineguns_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\BuySubMachineguns_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\Classmenu_CT.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\Classmenu_TER.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\diagonal.tga"
	File "Additional Files\Default_Steam\cstrike\resource\UI\MainBuyMenu.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\MOTD.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\ScoreBoard.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\Spectator.res"
	File "Additional Files\Default_Steam\cstrike\resource\UI\Teammenu.res"
	CreateDirectory "$SMPROGRAMS\resource"
	CreateShortCut "$SMPROGRAMS\resource\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	CreateShortCut "$SMPROGRAMS\resource\TxT.lnk" "$INSTDIR\cstrike_english.txt"

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
	Delete "$SMPROGRAMS\resource\Uninstall.lnk"
	Delete "$SMPROGRAMS\resource\TxT.lnk"

	; Clean up resource
	Delete "$INSTDIR\ClientScheme.res"
	Delete "$INSTDIR\CreateMultiplayerGameGameplayPage.res"
	Delete "$INSTDIR\CreateMultiplayerGameServerPage.res"
	Delete "$INSTDIR\cstrike_english.txt"
	Delete "$INSTDIR\GameMenu.res"
	Delete "$INSTDIR\game_menu.tga"
	Delete "$INSTDIR\game_menu_mouseover.tga"
	Delete "$INSTDIR\logo_game.tga"
	Delete "$INSTDIR\menu_hl_no_icon.tga"
	Delete "$INSTDIR\OptionsSubMultiplayer.res"
	Delete "$INSTDIR\background\800_1_a_loading.tga"
	Delete "$INSTDIR\background\800_1_b_loading.tga"
	Delete "$INSTDIR\background\800_1_c_loading.tga"
	Delete "$INSTDIR\background\800_1_d_loading.tga"
	Delete "$INSTDIR\background\800_2_a_loading.tga"
	Delete "$INSTDIR\background\800_2_b_loading.tga"
	Delete "$INSTDIR\background\800_2_c_loading.tga"
	Delete "$INSTDIR\background\800_2_d_loading.tga"
	Delete "$INSTDIR\background\800_3_a_loading.tga"
	Delete "$INSTDIR\background\800_3_b_loading.tga"
	Delete "$INSTDIR\background\800_3_c_loading.tga"
	Delete "$INSTDIR\background\800_3_d_loading.tga"
	Delete "$INSTDIR\UI\BackgroundPanel.res"
	Delete "$INSTDIR\UI\BottomSpectator.res"
	Delete "$INSTDIR\UI\BuyEquipment.res"
	Delete "$INSTDIR\UI\BuyEquipment_CT.res"
	Delete "$INSTDIR\UI\BuyEquipment_TER.res"
	Delete "$INSTDIR\UI\BuyMachineguns_CT.res"
	Delete "$INSTDIR\UI\BuyMachineguns_TER.res"
	Delete "$INSTDIR\UI\BuyMenu.res"
	Delete "$INSTDIR\UI\BuyPistols_CT.res"
	Delete "$INSTDIR\UI\BuyPistols_TER.res"
	Delete "$INSTDIR\UI\BuyRifles_CT.res"
	Delete "$INSTDIR\UI\BuyRifles_TER.res"
	Delete "$INSTDIR\UI\BuyShotguns_CT.res"
	Delete "$INSTDIR\UI\BuyShotguns_TER.res"
	Delete "$INSTDIR\UI\BuySubMachineguns_CT.res"
	Delete "$INSTDIR\UI\BuySubMachineguns_TER.res"
	Delete "$INSTDIR\UI\Classmenu_CT.res"
	Delete "$INSTDIR\UI\Classmenu_TER.res"
	Delete "$INSTDIR\UI\diagonal.tga"
	Delete "$INSTDIR\UI\MainBuyMenu.res"
	Delete "$INSTDIR\UI\MOTD.res"
	Delete "$INSTDIR\UI\ScoreBoard.res"
	Delete "$INSTDIR\UI\Spectator.res"
	Delete "$INSTDIR\UI\Teammenu.res"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\resource"
	RMDir "$INSTDIR\UI\"
	RMDir "$INSTDIR\background\"
	RMDir "$INSTDIR\"

SectionEnd

; eof