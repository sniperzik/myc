;Enable Unicode encoding #CSGO
Unicode True

; Include
!include "Sections.nsh"
!include "LogicLib.nsh"
!include "Registry.nsh"
!include "StrRep.nsh"

; Backup & Restore Macros
!macro BackupFile FILE_DIR FILE BACKUP_TO
 IfFileExists "${BACKUP_TO}\*.*" +2
  CreateDirectory "${BACKUP_TO}"
 IfFileExists "${FILE_DIR}\${FILE}" 0 +2
  Rename "${FILE_DIR}\${FILE}" "${BACKUP_TO}\${FILE}"
!macroend
!macro RestoreFile BUP_DIR FILE RESTORE_TO
 IfFileExists "${BUP_DIR}\${FILE}" 0 +2
  Rename "${BUP_DIR}\${FILE}" "${RESTORE_TO}\${FILE}"
!macroend

; Initialization
!define MUI_ICON "7z Installer Files\install.ico"
!define MUI_UNICON "7z Installer Files\uninstall.ico"
!define MUI_HEADERIMAGE "Images\install_header_2.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "Images\myc_install_left_3.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "Images\myc_install_left_3.bmp"
!define MUI_COMPONENTSPAGE_CHECKBITMAP "Images\simple-round2.bmp"

; GetSize	Add remove program entry
!define ARP "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
!include "FileFunc.nsh"

; Define your application name
!define APPVERS "1.0.0.8" ; VERSION 
!define APPNAME "MyC CSGO"
!define APPGAME "CSGO" ; To Use for all files. ${APPGAME}
!define APPNAMEANDVERSION "${APPNAME} v${APPVERS}"
!define APPYEAR "© 2020"
!define APPWEB "MyC.Lv"
!define APPAUTHOR "Sn^"
!define APPPUBLISHER "MyC Project"
!define APPSIZE "1550" ; 1,55 MB (1 634 304 bytes) MB : Bytes (45.1 x 1024 Bytes = 46182.4) ~ 2 415 333 Bytes

VIProductVersion "1.0.0.8" ; Ex. 1.0.0.0 VERSION - No Spaces!!!
VIAddVersionKey "ProductName" "${APPNAME}"
VIAddVersionKey "Comments" ""
VIAddVersionKey "CompanyName" "${APPWEB} ${APPYEAR} by ${APPAUTHOR}"
VIAddVersionKey "LegalTrademarks" ""
VIAddVersionKey "LegalCopyright" "${APPWEB} ${APPYEAR} by ${APPAUTHOR}"
VIAddVersionKey "FileDescription" "${APPNAME} v${APPVERS}"
VIAddVersionKey "FileVersion" "${APPVERS}"

CRCCheck on
SetCompressor /SOLID lzma

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "MyC_${APPGAME}_Backups\MyC_${APPGAME}_v${APPVERS}.exe"
Icon "7z Installer Files\install.ico"
UninstallIcon "7z Installer Files\uninstall.ico"

; Request application privileges for Windows Vista
RequestExecutionLevel Admin ;User

!addplugindir "."

; Modern interface settings
!include "MUI2.nsh"

; Show Install Details
ShowInstDetails show

;Include Extra Pages
;!include "MUI_README.nsh"
;!include "MUI_CHANGELOG.nsh"

!define MUI_ABORTWARNING
!define MUI_COMPONENTSPAGE_NODESC
!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit ; Aero

!insertmacro MUI_PAGE_WELCOME ;## NSIS 3.0+ Broken Macros
!insertmacro MUI_PAGE_LICENSE "7z Installer Files\MyC_${APPGAME}_License.txt"
;!insertmacro MUI_PAGE_README "7z Installer Files\MyC_${APPGAME}_Readme.txt"
;!insertmacro MUI_PAGE_CHANGELOG "7z Installer Files\MyC_${APPGAME}_ChangeLog.log"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
	;!define MUI_FINISHPAGE_NOAUTOCLOSE
    !define MUI_FINISHPAGE_RUN
    !define MUI_FINISHPAGE_RUN_NOTCHECKED
    !define MUI_FINISHPAGE_RUN_TEXT "Launch MyC ${APPGAME} Cleaner"
    !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchLink"
	!define MUI_FINISHPAGE_SHOWREADME ""
	!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
	!define MUI_FINISHPAGE_SHOWREADME_TEXT "Show Readme"
	!define MUI_FINISHPAGE_SHOWREADME_FUNCTION "RShortCuts"
