;---------------------------------------------------------------------------------------------------
;
; ProcHelp32 - (c) 2020 atom0s [atom0s@live.com]
;
; Website: https://atom0s.com/
; Donate : https://paypal.me/atom0s 
; Discord: atom0s#0001
;
;
; For use with Final Fantasy XI third-party tools. (Should work on all applications if desired.)
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; What is prochelp32?
;---------------------------------------------------------------------------------------------------
;
; ProcHelp32, short for Process Helper 32bit, is a simple helper hook that is injected into other
; applications (third-party tools) allowing for helpful modifications. The usages for this library 
; will grow and change as time goes on and the needs of the community shift. 
;
; At this time, this libraries main focus is to bypass renamed bootloader nonsense with various
; private servers. A lot of valid and useful third-party applications for FFXI are extremely old
; and hard-coded to look for 'pol.exe' when trying to communicate with the game client. Certain
; private-servers are attempting to block a small subset of third-party tools used for cheating,
; all while blocking a larger set of useful and valid tools. This library fixes that.
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; What features does prochelp32 contain?
;---------------------------------------------------------------------------------------------------
;
; The features of this library are currently:
;
;   1. Running Process Renaming
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; Does this alter the game / bootloader?
;---------------------------------------------------------------------------------------------------
;
; This tool DOES NOT touch the game, or any of its files. It does not touch any bootloader either.
;
; You inject this tools hook (prochelp32.dll) into a third-party tool, not the game. All the work
; is done inside the third-party tool, leaving the game and bootloader completely untouched by this 
; hook. (The third-party tool you inject into may alter the game, its files or the bootloader itself,
; but this hook/tool does not.)
;
;---------------------------------------------------------------------------------------------------
; Is this tool safe?
;---------------------------------------------------------------------------------------------------
;
; Yes, this tool itself is completely safe. However, the third-party tools you wish to use it with
; may not be. Only use this with tools/files you trust! 
;
; Third-party applications that are used with this tool can lead to you getting banned on any server.
;
; Always use caution when using any third-party tools regardless of what they do. Be sure to adhere to
; your servers (retail or private servers) rules when applicable and understand that you use this and 
; any third-party tools at your own risk.
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; Requirements
;---------------------------------------------------------------------------------------------------
;
; In order to use this you need the latest MSVC++ Runtime which can be downloaded here:
; https://aka.ms/vs/16/release/vc_redist.x86.exe
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; Contact Me
;---------------------------------------------------------------------------------------------------
;
; Feel free to contact me on Discord. (Support, questions, feature requests, broken applications,
; and so on. I will adjust this as needed to work with any third-party applications.)
;
; Discord: atom0s#0001
;
;---------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------
; Donations
;---------------------------------------------------------------------------------------------------
;
; Want to say thanks for my work? Feel free to donate here: https://paypal.me/atom0s
;
;---------------------------------------------------------------------------------------------------