# ShadowPlay-Like-OBS
Simple script and guide to make OBS Studio function like ShadowPlay for Linux.

(I didn't know anywhere else to upload this)

In order to make this function, you have to use OBS Studio (https://obsproject.com/). You should be able to install it from your package manager (apt, pacman, dnf) or Flathub.

This script is really simple, it makes a directory in your Videos folder in Home named after the current active window when activated. Then, it moves anything in a folder (such as your replay) to the newly created folder.

# General Warning about X11 high refresh rate with XSHM Screen Capture
I don't fuckin' know if this is a issue with me or just OBS but some and I mean only _some_ games run at 60hz when I use XSHM screen capture with OBS. Since I use a 144hz monitor, this is annoying. If this also occurs to you, you can fix it by making manual scenes for the games where OBS will capture them with Window Capture. Of course, this wouldn't be real replay software if it didn't do that automagically. For this, use "Automatic Scene Switcher" in tools. I made a picture below to describe how I use it.

![Screenshot_20230809_115358](https://github.com/subnoticus/ShadowPlay-Like-OBS/assets/106459385/073c9d77-124e-4141-b0df-f01dcac59efd)


# Wayland Warning
I've read that there are some issues concerning keybinds with Wayland, making it so that you couldn't save a replay with OBS Studio _outside_ the app itself. If you have these issues, I do not know how to solve them as I use X11.

Though, if you really want this you could try using X11 with your machine. You should be able to choose between X11 and Wayland from the login screen. (If you use Garuda Linux or Linux Mint you should have X11 by default, and if you use Fedora it should be Wayland by default. I do not know about the other distros, so search up your distro and Wayland and browse around.)

# KDE Plasma notfication thing
If you're on Plasma, go to your notifcation settings and make sure Normal Notications appearing over fullscreen windows is checked, otherwise you won't get the notifcation a replay was saved in games.

![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/4cbfed71-ec83-454a-ab2f-018db0293a59)

# How to make it work
Simply make this script executable (via chmod +x or checking Executable in the properties of the file using your file manager) and tell your desktop manager (Plasma, GNOME, Xfce, etc) to execute it when you press a keybind or certain keyboard combination. What keybind it uses is up to you. Then, you'll have to make a folder in your Videos directory named "temp_replays" (if you wish to change the name you will have to edit the script itself) and tell OBS Studio to save it's replays/videos there.

However, in order to get it's desired effects you'll have to assign the same shortcut that OBS Studio uses to save it's replays.

# How do I make OBS Studio function like ShadowPlay?

First, we want to enable Replay Buffer, if you already know how to do this just skip this step and make sure OBS save it's videos to ~/Videos/temp_replays.

Go to your Output settings in OBS and make sure Advanced mode is on.

![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/1a8db897-0d82-4d07-ac11-84b773d538cf)

After that, go to "Replay Buffer" and turn it on. You can choose how much seconds you want saved. Though, from my experience it shaves off 4 seconds from saved replays. So, simply add 4 to whatever you want just in case.

![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/ec1c24c4-1cad-4acc-80ad-253941b8c375)

Afterwards, make sure your recording settings is set to a bitrate for whatever resoulution you want (i.e 15mbps-20mbps for 1080) and make sure the rate control is VBR.

![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/170e7606-a384-410f-85c8-327d66078dd1)

Now, assign a keyboard shortcut to save replays **(MAKE SURE THIS IS THE SAME KEYBIND YOU USE TO RUN THE SCRIPT)** . 
![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/47c8400e-a05a-4247-9a2c-db638b56b047)

Last but not least, make sure _all_ videos are saved in ~/Videos/temp_replays. 
![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/e57a0264-8a2c-4fa9-8a66-ec583c20c1e3)

Of course, you want to do a Screen Capture scene for the replay, so it captures your monitor.

After that, you should be able to use the keybind you assigned to both OBS Studio and the script to save replays and have it placed in the folder of your active window. You know it works if you see _this_ when pressing the keybind. Also, it will tell you where the video is saved.

![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/c0c9681b-79ff-48b2-ac44-b364cee3f467)

# How to make OBS Studio startup minimized and start replaying automagically?

Go to General settings and check these.
![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/b16189e5-5df6-40fa-bdee-d00ddb97fa51)

Then, make your system startup OBS Studio with the argument "--startreplaybuffer"
If you can't assign arguments to the startup process (for whatever reason) simply make your computer run "obs --startreplaybuffer" on startup. (Screenshots are for KDE Plasma)
![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/7cb35848-dd07-4492-a459-ad32b2c3b2ce)
![image](https://github.com/subnoticus/ShadowPlay-Like-Linux-Script/assets/106459385/c0715ea3-cef7-4254-a44f-38e48d3c7501)