!insertmacro MUI_PAGE_FINISH ;## NSIS 3.0+ Broken Macros

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language) after any MUI_PAGE_* lines.
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

Section "MyC Config Core" Section1

	##########################
	# Backup old copy
	##########################
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\" "autoexec.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\"
	; MyC CFG Engine User
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\" "Engine_User.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\"
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\" "Engine_MyC_Default.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\"
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\" "MainConfig.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\"
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\" "Weapon_Alias_list.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\"
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\" "Engine_EB.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\"
	!insertmacro BackupFile "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\" "MYC_Alias.cfg" "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\"
	; Clean Lens
	;!insertmacro BackupFile "$INSTDIR\csgo\materials\overlays\" "scope_lenz.vmt" "$INSTDIR\MyC_Backup\csgo\materials\overlays\"
	;!insertmacro BackupFile "$INSTDIR\csgo\materials\overlays\" "scope_lenz.vtf" "$INSTDIR\MyC_Backup\csgo\materials\overlays\"

	##########################
	# Backup old copy * End
	##########################

	; Delete Files To Install new ones
	##########################
	; Clean up MyC Config Core
	Delete "$INSTDIR\MyC_${APPGAME}_License.txt"
	Delete "$INSTDIR\MyC_${APPGAME}_ChangeLog.log"
	Delete "$INSTDIR\MyC_${APPGAME}_Readme.txt"
	Delete "$INSTDIR\SetLaunchOptions.txt"
	Delete "$INSTDIR\install.ico"
	Delete "$INSTDIR\uninstall.ico"
	Delete "$INSTDIR\MyC_Cleaner.dat"
	Delete "$INSTDIR\MyC_Cleaner.exe"
	Delete "$INSTDIR\MyC_Cleaner_ChangeLog.log"
	Delete "$INSTDIR\MyC_Updater.exe"
	Delete "$INSTDIR\MyC_Updater.ini"
	Delete "$INSTDIR\csgo\cfg\autoexec.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Engine_User.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Engine_MyC_Default.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\MainConfig.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Weapon_Alias_list.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\Engine_EB.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\MYC_Alias.cfg"
	; Clean Lens
	;Delete "$INSTDIR\csgo\materials\overlays\scope_lenz.vmt"
	;Delete "$INSTDIR\csgo\materials\overlays\scope_lenz.vtf"


	##########################
	# Install new copy
	##########################

	; Set Section properties
	SectionIn RO
	SetOverwrite on

	; Set Section Files and Shortcuts : Installer Files
	SetOutPath "$INSTDIR\"
	File "7z Installer Files\MyC_Core_01.7z"
	; Nsis7z::Extract "MyC_Core_01.7z"
	Nsis7z::ExtractWithDetails "MyC_Core_01.7z" "Installing package %s..."
	Delete "$INSTDIR\MyC_Core_01.7z"

	; overlay : Clean lens scope
	;SetOutPath "$INSTDIR\"
	;File "Additional Files\Clean lens\Clean lens.7z"
	;Nsis7z::ExtractWithDetails "Clean lens.7z" "Installing package %s..."
	;Delete "$INSTDIR\Clean lens.7z"

	; Extract Resource to Later Use it if Resource Files do not Exist
	;SetOutPath "$INSTDIR\MyC_Extra"
	;File "Additional Files\Default_Steam\resource.7z"
	;Nsis7z::ExtractWithDetails "resource.7z" "Installing package %s..."
	;Delete "$INSTDIR\MyC_Extra\resource.7z"	

	; Extract Background to Later Use it if Background Files do not Exist
	;SetOutPath "$INSTDIR\MyC_Extra"
	;File "Additional Files\Default_Steam\background.7z"
	;Nsis7z::ExtractWithDetails "background.7z" "Installing package %s..."
	;Delete "$INSTDIR\MyC_Extra\background.7z"

	; Install Logos & Media To Later Delete : Default
	;SetOutPath "$INSTDIR\"
	;File "Additional Files\Default\MyC_Core_03.7z"
	;Nsis7z::ExtractWithDetails "MyC_Core_03.7z" "Installing package %s..."
	;Delete "$INSTDIR\MyC_Core_03.7z"

	; Install Logos & Media To Later Delete : Default
	;SetOutPath "$INSTDIR\valve\logos\"
	;File "Additional Files\Default\valve\logos\8ball1.bmp"
	;File "Additional Files\Default\valve\logos\camp1.bmp"
	;File "Additional Files\Default\valve\logos\chuckskull.bmp"
	;File "Additional Files\Default\valve\logos\gun1.bmp"
	;File "Additional Files\Default\valve\logos\skull.bmp"
	;File "Additional Files\Default\valve\logos\splatt.bmp"
	;File "Additional Files\Default\valve\logos\v_1.bmp"
	;File "Additional Files\Default\valve\logos\andre.bmp"
	;File "Additional Files\Default\valve\logos\chick1.bmp"
	;File "Additional Files\Default\valve\logos\devl1.bmp"
	;File "Additional Files\Default\valve\logos\lambda.bmp"
	;File "Additional Files\Default\valve\logos\smiley.bmp"
	;File "Additional Files\Default\valve\logos\tiki.bmp"
	;SetOutPath "$INSTDIR\cstrike\logos\"
	;File "Additional Files\Default\cstrike\logos\remapped.bmp"
	;SetOutPath "$INSTDIR\cstrike\media\"
	;File "Additional Files\Default\cstrike\media\gamestartup.mp3"

