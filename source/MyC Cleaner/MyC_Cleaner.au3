;//*****************************************************************************************
;// Information
;//*****************************************************************************************
;// Name        : MyC Cleaner
;// Version     : 1.0.0.0
;// Creator     : Sn^
;// E-mail      : sniperzik22@gmail.com
;// MyC Project : http://www.MyC.Lv/
;//*****************************************************************************************
#NoTrayIcon ;Disable tray icon
#Region AutoIt3Wrapper directives section
;** This is a list of compiler directives used by AutoIt3Wrapper.exe.
;** Comment any unneeded lines as they will override any previous settings
;===============================================================================================================
;** AutoIt3 settings
#AutoIt3Wrapper_UseX64=N                         ;(Y/N) Use AutoIt3_x64 or Aut2Exe_x64. Default=N
#AutoIt3Wrapper_Version=                        ;(B/P) Use Beta or Production for AutoIt3 and Aut2Eex. Default is P
#AutoIt3Wrapper_Run_Debug_Mode=N                 ;(Y/N) Run Script with console debugging. Default=N
#AutoIt3Wrapper_Run_SciTE_Minimized=N            ;(Y/N) Minimize SciTE while script is running. Default=N
#AutoIt3Wrapper_Run_SciTE_OutputPane_Minimized=N ;(Y/N) Minimize SciTE output pane at run time. Default=N
;===============================================================================================================
;** Aut2Exe settings
#AutoIt3Wrapper_Icon=MyC_Cleaner.ico            ;Filename of the Ico file to use for the compiled exe
#AutoIt3Wrapper_OutFile=MyC_Cleaner.exe         ;Target exe/a3x filename.
#AutoIt3Wrapper_OutFile_Type=exe                ;exe=Standalone executable (Default); a3x=Tokenised AutoIt3 code file
#AutoIt3Wrapper_Compression=2                   ;Compression parameter 0-4  0=Low 2=normal 4=High. Default=2
#AutoIt3Wrapper_UseUpx=Y                        ;(Y/N) Compress output program.  Default=Y
#AutoIt3Wrapper_UPX_Parameters=                 ;Override the default settings for UPX.
#AutoIt3Wrapper_Change2CUI=N                     ;(Y/N) Change output program to CUI in stead of GUI. Default=N
;===============================================================================================================
;** Target program Resource info
#AutoIt3Wrapper_Res_Comment=Author: Sn^         ;Comment field
#AutoIt3Wrapper_Res_Description=MyC Cleaner     ;Description field
#AutoIt3Wrapper_Res_Fileversion=1.1.13.0        ;File Version
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=N  ;(Y/N/P) AutoIncrement FileVersion after compile. Default=N
;                                                 P=Prompt, Will ask whether to increase the versionnumber
#AutoIt3Wrapper_Res_Language=                   ;Resource Language code . Default 2057=English (United Kingdom)
#AutoIt3Wrapper_Res_LegalCopyright=MyC.Lv © 2020 by Sn^             ;Copyright field
#AutoIt3Wrapper_res_requestedExecutionLevel=None    ;asInvoker, highestAvailable, requireAdministrator or None (remove the trsutInfo section).  Default is the setting from Aut2Exe (asInvoker)
#AutoIt3Wrapper_res_Compatibility=              ;Vista,Windows7 Both allowed separated by a comma     (Default=None)
#AutoIt3Wrapper_Res_SaveSource=N                 ;(Y/N) Save a copy of the Script_source in the EXE resources. Default=N
; If _Res_SaveSource=Y the content of Script_source depends on the _Run_Au3Stripper and #Au3Stripper_parameters directives:
;    If _Run_Au3Stripper=Y then
;        If #Au3Stripper_parameters=/STRIPONLY then Script_source is stripped script & stripped includes
;        If #Au3Stripper_parameters=/STRIPONLYINCLUDES then Script_source is original script & stripped includes
;   If _Run_Au3Stripper=N or is not set then
;       Scriptsource is original script only
; AutoIt3Wrapper indicates the SaveSource action taken in the SciTE console during compilation
; See SciTE4AutoIt3 Helpfile for more detail on Au3Stripper parameters
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
; Free form resource fields ... max 15
;    You can use the following variables:
;     %AutoItVer% which will be replaced with the version of AutoIt3
;     %date% = PC date in short date format
;     %longdate% = PC date in long date format
;     %time% = PC timeformat
;  eg: #AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Icon_Add=                   ; Filename[,ResNumber[,LanguageCode]] of ICO to be added.
; Add extra ICO files to the resources
; Use full path of the ico files to be added
; ResNumber is a numeric value used to access the icon: TraySetIcon(@ScriptFullPath, ResNumber)
; If no ResNumber is specified, the added icons are numbered from 201 up
#AutoIt3Wrapper_Res_File_Add=                   ; Filename[,Section [,ResName[,LanguageCode]]] to be added.
; Add files to the resources - can be compressed
; Remove resources
;===============================================================================================================
; Tidy Settings
#AutoIt3Wrapper_Run_Tidy=N                       ;(Y/N) Run Tidy before compilation. Default=N
#AutoIt3Wrapper_Tidy_Stop_OnError=Y              ;(Y/N) Continue when only Warnings. Default=Y
#Tidy_Parameters=                               ;Tidy Parameters...see SciTE4AutoIt3 Helpfile for options
;===============================================================================================================
; AU3Check settings
#AutoIt3Wrapper_Run_AU3Check=Y                   ;(Y/N) Run au3check before compilation. Default=Y
#AutoIt3Wrapper_AU3Check_Parameters=            ;Au3Check parameters...see SciTE4AutoIt3 Helpfile for options
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=        ;(Y/N) Continue/Stop on Warnings.(Default=N)
;===============================================================================================================
; RUN BEFORE AND AFTER definitions
#AutoIt3Wrapper_Run_Before=                     ;process to run before compilation - multiple records will be processed in sequence
#AutoIt3Wrapper_Run_After=                      ;process to run after compilation - multiple records will be processed in sequence
; These directives can contain the following variables
;   %in% , %out%, %outx64%, %icon% which will be replaced by the fullpath\filename.
;   %scriptdir%   = @ScriptDir and %scriptfile% = filename without extension.
;   %fileversion% = #AutoIt3Wrapper_Res_Fileversion directive
;   %scitedir%    = SciTE program directory
;   %autoitdir%   = AutoIt3 program directory
;===============================================================================================================
; Add Constants
#AutoIt3Wrapper_Add_Constants=                  ;Add the needed standard constant include files. Will only run one time.
;===============================================================================================================
; Optional
; Use this format to have separate directive values for Run and Compile
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
$name_="MyC_Cleaner"
$v="v"
$vers="1.1.13"
$web="MyC.Lv"
$author="Sn^"
$year="2020"
$copy="           "&$web&" © "&$year&" by "&$author
; MyC CS1.6 Folder
$mycFolder = @ScriptDir
; Delay
$closeDelay = "5000" ; miliseconds = 5 sec.
$showDelay = "500" ; 0.5 sec.
; CS1.6 Folders
$fo1="cstrike\"
$fo2="valve\"
$fo3="logos\"
$fo4="media\"
$fo5="cache\"
; CSGO Folders
$fo6="csgo\"
$fo7="streams\"
$fo8="screenshots\"
$fo9="downloads\"
$fo10="cache\"

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
;#Log Files .log
;// CSGO *****************************************************************************************
;# .mdmp
;#csgo\ .dem
;#streams\ .jpg
;#screenshots\ .tga .jpg
;#downloads\ .dat
;#cache\ .bsp0000 .bz20000
;//*****************************************************************************************
#include <GuiConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIListBox.au3>

