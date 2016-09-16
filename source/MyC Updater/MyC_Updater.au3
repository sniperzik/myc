;//*****************************************************************************************
;// Information
;//*****************************************************************************************
;// Name        : MyC Updater
;// Version     : 1.0.0.0
;// Creator     : Sn^
;// E-mail      : sniperzik22@gmail.com
;// MyC Project : https://MyC.Lv/
;//*****************************************************************************************
;#NoTrayIcon ;Disable tray icon
#Region AutoIt3Wrapper directives section
;** This is a list of compiler directives used by AutoIt3Wrapper.exe.
;** comment the lines you don't need or else it will override the default settings
;===============================================================================================================
;** AUTOIT3 settings
#AutoIt3Wrapper_UseX64=n						;(Y/N) Use X64 versions for AutoIt3_x64 or AUT2EXE_x64. Default=N
#AutoIt3Wrapper_Version=						;(B/P) Use Beta or Production for AutoIt3 and AUT2EXE. Default is P
#AutoIt3Wrapper_Run_Debug_Mode=n				;(Y/N)Run Script with console debugging. Default=N
#AutoIt3Wrapper_Run_SciTE_Minimized=n			;(Y/N) Minimize SciTE while script is running.
#AutoIt3Wrapper_Run_SciTE_OutputPane_Minimized=n;(Y/N) Toggle SciTE output pane at run time so its not shown by default.
;===============================================================================================================
;** AUT2EXE settings
#AutoIt3Wrapper_Icon=MyC_Updater.ico		;##	;Filename of the Ico file to use
#AutoIt3Wrapper_OutFile=MyC_Updater.exe		;##	;Target exe/a3x filename.
#AutoIt3Wrapper_OutFile_Type=exe				;a3x=small AutoIt3 file; exe=Standalone executable (Default)
#AutoIt3Wrapper_Compression=2					;Compression parameter 0-4 0=Low 2=normal 4=High. Default=2
#AutoIt3Wrapper_UseUpx=y						;(Y/N) Compress output program.  Default=Y
#AutoIt3Wrapper_UPX_Parameters=					;Override the default setting for UPX.
#AutoIt3Wrapper_Change2CUI=n					;(Y/N) Change output program to CUI in stead of GUI. Default=N
;===============================================================================================================
;** Target program Resource info
#AutoIt3Wrapper_Res_Comment=Author: Sn^		;##	;Comment field
#AutoIt3Wrapper_Res_Description=MyC Updater	;##	;Description field
#AutoIt3Wrapper_Res_Fileversion=1.0.0.4
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=N	;(Y/N/P)AutoIncrement FileVersion After Aut2EXE is finished. default=N
;                                                 P=Prompt, Will ask at Compilation time if you want to increase the versionnumber
#AutoIt3Wrapper_Res_ProductVersion=				;Product Version. Default is the AutoIt3 version used.
#AutoIt3Wrapper_Res_Language=					;Resource Language code . default 2057=English (United Kingdom)
#AutoIt3Wrapper_Res_LegalCopyright=MyC.Lv © 2016 by Sn^;##		;Copyright field
#AutoIt3Wrapper_res_requestedExecutionLevel=None;None, asInvoker, highestAvailable or requireAdministrator   (default=None)
#AutoIt3Wrapper_Res_SaveSource=n				;(Y/N) Save a copy of the Scriptsource in the EXE resources. default=N
; If _Res_SaveSource=Y the content of Scriptsource depends on the _Run_Obfuscator and #obfuscator_parameters directives:
;
;    If _Run_Obfuscator=Y then
;       If #obfuscator_parameters=/STRIPONLY then Scriptsource is stripped script & stripped includes
;       If #obfuscator_parameters=/STRIPONLYINCLUDES then Scriptsource is original script & stripped includes
;       With any other parameters, the SaveSource directive is ignored as obfuscation is intended to protect the source
;   If _Run_Obfuscator=N or is not set then
;       Scriptsource is original script only
; Autoit3Wrapper indicates the SaveSource action taken in the SciTE console during compilation
; See SciTE4AutoIt3 Helpfile for more detail on Obfuscator parameters
;
;
; free form resource fields ... max 15
;     you can use the following variables:
;     %AutoItVer% which will be replaced with the version of AutoIt3
;     %date% = PC date in short date format
;     %longdate% = PC date in long date format
;     %time% = PC timeformat
;  eg: #AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
; Add extra ICO files to the resources which can be used with TraySetIcon(@ScriptFullPath, 5) etc
; list of filename of the Ico files to be added, First one will have number 5, then 6 ..etc
#AutoIt3Wrapper_Res_Icon_Add=                   ; Filename[,LanguageCode] of ICO to be added.
#AutoIt3Wrapper_Res_Icon_Add=                   ; Filename[,LanguageCode] of ICO to be added.
; Add extra files to the resources
#AutoIt3Wrapper_Res_File_Add=                   ; Filename[,Section [,ResName[,LanguageCode]]] to be added.
#AutoIt3Wrapper_Res_File_Add=                   ; Filename[,Section [,ResName[,LanguageCode]]] to be added.
;===============================================================================================================
; Tidy Settings
#AutoIt3Wrapper_Run_Tidy=n						;(Y/N) Run Tidy before compilation. default=N
#AutoIt3Wrapper_Tidy_Stop_OnError=y				;(Y/N) Continue when only Warnings. default=Y
#Tidy_Parameters=                               ;Tidy Parameters...see SciTE4AutoIt3 Helpfile for options
;===============================================================================================================
; Obfuscator
#AutoIt3Wrapper_Run_Obfuscator=n				;(Y/N) Run Obfuscator before compilation. default=N
#obfuscator_parameters=
;===============================================================================================================
; AU3Check settings
#AutoIt3Wrapper_Run_AU3Check=y					;(Y/N) Run au3check before compilation. Default=Y
#AutoIt3Wrapper_AU3Check_Parameters=            ;Au3Check parameters
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=        ;(Y/N) N=Continue on Warnings.(Default) Y=Always stop on Warnings
#AutoIt3Wrapper_PlugIn_Funcs=                   ;Define PlugIn function names separated by a Comma to avoid AU3Check errors
;===============================================================================================================
; cvsWrapper settings
#AutoIt3Wrapper_Run_cvsWrapper=n				;(Y/N/V) Run cvsWrapper to update the script source. default=N
;                                                 V=only when version is increased by #AutoIt3Wrapper_Res_FileVersion_AutoIncrement.
#AutoIt3Wrapper_cvsWrapper_Parameters=          ; /NoPrompt  : Will skip the cvsComments prompt
;                                                 /Comments  : Text to added in the cvsComments. It can also contain the below variables.
;===============================================================================================================
; RUN BEFORE AND AFTER definitions
; The following directives can contain: these variables
; %in% , %out%, %icon% which will be replaced by the fullpath\filename.
; %scriptdir% same as @ScriptDir and %scriptfile% = filename without extension.
; %fileversion% is the information from the #AutoIt3Wrapper_Res_Fileversion directive
;   %scitedir% will be replaced by the SciTE program directory
;   %autoitdir% will be replaced by the AutoIt3 program directory
#AutoIt3Wrapper_Run_Before=                     ;process to run before compilation - you can have multiple records that will be processed in sequence
#AutoIt3Wrapper_Run_After=                      ;process to run After compilation - you can have multiple records that will be processed in sequence
;===============================================================================================================
; RUN BEFORE AND AFTER definitions
#AutoIt3Wrapper_Add_Constants=                  ;Add the needed standard constant include files. Will only run one time.
#EndRegion
;====================================================
; Use the time macros:
; @SEC Seconds value of clock. Range is 00 to 59
; @MIN Minutes value of clock. Range is 00 to 59
; @HOUR Hours value of clock in 24-hour format. Range is 00 to 23
; @MDAY Current day of month. Range is 01 to 31
; @MON Current month. Range is 01 to 12
; @YEAR Current four-digit year 
; @WDAY Numeric day of week. Range is 1 to 7 which corresponds to Sunday through Saturday. 
; @YDAY Current day of year. Range is 1 to 366 (or 365 if not a leap year)
;====================================================
$name="MyC Updater"
$name_="MyC_Updater"
$csgo="CSGO"
$fo1="cstrike\"
$cs16="CS16"
$fo6="csgo\"
$v="v"
$vers="1.0.0.4"
$web="MyC.Lv"
$author="Sn^"
$year="2016"
$copy="           "&$web&" © "&$year&" by "&$author
; Delay
$closeDelay = "5000" ; miliseconds = 5 sec.
$showDelay = "500" ; 0.5 sec.
; MyC Config Folder
$mycFolder = @ScriptDir
;//*****************************************************************************************
#include <GuiConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIListBox.au3>
Opt("TrayIconHide", 1) ;0=show, 1=hide tray icon
;Opt("TrayMenuMode", 0) ;0=append, 1=no default menu, 2=no automatic check, 4=menuitemID  not return
;==========================

