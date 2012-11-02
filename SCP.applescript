#!/usr/bin/osascript
-- Guru Inamdar Copyright 2012.
-- The script provided as-is, use at your own risk
(*
README 
 Create new behavior in XCode (uncheck everything and go to Run -> this script)
 Make sure you save this script as text and dont open in AppleScript Editor. XCode doesnt like it
 Also you need to give +x permission to this text file.
 
 DEBUG
 Copy the script in AppleScript editor and Run from there, remote try / end try block to see errors
 if any.

*)
-- Make sure
tell application "Xcode"
	tell active workspace document
		set firstProject to (get first project)
		set projectID to (get id of firstProject)
		--set orgName to (get organization name of firstProject)
		--set projDir to (get project directory of firstProject)
		
		-- activate tab bar to find file name
		tell application "Xcode"
			activate
			set myFileName to (get name of window 1)
			tell application "System Events"
				tell application process "Xcode"
					try
						
						-- Show tab bar _Filename_
						click menu item "Show Tab Bar" of menu 1 of menu bar item "View" of menu bar 1
						-- Enter Full Screen Mode
						click menu item "Enter Full Screen" of menu 1 of menu bar item "View" of menu bar 1
						-- Show Project Navigator CMD+0
						tell menu bar 1
							tell menu bar item "View"
								tell menu "View"
									tell menu item "Navigators"
										tell menu "Navigators"
											click menu item "Show Project Navigator"
										end tell
									end tell
								end tell
							end tell
						end tell
						
						-- If its storyboad or xib open Inspector
						if myFileName contains ".storyboard" OR myFileName contains ".xib" then
							tell menu bar 1
								tell menu bar item "View"
									tell menu "View"
										tell menu item "Utilities"
											tell menu "Utilities"
												click menu item "Show Identity Inspector"
											end tell
										end tell
									end tell
								end tell
							end tell
						end if
						
					end try
				end tell
			end tell
		end tell
	end tell
end tell