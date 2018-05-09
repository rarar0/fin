# League
How I got League of Legends running on a Debian USB


#1) Install wine

```
sudo dpkg --add-architecture i386
```

```
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
```

Next add the repository to /etc/apt/sources.list or create a *.list under /etc/apt/sources.list.d/ with the following content:
```
deb https://dl.winehq.org/wine-builds/debian/ DISTRO main
```

```
sudo apt-get install --install-recommends winehq-staging
```

Ran into an error for the package apt-transport-https, just had to install it
```
E: The method driver /usr/lib/apt/methods/https could not be found.
N: Is the package apt-transport-https installed?
E: Failed to fetch https://dl.winehq.org/wine-builds/debian/dists/stretch/InRelease
```
Fix:
```
sudo apt-get install apt-transport-https
```

I was then having issues with dpkg, I followed instructions from this stackexchange thread:
https://unix.stackexchange.com/questions/160019/dpkg-cannot-find-ldconfig-start-stop-daemon-in-the-path-variable

I added the following lines to /etc/sudoers
```
Defaults env_reset
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
```

#2) Configure the wine prefix for league

```
WINEPREFIX=~/.LoL64 winecfg
```

Download the league client exe from [here](https://signup.na.leagueoflegends.com/en/signup/redownload)

Then use wine to operate the exe and install LoL
```
WINEPREFIX=~/.LoL64 wine ~/Downloads/League\ of\ Legends\ installer\ NA.exe
```

#3) Use winetricks and DirectX9 to render the game

```
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```

```
chmod +x winetricks
```
You may also need cabextract.
```
sudo apt-get install cabextract
```

Download DX9 directly to your league prefix
```
WINEPREFIX=~/.LoL64 ./winetricks d3dx9
```

After that, you need to enable CSMT. Open winecfg with the following command:
```
WINEPREFIX=~/.LoL64 winecfg
```

Finally, navigate the staging tab and enable the rendering method you chose. Next, we will make a script that simplifies launching the game. Run the following command to create the script file in the needed location.
```
sudo nano /usr/local/bin/lol64
```
Paste (ctrl+shift+V) the following script into the file:
```
#!/bin/bash
export WINEPREFIX=~/.LoL64
wine "C:/Riot Games/League of Legends/LeagueClient.exe"
```
mark it as an executable. Run the following command to do so:
```
sudo chmod +x /usr/local/bin/lol64
```

From this point forward, any time you wish to launch League, you simply need to enter this in the terminal:
```
lol64
```
