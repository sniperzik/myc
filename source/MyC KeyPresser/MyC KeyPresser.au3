;//*****************************************************************************************
;// Information
;//*****************************************************************************************
;// Name        : MyC KeyPresser
;// Version     : 1.0
;// Creator     : Sn^
;// E-mail      : sniperzik22@gmail.com
;// MyC Project : http://www.MyC.Lv/
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
#AutoIt3Wrapper_Icon=MyC KeyPresser.ico	;##	;Filename of the Ico file to use
#AutoIt3Wrapper_OutFile=MyC_KeyPresser.exe		;##	;Target exe/a3x filename.
#AutoIt3Wrapper_OutFile_Type=exe				;a3x=small AutoIt3 file; exe=Standalone executable (Default)
#AutoIt3Wrapper_Compression=2					;Compression parameter 0-4 0=Low 2=normal 4=High. Default=2
#AutoIt3Wrapper_UseUpx=y						;(Y/N) Compress output program.  Default=Y
#AutoIt3Wrapper_UPX_Parameters=					;Override the default setting for UPX.
#AutoIt3Wrapper_Change2CUI=n					;(Y/N) Change output program to CUI in stead of GUI. Default=N
;===============================================================================================================
;** Target program Resource info
#AutoIt3Wrapper_Res_Comment=Author: Sn^		;##	;Comment field
#AutoIt3Wrapper_Res_Description=MyC KeyPresser ;##	;Description field
#AutoIt3Wrapper_Res_Fileversion=1.0.3.0
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=n	;(Y/N/P)AutoIncrement FileVersion After Aut2EXE is finished. default=N
;                                                 P=Prompt, Will ask at Compilation time if you want to increase the versionnumber
#AutoIt3Wrapper_Res_ProductVersion=				;Product Version. Default is the AutoIt3 version used.
#AutoIt3Wrapper_Res_Language=					;Resource Language code . default 2057=English (United Kingdom)
#AutoIt3Wrapper_Res_LegalCopyright=MyC.Lv © 2020 by Sn^ ;##		;Copyright field
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
#include <GuiConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#NoTrayIcon

$name="MyC KeyPresser"
$vers="v"&"1.0.3"
$copy="MyC.Lv © 2020 by Sn^"