$file = @ScriptDir & "\"&$name_&".dat"

	; Files to Delete Msg CS1.6
	If FileExists($fo1) then
		$filesToDeleteMsg = "Log, Crash, Demo, Snapshot, Cache, Media and Logo files will be DELETED!!!"
	; Files to Delete Msg CSGO
	ElseIf FileExists($fo6) then
		$filesToDeleteMsg = "Crash, Demo, Data, Screenshot, Thumbnail and Cache files will be DELETED!!!"
	Else
		MsgBox(48,"ERROR","Can't find a folder." & @LF & @LF & "Reinstall "&$name&" in" & @LF & "Full game Folder as a patch!")
		Exit
	EndIf

; 308 = 4 - Yes and No, 48 - Exclamation-point icon, 256 - Second button is default button
If Not IsDeclared("iMsgBoxAnswer") Then Dim $iMsgBoxAnswer
$iMsgBoxAnswer = MsgBox(308,"WARNING!!!",$filesToDeleteMsg & @LF & @LF & "Do you want to continue?")
Select
   Case $iMsgBoxAnswer = 6 ;Yes

		;CS1.6
		If FileExists($fo1) then
			Sleep(10)
		;CSGO
		ElseIf FileExists($fo6) then
			Sleep(10)
		Else
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

			;Check CS1.6 Process
			If ProcessExists("hl.exe") Then
				MsgBox(48,"WARNING","Please close Counter-Strike (hl.exe) process.")
				Exit
			Else
				Sleep(10)
			EndIf
			;Check CSGO Process
			If ProcessExists("csgo.exe") Then
				MsgBox(48,"WARNING","Please close Counter-Strike Global Offensive (csgo.exe) process.")
				Exit
			Else
				Sleep(10)
			EndIf
			
	; Clean Files - CS1.6
			If FileExists($fo1) Then
				FileDelete("*.log") ; Delete Log Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1) Then
				FileDelete("*.mdmp") ; Delete Crash Files
				FileDelete($fo1&"*.mdmp") ; Delete Crash Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1) Then
				FileDelete($fo1&"*.dem") ; Delete Demo Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1) Then
				FileDelete($fo1&"*.bmp") ; Delete Snapshot Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fi1) Then
				FileDelete($fo1&$fi1) ; Delete custom.hpk File
				$hpk = FileOpen($fo1&$fi1, 1) 
				FileWrite($hpk, "") ; Create custom.hpk File
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo5) Then
				FileDelete($fo1&"*.bsp0000") ; Delete Cache Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo3) Then
				FileDelete($fo1&$fo3&"*.bmp") ; Delete Logo Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo2&$fo3) Then
				FileDelete($fo2&$fo3&"*.bmp") ; Delete Logo Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo1&$fo4&$fi2) Then
				FileDelete($fo1&$fo4&$fi2) ; Delete gamestartup.mp3 File
			Else
				Sleep(10)
			EndIf
			
	; Clean Files - CSGO
			If FileExists($fo6) Then
				FileDelete("*.mdmp") ; Delete .mdmp (Crash/Access Violation) Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo6) Then
				FileDelete($fo6&"*.dem") ; Delete Demo Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo6&$fo7) Then
				FileDelete($fo6&$fo7&"*.jpg") ; Delete Stream Thumbnail Files
			Else
				Sleep(10)
			EndIf	
			If FileExists($fo6&$fo8) Then
				FileDelete($fo6&$fo8&"*.tga") ; Delete TGA Files
				FileDelete($fo6&$fo8&"*.jpg") ; Delete JPG Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo6&$fo9) Then
				FileDelete($fo6&$fo9&"*.dat") ; Delete Data Files
			Else
				Sleep(10)
			EndIf
			If FileExists($fo6&$fo10) Then
				FileDelete($fo6&$fo10&"*.bsp0000") ; Delete bsp0000 Files
				FileDelete($fo6&$fo10&"*.bz20000") ; Delete bz20000 Files
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
		
		Msgbox(0,$name & " " & $vers,"Before Cleaning:   " & $100p & "% (" & $allsize & "Mb)" & @LF & "After Cleaning:      " & $leftp & "% (" & $leftsize & "Mb)" & @LF & "______________________________________" & @LF & "Total Cleaned:       " & $cleanedp & "% (" & $cleaned & "Mb)" & @LF & @LF & "Last Run: " & $date & @LF & "______________________________________" & @LF & $copy)
		
		; Write Date
		IniWrite($file, "LastTimeCleaned", "LastDate", $time)
		
   Case $iMsgBoxAnswer = 7 ;No)
		Exit
	
EndSelect