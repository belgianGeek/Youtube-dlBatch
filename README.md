# Introduction
This project aims to complete [Youtube-dl](https://github.com/rg3/youtube-dl) by providing a minimalistic graphical interface written in Batch.

![youtube-dlBatch](https://raw.githubusercontent.com/Leroux47/youtube-dlBatch/master/Screenshots/youtube-dlBatch.JPG)

This file allows you to use all the basic features of Youtube-dl, namely the download of audio and video files. These files are enriched with metadata (track/video title, artist(s), etc.) during the download.

Then, the downloaded files are placed into the folder `C:\Users\<username>\Music` by the use of the `xcopy` command.

# Installation

Before being able to use this script, there are some prerequisites :
1. You should have downloaded Youtube-dl (the latest version is available [here](https://github.com/rg3/youtube-dl/releases)). You just have to download the `youtube-dl.exe` file of the latest commit. If you already have Youtube-dl, you can update it. To do it, just go into the folder where it is saved and run the `youtube-dl -U` command in the console.

2. You should also have downloaded [FFMPEG](https://ffmpeg.zeranoe.com/builds/) to extract and process audio files. You can download it by clicking on the _Download build_ button available on the download page. You will obtain a `.zip` archive from which you should extract only the `bin` folder content. Once don,e place it in the same folder as `Youtube-dl`.

This isn't as difficult as it seems, don't be afraid XD.

# Download and use of Youtube-dlBatch

Once the files mentioned above are downloaded, place them into the same folder.

Then, download the latest version of the repo and extract it in that same folder. It is **hugely important** to save the `.bat` file into the **ANSI** characters encoding, unless it won't work correctly.

To enjoy the use of the script and Youtube-dl, all you have to do is follow the `.bat` file and follow the instructions on the screen.

# How to contribute

You can contribute to this project by reporting a bug, by opening an [issue](https://github.com/Leroux47/youtube-dlBatch/issues), or by working on your side and then suggest a [pull request](https://github.com/Leroux47/youtube-dlBatch/pulls).

# Okay, got it... But, tell me, why did you put an icon in your repo ?

With this beautiful icon-I-didn't-have-stolen-to-Soundcloud (or another of your choice), you can create a lovely shortcut to the batch file and access it rapidly. Please remember that the `.bat` file must **imperatively** be saved in the same folder as `Youtube-dl` and its dependencies.

# Any idea or question ?

Don't hesitate to [email](mailto:maximevanderwegen@disroot.org?subject=Youtube-dlBatch) me or to contact me through [Diaspora](https://framasphere.org/people/cbfed5b0085301363dc82a0000053625), I'd be glad to discuss with you.

# License

All the content of this repo is placed under the [GNU-GPL](https://en.wikipedia.org/wiki/Licence_publique_g%C3%A9n%C3%A9rale_GNU) license. You can copy, modify or duplicate this code as your will.