Global $Toggle = 0
Opt("GUIOnEventMode", 1)

	;========================
	;	GUI
	;========================	
	
	GUICreate($name, 235, 365, -1, -1, -1)
	GUISetState(@SW_SHOW)
	
	$file = @ScriptDir & "\MyC_KeyPresser.ini"
	
	; COPY
	GuiCtrlCreateLabel($copy, 10, 345, 200, 15)
	GuiCtrlCreateLabel($vers, 195, 345, 100, 15)

	GuiCtrlCreateGroup("", 5, 0, 225, 40) 		;group start
	;	$Close = GUICtrlCreateButton("Exit", 10, 10, 75, 25)
	$StartStop = GUICtrlCreateButton("Start / Stop", 10, 10, 85, 25)
	GuiCtrlCreateLabel("Status:", 110, 15, 45, 15)
	GuiCtrlCreateLabel("Not Running!", 150, 15, 75, 15)
	GUICtrlCreateGroup ("",-99,-99,1,1)			;close group
	
	;========================
	; 		Key 1
	;========================

	GuiCtrlCreateGroup("1", 5, 130, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 12, 146, 45, 15)
	GuiCtrlCreateLabel("Delay:", 12, 162, 45, 15)
	$UseKey1Checked = IniRead($file, "UseKeySettings", "UseKey1", "")
	$UseKey1 = GUICtrlCreateCheckbox("Enable", 53, 178)
	If $UseKey1Checked = "1" Then
		GUICtrlSetState($UseKey1, $GUI_CHECKED)
	EndIf
	$QuickBarKey1 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey1", "1"), 45, 143, 65, 17, 1)
	$KeyDelay1 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay1", "3"), 45, 161, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Key 2
	;========================
	
	GuiCtrlCreateGroup("2", 5, 200, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 12, 216, 45, 15)
	GuiCtrlCreateLabel("Delay:", 12, 232, 45, 15)
	$UseKey2Checked = IniRead($file, "UseKeySettings", "UseKey2", "")
	$UseKey2 = GUICtrlCreateCheckbox("Enable", 53, 248)
	If $UseKey2Checked = "1" Then
		GUICtrlSetState($UseKey2, $GUI_CHECKED)
	EndIf
	$QuickBarKey2 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey2", ""), 45, 213, 65, 17, 1)
	$KeyDelay2 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay2", ""), 45, 231, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Key 3
	;========================
	
	GuiCtrlCreateGroup("3", 5, 270, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 12, 286, 45, 15)
	GuiCtrlCreateLabel("Delay:", 12, 302, 45, 15)
	$UseKey3Checked = IniRead($file, "UseKeySettings", "UseKey3", "")
	$UseKey3 = GUICtrlCreateCheckbox("Enable", 53, 318)
	GUICtrlSetState(-1, IniRead($file, "UseKeySettings", "UseKey3", ""))
	If $UseKey3Checked = "1" Then
		GUICtrlSetState($UseKey3, $GUI_CHECKED)
	EndIf
	$QuickBarKey3 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey3", ""), 45, 283, 65, 17, 1)
	$KeyDelay3 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay3", ""), 45, 301, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Key 4
	;========================
	
	GuiCtrlCreateGroup("4", 120, 130, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 127, 146, 45, 15)
	GuiCtrlCreateLabel("Delay:", 127, 162, 45, 15)
	$UseKey4Checked = IniRead($file, "UseKeySettings", "UseKey4", "")
	$UseKey4 = GUICtrlCreateCheckbox("Enable", 173, 178)
	GUICtrlSetState(-1, IniRead($file, "UseKeySettings", "UseKey4", ""))
	If $UseKey4Checked = "1" Then
		GUICtrlSetState($UseKey4, $GUI_CHECKED)
	EndIf
	$QuickBarKey4 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey4", ""), 160, 143, 65, 17, 1)
	$KeyDelay4 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay4", ""), 160, 161, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Key 5
	;========================
	
	GuiCtrlCreateGroup("5", 120, 200, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 127, 216, 45, 15)
	GuiCtrlCreateLabel("Delay:", 127, 232, 45, 15)
	$UseKey5Checked = IniRead($file, "UseKeySettings", "UseKey5", "")
	$UseKey5 = GUICtrlCreateCheckbox("Enable", 173, 248)
	GUICtrlSetState(-1, IniRead($file, "UseKeySettings", "UseKey5", ""))
	If $UseKey5Checked = "1" Then
		GUICtrlSetState($UseKey5, $GUI_CHECKED)
	EndIf
	$QuickBarKey5 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey5", ""), 160, 213, 65, 17, 1)
	$KeyDelay5 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay5", ""), 160, 231, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Key 6
	;========================

	GuiCtrlCreateGroup("6", 120, 270, 110, 71)		;group start
	GuiCtrlCreateLabel("Key:", 127, 286, 45, 15)
	GuiCtrlCreateLabel("Delay:", 127, 302, 45, 15)
	$UseKey6Checked = IniRead($file, "UseKeySettings", "UseKey6", "")
	$UseKey6 = GUICtrlCreateCheckbox("Enable", 173, 318)
	GUICtrlSetState(-1, IniRead($file, "UseKeySettings", "UseKey6", ""))
	If $UseKey6Checked = "1" Then
		GUICtrlSetState($UseKey6, $GUI_CHECKED)
	EndIf
	$QuickBarKey6 = GUICtrlCreateInput(IniRead($file, "KeySettings", "QuickBarKey6", ""), 160, 283, 65, 17, 1)
	$KeyDelay6 = GUICtrlCreateInput(IniRead($file, "KeySettings", "KeyDelay6", ""), 160, 301, 65, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
		
	;========================
	; 		Process Info
	;========================
	
	GuiCtrlCreateGroup("", 5, 40, 225, 55)		;group start
	GuiCtrlCreateLabel("Process Name:", 12, 54, 75, 15)
	GuiCtrlCreateLabel("Process Title:", 12, 73, 75, 15)
	$ProcessName = GUICtrlCreateInput(IniRead($file, "ProcessSettings", "ProcessName", "notepad.exe"), 95, 52, 125, 17, 1)
	$ProcessTitle = GUICtrlCreateInput(IniRead($file, "ProcessSettings", "ProcessTitle", "Untitled - Notepad"), 95, 71, 125, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
	
	;========================
	; 		Def Key
	;========================

	GuiCtrlCreateGroup("", 5, 95, 225, 35)		;group start
	GuiCtrlCreateLabel("Start / Stop Key:", 12, 109, 95, 15)
	$DefKey = GUICtrlCreateInput(IniRead($file, "GeneralSettings", "StartStop", "F9"), 95, 107, 125, 17, 1)
	GUICtrlCreateGroup ("",-99,-99,1,1)  		;close group
		
	;========================
	; 		SetOnEvent
	;========================

	;GUICtrlSetOnEvent($Close, "Close")
	GUICtrlSetOnEvent($StartStop, "Toggle")
	GUISetOnEvent($GUI_EVENT_CLOSE, "Close")
	
	;========================

	$_ProcessName = GUICtrlRead($ProcessName)	
	$_ProcessTitle = GUICtrlRead($ProcessTitle)	
	$_DefKey = GUICtrlRead($DefKey)	
	
	$_KeyDelay1 = GUICtrlRead($KeyDelay1)
	$_QuickBarKey1 = GUICtrlRead($QuickBarKey1)
	
	$_KeyDelay2 = GUICtrlRead($KeyDelay2)
	$_QuickBarKey2 = GUICtrlRead($QuickBarKey2)
	
 	$_KeyDelay3 = GUICtrlRead($KeyDelay3)
	$_QuickBarKey3 = GUICtrlRead($QuickBarKey3)
	
 	$_KeyDelay4 = GUICtrlRead($KeyDelay4)
	$_QuickBarKey4 = GUICtrlRead($QuickBarKey4)

	$_KeyDelay5 = GUICtrlRead($KeyDelay5)
	$_QuickBarKey5 = GUICtrlRead($QuickBarKey5)

	$_KeyDelay6 = GUICtrlRead($KeyDelay6)
	$_QuickBarKey6 = GUICtrlRead($QuickBarKey6)

	$_UseKey1 = GUICtrlRead($UseKey1)
	$_UseKey2 = GUICtrlRead($UseKey2)
	$_UseKey3 = GUICtrlRead($UseKey3)
	$_UseKey4 = GUICtrlRead($UseKey4)
	$_UseKey5 = GUICtrlRead($UseKey5)
	$_UseKey6 = GUICtrlRead($UseKey6)


	;========================	
	HotKeySet("{"&$_DefKey&"}", "Toggle")
	;========================
	
	
	;========================
	;	Start / Stop
	;========================
	
	While 1				
	
		$_ProcessName = GUICtrlRead($ProcessName)	
		$_ProcessTitle = GUICtrlRead($ProcessTitle)	
	
		If ProcessExists($_ProcessName) and $_UseKey1=$GUI_CHECKED and $toggle = 1 Then		
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey1&"}")
				Sleep($_KeyDelay1&"000")
			Else
				Sleep(100)
		EndIf
	
		If $_UseKey2=$GUI_CHECKED and $toggle = 1 Then
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey2&"}")
				Sleep($_KeyDelay2&"000"/2)
		Else
				Sleep(100)
		EndIf
		
		If $_UseKey3=$GUI_CHECKED and $toggle = 1 Then
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey3&"}")
				Sleep($_KeyDelay3&"000"/3)
		Else
				Sleep(100)
		EndIf		
		
		If $_UseKey4=$GUI_CHECKED and $toggle = 1 Then
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey4&"}")
				Sleep($_KeyDelay4&"000"/4)
		Else
				Sleep(100)
		EndIf		
		
		If $_UseKey5=$GUI_CHECKED and $toggle = 1 Then
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey5&"}")
				Sleep($_KeyDelay5&"000"/5)
		Else
				Sleep(100)
		EndIf		
		
		If $_UseKey6=$GUI_CHECKED and $toggle = 1 Then
				ControlSend($_ProcessTitle, "", "", "{"&$_QuickBarKey6&"}")
				Sleep($_KeyDelay6&"000"/6)
		Else
				Sleep(100)
		EndIf
	WEnd	
		
	 	
	Func Toggle()
	
				$_ProcessName = GUICtrlRead($ProcessName)	
				$_ProcessTitle = GUICtrlRead($ProcessTitle)	
				$_DefKey = GUICtrlRead($DefKey)	
					
				$_KeyDelay1 = GUICtrlRead($KeyDelay1)
				$_QuickBarKey1 = GUICtrlRead($QuickBarKey1)
								
 				$_KeyDelay2 = GUICtrlRead($KeyDelay2)
				$_QuickBarKey2 = GUICtrlRead($QuickBarKey2)
				
  				$_KeyDelay3 = GUICtrlRead($KeyDelay3)
				$_QuickBarKey3 = GUICtrlRead($QuickBarKey3)
				
  				$_KeyDelay4 = GUICtrlRead($KeyDelay4)
				$_QuickBarKey4 = GUICtrlRead($QuickBarKey4)	
			
  				$_KeyDelay5 = GUICtrlRead($KeyDelay5)
				$_QuickBarKey5 = GUICtrlRead($QuickBarKey5)
			
				$_KeyDelay6 = GUICtrlRead($KeyDelay6)
				$_QuickBarKey6 = GUICtrlRead($QuickBarKey6)	
			
				$_UseKey1 = GUICtrlRead($UseKey1)
				$_UseKey2 = GUICtrlRead($UseKey2)
				$_UseKey3 = GUICtrlRead($UseKey3)
				$_UseKey4 = GUICtrlRead($UseKey4)
				$_UseKey5 = GUICtrlRead($UseKey5)
				$_UseKey6 = GUICtrlRead($UseKey6)

			
		If ProcessExists($_ProcessName) and $toggle = 0 Then
				$toggle = 1
				GuiCtrlCreateLabel("Enabled", 150, 15, 75, 15)
				
				If $_UseKey1=$GUI_CHECKED Then
					$NeedToUseKey1 = "1"
				Else
					$NeedToUseKey1 = "0"
				EndIf	

				If $_UseKey2=$GUI_CHECKED Then
					$NeedToUseKey2 = "1"
				Else
					$NeedToUseKey2 = "0"
				EndIf
				
				If $_UseKey3=$GUI_CHECKED Then
					$NeedToUseKey3 = "1"
				Else
					$NeedToUseKey3 = "0"
				EndIf
							
				If $_UseKey4=$GUI_CHECKED Then
					$NeedToUseKey4 = "1"
				Else
					$NeedToUseKey4 = "0"
				EndIf
				
				If $_UseKey5=$GUI_CHECKED Then
					$NeedToUseKey5 = "1"
				Else
					$NeedToUseKey5 = "0"
				EndIf
								
				If $_UseKey6=$GUI_CHECKED Then
					$NeedToUseKey6 = "1"
				Else
					$NeedToUseKey6 = "0"
				EndIf
				
				; INI WRITE
 				
				$file = @ScriptDir & "\MyC_KeyPresser.ini"				
				IniWrite($file, "GeneralSettings", "StartStop", $_DefKey)
				
				IniWrite($file, "ProcessSettings", "ProcessName", $_ProcessName)
				IniWrite($file, "ProcessSettings", "ProcessTitle", $_ProcessTitle)
				
				IniWrite($file, "KeySettings", "QuickBarKey1", $_QuickBarKey1)
				IniWrite($file, "KeySettings", "KeyDelay1", $_KeyDelay1)
				
 				IniWrite($file, "KeySettings", "QuickBarKey2", $_QuickBarKey2)
				IniWrite($file, "KeySettings", "KeyDelay2", $_KeyDelay2)
				
  				IniWrite($file, "KeySettings", "QuickBarKey3", $_QuickBarKey3)
				IniWrite($file, "KeySettings", "KeyDelay3", $_KeyDelay3)
				
  				IniWrite($file, "KeySettings", "QuickBarKey4", $_QuickBarKey4)
				IniWrite($file, "KeySettings", "KeyDelay4", $_KeyDelay4)
 				
				IniWrite($file, "KeySettings", "QuickBarKey5", $_QuickBarKey5)
				IniWrite($file, "KeySettings", "KeyDelay5", $_KeyDelay5)
 				
				IniWrite($file, "KeySettings", "QuickBarKey6", $_QuickBarKey6)
				IniWrite($file, "KeySettings", "KeyDelay6", $_KeyDelay6)	
			
				IniWrite($file, "UseKeySettings", "UseKey1", $_UseKey1)
				IniWrite($file, "UseKeySettings", "UseKey2", $_UseKey2)
				IniWrite($file, "UseKeySettings", "UseKey3", $_UseKey3)
				IniWrite($file, "UseKeySettings", "UseKey4", $_UseKey4)
				IniWrite($file, "UseKeySettings", "UseKey5", $_UseKey5)
				IniWrite($file, "UseKeySettings", "UseKey6", $_UseKey6)

				
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey1", $NeedToUseKey1)
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey2", $NeedToUseKey2)
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey3", $NeedToUseKey3)
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey4", $NeedToUseKey4)
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey5", $NeedToUseKey5)
				IniWrite($file, "NeedToUseKeySettings", "NeedToUseKey6", $NeedToUseKey6)
			
			Else
				$toggle = 0
				GuiCtrlCreateLabel("Disabled", 150, 15, 75, 15)
		EndIf
	EndFunc	

	;========================
		
	Func Close()
		Exit 
	EndFunc
	