SectionEnd

;SectionGroup /e "Choose Player Models:" sg1
;Section "CS1.6 / Non-Steam" Section2

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : Non-Steam Player Models
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\CS1.6 Non-Steam Player Models\CS1.6 Non-Steam Player Models.7z"
;	Nsis7z::ExtractWithDetails "CS1.6 Non-Steam Player Models.7z" "Installing package %s..."
;	Delete "$INSTDIR\CS1.6 Non-Steam Player Models.7z"

;SectionEnd

;Section /o "CZ / Steam" Section3

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : CZ / Steam Player Models
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\CZ_Steam Player Models\CZ_Steam Player Models.7z"
;	Nsis7z::ExtractWithDetails "CZ_Steam Player Models.7z" "Installing package %s..."
;	Delete "$INSTDIR\CZ_Steam Player Models.7z"

;SectionEnd

;Section /o "ESL.TV (Illegal)" Section4

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : ESL.TV (Illegal) Player Models
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\ESL.TV Player Models\ESL.TV Player Models.7z"
;	Nsis7z::ExtractWithDetails "ESL.TV Player Models.7z" "Installing package %s..."
;	Delete "$INSTDIR\ESL.TV Player Models.7z"

;SectionEnd
;SectionGroupEnd

;Section "HLTV (Weapon Models)" Section5

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : HLTV (Weapon Models)
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\HLTV Weapon Models\HLTV Weapon Models.7z"
;	Nsis7z::ExtractWithDetails "HLTV Weapon Models.7z" "Installing package %s..."
;	Delete "$INSTDIR\HLTV Weapon Models.7z"

;SectionEnd

;Section "Blue Shot Sprites" Section6

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : Blue Shot Sprites
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\Blue Shot\Blue Shot.7z"
;	Nsis7z::ExtractWithDetails "Blue Shot.7z" "Installing package %s..."
;	Delete "$INSTDIR\Blue Shot.7z"

;SectionEnd

;Section "MyC v3 Background" Section7

	##########################
	# Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : MyC v3 Background
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\MyC v3 Bg\MyC v3 Bg.7z"
;	Nsis7z::ExtractWithDetails "MyC v3 Bg.7z" "Installing package %s..."
;	Delete "$INSTDIR\MyC v3 Bg.7z"

;SectionEnd

;Section "Transparent Menus" Section8

	##########################
	#Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : Transparent Menus
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\Transparent Menus\Transparent Menus.7z"
;	Nsis7z::ExtractWithDetails "Transparent Menus.7z" "Installing package %s..."
;	Delete "$INSTDIR\Transparent Menus.7z"

;SectionEnd

