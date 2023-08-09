#!/bin/sh -e

# The purpose of this script is to mimic a ShadowPlay like Replay system for Linux using OBS Studio.
# This is a modified version of the "save-replay.sh" script from gpu-screen-recorder, although this entire script uses nothing from it except the notifcation sending which is modified anyways.
# If you know any ways to make this script better or a way to include spaces in the folder name please contact me in discord using "boxinsm".
# So, this gets the name of your active window and makes a folder from it (excluding spaces) and moves your saved replay there.
# In order to make this work, all you need to do is assign this script to any keybind of your choosing, then make a folder named "temp-replays" and tell OBS Studio to save videos there.
# The script NEEDS to be run at the same time OBS Studio saves replays, so make the keybind for both saving replays in OBS Studio and this script the same.
# If you don't know how to make OBS Studio function like a replay software, search it up.
# Of course, if you want to change the name of the temp folder just change the name here in in line 17.
# If you're on KDE Plasma, change your notifcation settings to allow "Normal" notifcations to overlap to show over fullscreen windows in order to get notifcations in games.

notify-send -t 3000 -u normal -- "OBS Studio" "Replay is saving..." # This tells you when the script runs.
videopath="$HOME/Videos/"$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)"" # This gets the active window and assigns it to a variable.
withoutspaces="echo $videopath | sed 's/ //g'" # This removes spaces from the videopath if some exist
eval "$withoutspaces" >> temp # This puts the output into a temp file so that mkdir can use it alongside the rest of the script, this will be deleted later.
cat temp | xargs mkdir # mkdir uses this temp file to create a folder of the active window without spaces.
sleep 5 # This waits 5 seconds to give OBS time to encode and save the replay.
cat temp | xargs mv ~/Videos/temp_replays/* # This moves the replay from the temporary location to the new folder that was just created.
notify-send -t 5000 -u normal -- "OBS Studio" "Replay saved at $(cat temp)" # This sends a notifcation telling you where the replay is located.
rm temp # This deletes the temp file in order to not cause any overlapping folders.
