;//*****************************************************************************************
;// Information
;//*****************************************************************************************
;// Name        : MyC Cleaner
;// Version     : 1.0.0
;// Creator     : Sn^
;// E-mail      : sniperzik22@gmail.com
;// MyC Project : http://www.MyC.1z.Lv/
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
#AutoIt3Wrapper_Icon=MyC_v3_cleaner.ico		;##	;Filename of the Ico file to use
#AutoIt3Wrapper_OutFile=MyC_Cleaner.exe		;##	;Target exe/a3x filename.
#AutoIt3Wrapper_OutFile_Type=exe				;a3x=small AutoIt3 file; exe=Standalone executable (Default)
#AutoIt3Wrapper_Compression=2					;Compression parameter 0-4 0=Low 2=normal 4=High. Default=2
#AutoIt3Wrapper_UseUpx=y						;(Y/N) Compress output program.  Default=Y
#AutoIt3Wrapper_UPX_Parameters=					;Override the default setting for UPX.
#AutoIt3Wrapper_Change2CUI=n					;(Y/N) Change output program to CUI in stead of GUI. Default=N
;===============================================================================================================
;** Target program Resource info
#AutoIt3Wrapper_Res_Comment=Author: Sn^		;##	;Comment field
#AutoIt3Wrapper_Res_Description=MyC Cleaner	;##	;Description field
#AutoIt3Wrapper_Res_Fileversion=1.0.9.0
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=n	;(Y/N/P)AutoIncrement FileVersion After Aut2EXE is finished. default=N
;                                                 P=Prompt, Will ask at Compilation time if you want to increase the versionnumber
#AutoIt3Wrapper_Res_ProductVersion=				;Product Version. Default is the AutoIt3 version used.
#AutoIt3Wrapper_Res_Language=					;Resource Language code . default 2057=English (United Kingdom)
#AutoIt3Wrapper_Res_LegalCopyright=MyC.Lv Project by Sn^;##		;Copyright field
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
$name="MyC Cleaner"
$vers="v"&"1.0.9.0"
$copy="           MyC.Lv © 2011 by Sn^"
; MyC CS1.6 Folder
$mycFolder = @ScriptDir
; Delay
$closeDelay = "5000" ; miliseconds = 5 sec.
$showDelay = "500" ; 0.5 sec.
; Folders
$fo1="cstrike\"
$fo2="valve\"
$fo3="logos\"
$fo4="media\"
$fo5="cache\"
; Files
$fi1="custom.hpk"
$fi2="gamestartup.mp3"
;//*****************************************************************************************
;#cstrike .dem .bmp
;DELETE & Create custom.hpk
;#cstrike\cache .bsp0000
;#cstrike\logos .bmp
;#valve\logos .bmp
;#cstrike\media .mp3
;#Crash Files .mdmp
;//*****************************************************************************************
#include <GuiConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIListBox.au3>
Opt("TrayMenuMode",1)
$file = @ScriptDir & "\MyC_Cleaner.dat"