;Section "Black Sky" Section9

	##########################
	#Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; Set Section Files and Shortcuts : Black Sky
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\High FPS Pack v1\Black Sky.7z"
;	Nsis7z::ExtractWithDetails "Black Sky.7z" "Installing package %s..."
;	Delete "$INSTDIR\Black Sky.7z"

;SectionEnd

;Section "Clean scope lens (AWP/Scout)" Section10

	##########################
	#Install new copy
	##########################

	; Set Section properties
;	SetOverwrite on

	; overlay : Clean lens scope
;	SetOutPath "$INSTDIR\"
;	File "Additional Files\Clean lens\Clean lens.7z"
;	Nsis7z::ExtractWithDetails "Clean lens.7z" "Installing package %s..."
;	Delete "$INSTDIR\Clean lens.7z"

;SectionEnd

Section -FinishSection

	; Delete Logos, Media to FIX CS1.6 spray, etc.

	; Delete Logos & Media
;	Delete "$INSTDIR\valve\logos\8ball1.bmp"
;	Delete "$INSTDIR\valve\logos\camp1.bmp"
;	Delete "$INSTDIR\valve\logos\chuckskull.bmp"
;	Delete "$INSTDIR\valve\logos\gun1.bmp"
;	Delete "$INSTDIR\valve\logos\skull.bmp"
;	Delete "$INSTDIR\valve\logos\splatt.bmp"
;	Delete "$INSTDIR\valve\logos\v_1.bmp"
;	Delete "$INSTDIR\valve\logos\andre.bmp"
;	Delete "$INSTDIR\valve\logos\chick1.bmp"
;	Delete "$INSTDIR\valve\logos\devl1.bmp"
;	Delete "$INSTDIR\valve\logos\lambda.bmp"
;	Delete "$INSTDIR\valve\logos\smiley.bmp"
;	Delete "$INSTDIR\valve\logos\tiki.bmp"
;	Delete "$INSTDIR\cstrike\logos\remapped.bmp"
;	Delete "$INSTDIR\cstrike\media\gamestartup.mp3"

	; Create ShortCuts
	SetOutPath $INSTDIR
	CreateShortCut "$DESKTOP\MyC ${APPGAME} Cleaner.lnk" "$INSTDIR\MyC_Cleaner.exe" \
	"" "$INSTDIR\MyC_Cleaner.exe" 0 
	CreateShortCut "$DESKTOP\MyC ${APPGAME} Updater.lnk" "$INSTDIR\MyC_Updater.exe" \
	"" "$INSTDIR\MyC_Updater.exe" 0 
	; CreateShortCut "$DESKTOP\Readme.lnk" "$INSTDIR\MyC_CSGO_Readme.txt"
	;SetOutPath $INSTDIR
	;CreateShortCut "$SMPROGRAMS\${APPNAME}\MyC Cleaner.lnk" "$INSTDIR\MyC_Cleaner.exe"
	;"" "$INSTDIR\MyC_Cleaner.exe" 0 
	;CreateShortCut "$SMPROGRAMS\${APPNAME}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"

	; Create RegKeys
	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	; # RegKey Information
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "InstallLocation" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayIcon" "$INSTDIR\install.ico"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "InstallLocation" ""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Publisher" "${APPPUBLISHER}"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "ModifyPath" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "InstallSource" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "ProductID" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Readme" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "RegOwner" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "RegCompany" ""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "HelpLink" "http://www.myc.lv"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "HelpTelephone" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLUpdateInfo" ""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLInfoAbout" ""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayVersion" "${APPVERS}"
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMajor" ""
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMinor" ""
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoModify" ""
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoRepair" ""
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "EstimatedSize" "${APPSIZE}"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Comments" ""
	WriteUninstaller "$INSTDIR\Uninstall.exe"
	
	; Run MyC execWrite to config.cfg 
	;ExecWait "$INSTDIR\MyC_execWrite.exe"
	;Delete "$INSTDIR\MyC_execWrite.exe"

SectionEnd