; Check if installed in game folders
	;CS1.6
	If FileExists($fo1) then
		Sleep(10)
		$game=$cs16
	;CSGO
	ElseIf FileExists($fo6) then
		Sleep(10)
		$game=$csgo
	Else
		TrayTip("", "ERROR!!!" & @LF & @LF & "Can't find a folder." & @LF & @LF & "Reinstall "&$name&" in" & @LF & "Full game Folder as patch!",0,1)
		Sleep($closeDelay)
		TrayTip("", "Closing...",0,1)
		Sleep($showDelay)
		Exit
	EndIf

; 308 = 4 - Yes and No, 48 - Exclamation-point icon, 256 - Second button is default button
; 36 = 4 - Yes and No, 32 - Question-mark icon
If Not IsDeclared("iMsgBoxAnswer") Then Dim $iMsgBoxAnswer
$iMsgBoxAnswer = MsgBox(36,"MyC Updater","Ready to check for updates." & @LF & @LF & "Do you want to continue?")
Select
   Case $iMsgBoxAnswer = 6 ;Yes
	
		$VersionsInfo = "https://myc.lv/update/"&$name_&"_version.ini"
		$oldVersion = IniRead($name_&".ini",$game&"Version",$game&"Version","NotFound")
		$newVersion = "0.0.0.0"

		$Ini = InetGet($VersionsInfo,$mycFolder & "\"&$name_&"_version.ini") ;download version.ini

		If $Ini = 0 Then ;was the download of version.ini successful?
			MsgBox(48,"ERROR","The server seems to be offline."& @LF & @LF & "Please check latest version @ www.MyC.Lv")
		Else
			$newVersion = IniRead($mycFolder & "\"&$name_&"_version.ini",$game&"Version",$game&"Version","") ;reads the new version out of version.ini
			If $NewVersion = $oldVersion Then ;compare old and new
				MsgBox (64,"No update","There is no update available!")
			Else
				$msg = MsgBox (68,"Update","There is a new version available: " & $newVersion & @LF & @LF & "You are using: " & $oldVersion & @LF & @LF & " Do you want to download the new version?")
				If $msg = 7 Then ;No was pressed
					FileDelete($mycFolder & "\"&$name_&"_version.ini")
					Exit
				ElseIf $msg = 6 Then ;OK was pressed
					$downloadLink = IniRead($mycFolder & "\"&$name_&"_version.ini",$game&"Version",$game&"Download","NotFound")
					$dlhandle = InetGet($downloadLink,@DesktopDir & "\MyC_"&$game&"_v" & $newVersion & ".exe",1,1)
					ProgressOn($name&" "&$v&$vers, "Downloading...", "",-1,-1,16) ;creates an progressbar
					$Size = InetGetSize($downloadLink,1) ;get the size of the update
					While Not InetGetInfo($dlhandle, 2)
						$Percent = (InetGetInfo($dlhandle,0)/$Size)*100
						ProgressSet($Percent, $Percent & " percent");update progressbar
						Sleep(1)
					WEnd
					ProgressSet(100, "Done", "Complete");show complete progressbar
					sleep(500)
					ProgressOff() ;close progress window
					IniWrite($name_&".ini",$game&"Version",$game&"Version",$NewVersion) ;updates updater.ini with the new version
					InetClose($dlhandle)
					$runFile = MsgBox(36,"Success","Download Complete!"& @LF & @LF &"Do you want to open the file?") ; Download complete, run downloaded file?
						If $runFile = 6 then
							Run(@DesktopDir & "\MyC_"&$game&"_v" & $newVersion & ".exe")
						Else
							Sleep(1)
						EndIf
				EndIf
			EndIf
		EndIf
		
		FileDelete(@ScriptDir & "\"&$name_&"_version.ini")
		Exit
   
   Case $iMsgBoxAnswer = 7 ;No
		TrayTip("", "Closing...",0,1)
		Sleep($showDelay)
		FileDelete(@ScriptDir & "\"&$name_&"_version.ini")
		Exit
	
EndSelect