; 308 = 4 - Yes and No, 48 - Exclamation-point icon, 256 - Second button is default button
If Not IsDeclared("iMsgBoxAnswer") Then Dim $iMsgBoxAnswer
$iMsgBoxAnswer = MsgBox(308,"WARNING!!!","Crash, Demo, Snapshot, Cache, Media and Logo files will be DELETED!!!" & @LF & @LF & "Do you want to continue?")
Select
   Case $iMsgBoxAnswer = 6 ;Yes
   
		TrayTip("", "Starting...",0,1)
		Sleep($showDelay)

		If FileExists("cstrike") then
			Sleep(10)
		Else
			TrayTip("", "ERROR!!!" & @LF & @LF & "Can't find cstrike folder." & @LF & @LF & "Reinstall MyC CS1.6 in" & @LF & "Full Counter Strike 1.6 Folder as patch!",0,1)
			Sleep($closeDelay)
			TrayTip("", "Closing...",0,1)
			Sleep($showDelay)
			Exit
		EndIf

		$size = DirGetSize($mycFolder)

		IniWrite($file, "CounterStrikeFolder", "BeforeCleaning", Round($size / 1024 / 1024))

		$allsize = Round($size / 1024 / 1024)
			If $allsize = "0" then
				$100p = "0"
			Else
				$100p = Round($allsize / $allsize * 100)
			EndIf

		; Clean Files
			If ProcessExists("hl.exe") Then
				TrayTip("", "Please close Couner-Strike (hl.exe) process.",0,1)
				Sleep($closeDelay)
				TrayTip("", "Closing...",0,1)
				Sleep($showDelay)
				Exit
			Else
				Sleep(10)
			EndIf
			If FileExists("*.mdmp") Then
				FileDelete("*.mdmp") ; Delete Crash Files
				TrayTip("", "Cleaned: Crash Files",0,1) ; \
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1) Then
				FileDelete($fo1&"*.dem") ; Delete Demo Files
				TrayTip("", "Cleaned: Demo Files",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1) Then
				FileDelete($fo1&"*.bmp") ; Delete Snapshot Files
				TrayTip("", "Cleaned: Snapshot Files",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fi1) Then
				FileDelete($fo1&$fi1) ; Delete custom.hpk File
				$hpk = FileOpen($fo1&$fi1, 1) 
				FileWrite($hpk, "") ; Create custom.hpk File
				TrayTip("", "Cleaned: custom.hpk File",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo5) Then
				FileDelete($fo1&"*.bsp0000") ; Delete Cache Files
				TrayTip("", "Cleaned: Cache Files",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo3) Then
				FileDelete($fo1&$fo3&"*.bmp") ; Delete Logo Files
				TrayTip("", "Cleaned: Logo Files",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo2&$fo3) Then
				FileDelete($fo2&$fo3&"*.bmp") ; Delete Logo Files
				TrayTip("", "Cleaned: Logo Files",0,1) ; \valve\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo4&$fi2) Then
				FileDelete($fo1&$fo4&$fi2) ; Delete gamestartup.mp3 File
				TrayTip("", "Cleaned: Media Files",0,1) ; \cstrike\
				Sleep($showDelay)
			Else
				Sleep(10)
			EndIf

		$size = DirGetSize($mycFolder)
		$leftsize = Round($size / 1024 / 1024)

			If $allsize = "0" then
				$leftp = "0"
				$cleaned = "0"
			Else
				$leftp = Round($leftsize / $allsize * 100)
				$cleaned = Round($allsize - $leftsize)
			EndIf

		$cleanedp = Round($100p - $leftp)

		IniWrite($file, "CounterStrikeFolder", "AfterCleaning", Round($size / 1024 / 1024))
		IniWrite($file, "CounterStrikeFolder", "TotalCleaned", $cleaned)
		
		; Get Time
		$time = @MDAY & "-" & @MON & "-" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
		$date = IniRead($file, "LastTimeCleaned", "LastDate", "")
		If $date = "" then
			$date = "Never"
		Else
			$date = IniRead($file, "LastTimeCleaned", "LastDate", "")
		EndIf
		
		TrayTip("", "Finished...",0,1)
		Sleep($showDelay)
		
		Msgbox(0,$name & " " & $vers,"Before Cleaning:   " & $100p & "% (" & $allsize & "Mb)" & @LF & "After Cleaning:      " & $leftp & "% (" & $leftsize & "Mb)" & @LF & "______________________________________" & @LF & "Total Cleaned:       " & $cleanedp & "% (" & $cleaned & "Mb)" & @LF & @LF & "Last Run: " & $date & @LF & "______________________________________" & @LF & $copy)
		
		; Write Date
		IniWrite($file, "LastTimeCleaned", "LastDate", $time)
		
   Case $iMsgBoxAnswer = 7 ;No
		TrayTip("", "Closing...",0,1)
		Sleep($showDelay)
		Exit
	
EndSelect