; Modern install component descriptions
;!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section2} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section3} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section4} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section5} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section6} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section7} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section8} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section9} ""
;	!insertmacro MUI_DESCRIPTION_TEXT ${Section10} ""
;!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	; Delete self
	Delete "$INSTDIR\Uninstall.exe"

	; Clean up MyC Config Core
	Delete "$INSTDIR\MyC_${APPGAME}_License.txt"
	Delete "$INSTDIR\MyC_${APPGAME}_ChangeLog.log"
	Delete "$INSTDIR\MyC_${APPGAME}_Readme.txt"
	Delete "$INSTDIR\SetLaunchOptions.txt"
	Delete "$INSTDIR\install.ico"
	Delete "$INSTDIR\uninstall.ico"
	Delete "$INSTDIR\MyC_Cleaner.dat"
	Delete "$INSTDIR\MyC_Cleaner.exe"
	Delete "$INSTDIR\MyC_Cleaner_ChangeLog.log"
	Delete "$INSTDIR\MyC_Updater.exe"
	Delete "$INSTDIR\MyC_Updater.ini"
	Delete "$INSTDIR\csgo\cfg\autoexec.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Engine_User.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Engine_MyC_Default.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\MainConfig.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\Weapon_Alias_list.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\Engine_EB.cfg"
	Delete "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\MYC_Alias.cfg"
	; Clean Lens
	;Delete "$INSTDIR\csgo\materials\overlays\scope_lenz.vmt"
	;Delete "$INSTDIR\csgo\materials\overlays\scope_lenz.vtf"

	; Remove remaining directories
	;RMDir "$INSTDIR\valve\"
	;RMDir "$INSTDIR\cstrike\sprites\"
	;RMDir "$INSTDIR\cstrike\resource\background\"
	;RMDir "$INSTDIR\cstrike\resource\"
	RMDir "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\"
	RMDir "$INSTDIR\csgo\cfg\MyC_cfg\"
	;RMDir "$INSTDIR\cstrike\models\player\vip\"
	;RMDir "$INSTDIR\cstrike\models\player\urban\"
	;RMDir "$INSTDIR\cstrike\models\player\terror\"
	;RMDir "$INSTDIR\cstrike\models\player\sas\"
	;RMDir "$INSTDIR\cstrike\models\player\leet\"
	;RMDir "$INSTDIR\cstrike\models\player\guerilla\"
	;RMDir "$INSTDIR\cstrike\models\player\gsg9\"
	;RMDir "$INSTDIR\cstrike\models\player\gign\"
	;RMDir "$INSTDIR\cstrike\models\player\arctic\"
	;RMDir "$INSTDIR\cstrike\models\player\"
	;RMDir "$INSTDIR\cstrike\models\"
	;RMDir "$INSTDIR\cstrike\gfx\vgui\"
	;RMDir "$INSTDIR\cstrike\gfx\env\"
	;RMDir "$INSTDIR\cstrike\gfx\"
	;RMDir "$INSTDIR\cstrike\"
	;RMDir "$INSTDIR\"

	; Remove ShortCuts
	Delete "$DESKTOP\MyC ${APPGAME} Cleaner.lnk"
	Delete "$DESKTOP\MyC ${APPGAME} Updater.lnk"
	; Delete "$DESKTOP\Readme.lnk"
	; Delete "$SMPROGRAMS\${APPNAME}\MyC Cleaner.lnk"
	; Delete "$SMPROGRAMS\${APPNAME}\Uninstall.lnk"
	; RMDir "$SMPROGRAMS\${APPNAME}\"

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	##########################
	# Restore old copy
	##########################
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\" "autoexec.cfg" "$INSTDIR\csgo\cfg\"
	; MyC CFG Engine User
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\" "Engine_User.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\"
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\" "Engine_MyC_Default.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\"
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\" "MainConfig.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\"
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\" "Weapon_Alias_list.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\"
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\" "Engine_EB.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\"
	!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\" "MYC_Alias.cfg" "$INSTDIR\csgo\cfg\MyC_cfg\CfgHelper\"
	; Clean Lens
	;!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\materials\overlays\" "scope_lenz.vmt" "$INSTDIR\csgo\materials\overlays\"
	;!insertmacro RestoreFile "$INSTDIR\MyC_Backup\csgo\materials\overlays\" "scope_lenz.vtf" "$INSTDIR\csgo\materials\overlays\"

	##########################
	# Remove Backup
	##########################
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\autoexec.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\Engine_User.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\Engine_MyC_Default.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\MainConfig.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\Weapon_Alias_list.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\Engine_EB.cfg"
	Delete "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\MYC_Alias.cfg"
	; Clean Lens
	;Delete "$INSTDIR\MyC_Backup\csgo\materials\overlays\scope_lenz.vmt"
	;Delete "$INSTDIR\MyC_Backup\csgo\materials\overlays\scope_lenz.vtf"

	; Remove remaining directories
	RMDir "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\CfgHelper\"
	RMDir "$INSTDIR\MyC_Backup\csgo\cfg\MyC_cfg\"
	RMDir "$INSTDIR\MyC_Backup\csgo\cfg\"
	RMDir "$INSTDIR\MyC_Backup\csgo\"
	RMDir "$INSTDIR\MyC_Backup\"

	;###########################
	;	Remove MyC_Extra
	;###########################

	;ClearErrors
	SetOutPath "$INSTDIR"

SectionEnd
 
; On initialization
Function .onInit
	SetOutPath $TEMP
	File /oname=mycv3stmp.bmp "Images\myc_v3_splash.bmp"

	advsplash::show 1000 600 400 -1 $TEMP\mycv3stmp

	Pop $0	; $0 has '1' if the user closed the splash screen early,
			; '0' if everything closed normally, and '-1' if some error occurred.
	Delete $TEMP\mycv3stmp.bmp
	!insertmacro MUI_LANGDLL_DISPLAY

	;StrCpy $1 ${Section2} ;Section2 is selected by default
	
	; Get steam CSGO install dir :: ENABLE Registry.nsh from top
	!define APPDIR "steamapps\common\Counter-Strike Global Offensive"
	${registry::Read} "HKEY_CURRENT_USER\Software\Valve\Steam" "SteamPath" $R0 $R1
	;SetOutPath "$R0\${APPDIR}\"
	${If} 	$R0 == ""
		SetOutPath $PROGRAMFILES
	${Else}
		${StrRep} "$1" "$R0\${APPDIR}" "/" "\"	 ; Replace
		StrCpy $INSTDIR "$1"
	${EndIf}

	; Check if csgo.exe process exists
	StrCpy $8 "csgo.exe"
    nsProcess::_FindProcess $8
	Pop $R0

	${If} $R0 == "0"	; Process found 
		MessageBox MB_OK|MB_ICONEXCLAMATION "Please close Counter-Strike Global Offensive ($8) process."
		Abort
	${Else}
		;Auto-uninstall old before installing new
		ReadRegStr $R0 HKLM \
		"Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" \
		"QuietUninstallString"   ; Silent Uninstall
		;"UninstallString"
		StrCmp $R0 "" done
		 
		MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION \
		"${APPNAME} is already installed. $\n$\nClick `OK` to remove the \
		previous version or `Cancel` to cancel this upgrade." \
		IDOK uninst
		Abort

		;Run the uninstaller
		uninst:
			ClearErrors
			ExecWait '$R0 _?=$INSTDIR' ;Do not copy the uninstaller to a temp file
			Delete "$INSTDIR\Uninstall.exe"
		done:
	${EndIf}
 
FunctionEnd

;Function .onSelChange
 ; ${If} ${SectionIsSelected} ${sg1}
;   !insertmacro UnSelectSection ${sg1}
;    !insertmacro SelectSection $1
 ; ${Else}
 ; !insertmacro StartRadioButtons $1
 ;   !insertmacro RadioButton ${Section2}
;    !insertmacro RadioButton ${Section3}
;    !insertmacro RadioButton ${Section4}
;  !insertmacro EndRadioButtons
 ; ${EndIf}
;FunctionEnd

Function LaunchLink
	SetOutPath $INSTDIR
	ExecShell "" "$INSTDIR\MyC_Cleaner.exe"
FunctionEnd

Function RShortCuts
	SetOutPath $INSTDIR
	ExecShell "" "$INSTDIR\MyC_${APPGAME}_Readme.txt"
FunctionEnd

Function onGUIInit
	Aero::Apply
FunctionEnd

BrandingText "   ${APPWEB} Project ${APPYEAR} by ${APPAUTHOR}"

; eof