REM Copyleft Maxime Vanderwegen (Leroux47). This file is distributed under the terms of the GNU GPL license, as described here : https://en.wikipedia.org/wiki/GNU_General_Public_License.
@echo off
REM Activation de l'expansion retardee
setlocal enabledelayedexpansion
@title Youtube DlBatch
color F0
cls

echo.
echo 			Welcome in Youtube DL, %username% ^^!


:home
echo.
echo.
echo 				Main menu
echo.
echo 1. Download an audio file
echo 2. Download a video
echo 3. Modify audio format
echo 4. Modify video format
echo 5. Modify audio files download folder
echo 6. Modify video download folder
echo 7. Update Youtube-dl (a regular check is advised)
echo 8. Please, let me goooooo ^^!
echo.
set /p "choix=What do you want to do ? "


if !choix!==1 (
REM Creation du dossier d'enregistrement des fichiers audio et choix du dossier d'enregistrement des fichiers audio
	if not exist %cd:~0,3%"%cd:~3,100%\variables\" (
		mkdir "variables"
	)
	if not exist %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt" (
		:audioFolderInput
		echo.
		set /p "audioFolder=Please enter the path of a folder where to save your audio files : "
		if not exist !audioFolder! (
			:optionAudio
			echo.
			set /p "optionAudio=This folder doesn't seem to exist... Are you sure of your choice (y/n) ? "
			if !optionAudio!==y (
				echo !audioFolder!> %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
	   		echo.
	   		echo The folder '!audioFolder!' has been successfully selected ^^!
				if !choix!==1 (
					call :choixFormatAudio
					)
				goto choixUrlAudio
				) else if !optionAudio!==n (
REM Si l'option est non, on repose la question
					echo.
					echo Please enter a valid folder path...
					goto audioFolderInput
					) else (
REM Si l'option entree est incorrecte, on demande de corriger
						echo.
						echo Please select a valid option ^^!
						goto optionAudio
						)
			) else if exist !AudioFolder! (
REM Si le dossier est présent sur le disque, on inscrit le chemin entré por l'utilisateur dans un fichier texte
REM et ensuite on le dirige vers le choix du format audio
				echo !audioFolder!> %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
	   		echo.
	   		echo The folder '!audioFolder!' has been successfully selected ^^!
				if !choix!==1 (
					call :choixFormatAudio
					)
				)
		) else if exist %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt" (
			set /p audioFolder=< %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
			if !choix!==1 (
				call :choixFormatAudio
				)
			)
) else if !choix!==2 (
REM Creation du dossier d'enregistrement des videos
	if not exist %cd:~0,3%"%cd:~3,100%\variables\" (
		mkdir "variables"
	)
	if not exist %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt" (
		:videoFolderInput
		echo.
		set /p "videoFolder=Please enter the path of a folder where to save your videos : "
		if not exist !videoFolder! (
			:optionVideo
			echo.
			set /p "optionVideo=This folder doesn't seem to exist... Are you sure of your choice (y/n) ? "
			if !optionVideo!==y (
REM Si l'option est oui, on inscrit le chemin dans un fichier et on va choisir un format audio
				echo !videoFolder!> %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt"
	   		echo.
	   		echo The folder '!videoFolder!' has been successfully selected ^^!
				if !choix!==2 (
	 			 call :choixFormatVideo
	 			 )
				) else if !optionVideo!==n (
REM Si l'option est non, on repose la question
					echo.
					echo Please enter a valid folder path...
					goto videoFolderInput
					) else (
REM Si l'option entree est incorrecte, on demande de corriger
						echo.
						echo Please enter a valid option ^^!
						goto optionVideo
						)
			) else if exist !videoFolder! (
REM Si le dossier est présent sur le disque, on inscrit le chemin entré por l'utilisateur dans un fichier texte
REM et ensuite on le dirige vers le choix du format de la vidéo
				echo !videoFolder!> %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt"
	   		echo.
	   		echo The folder '!videoFolder!' has been successfully selected ^^!
				if !choix!==2 (
	 			 call :choixFormatVideo
	 			 )
		 )
		) else if exist %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt" (
			set /p VideoFolder=< %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt"
			if !choix!==2 (
 			 call :choixFormatVideo
 			 )
		)
	) else if !choix!==3 (
		echo.
		set /p audioFormat=< %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
		echo The current audio format is : '!audioFormat!'.
		:listeFormatAudio
			echo.
			echo List of audio formats supported by Youtube-dl
			echo.
			echo 1. mp3 ^(metadata support^)
			echo 2. aac
			echo 3. wav
			echo 4. m4a
			echo 5. flac
			echo.
			set /p "choixFormatAudio=Please select an audio format : "

			if !choixFormatAudio!==1 (
				set audioFormat=mp3
				echo !audioFormat!> %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
				echo.
				echo You've choosen the !audioFormat! format.
				if !choix!==3 (
REM Fonction declenchant l'apparition d'unz question si le choix initil de l'utilisateur etait juste de modifier le chemin du dossier d'enregistrement
					:choixMenuAudio
					echo.
					set /p "choixMenuAudio=Do you want to go back to the main menu or to download a file (m/d) ? "
					if !choixMenuAudio!==m (
						goto home
						) else if !choixMenuAudio!==d (
							if exist %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt" (
								goto choixUrlAudio
								) else (
									call :listeFormatAudio
									)
							) else (
								echo.
								echo Please select a valid option ^^!
								goto choixMenuAudio
								)
					exit /b
					) else (
						goto choixUrlAudio
						)
			) else if !choixFormatAudio!==2 (
				set audioFormat=aac
				echo !audioFormat!> %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
				echo.
				echo You've choosen the !audioFormat! format.
				if !choix!==3 (
					call :choixMenuAudio
					) else (
						goto choixUrlAudio
						)
			) else if !choixFormatAudio!==3 (
				set audioFormat=wav
				echo !audioFormat!> %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
				echo.
				echo You've choosen the !audioFormat! format.
				if !choix!==3 (
					call :choixMenuAudio
					) else (
						goto choixUrlAudio
						)
		 ) else if !choixFormatAudio!==4 (
				set audioFormat=m4a
				echo !audioFormat!> %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
				echo.
				echo You've choosen the !audioFormat! format.
				if !choix!==3 (
					call :choixMenuAudio
					) else (
						goto choixUrlAudio
						)
		 ) else if !choixFormatAudio!==5 (
				set audioFormat=flac
				echo !audioFormat!> %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
				echo.
				echo You've choosen the !audioFormat! format.
				if !choix!==3 (
					call :choixMenuAudio
					) else (
						goto choixUrlAudio
						)
		 ) else (
			 echo.
			 echo Please select a format in the list ^^!
			 goto listeFormatAudio
		 )
			exit /b
) else if !choix!==4 (
	echo.
	set /p videoFormat= < %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
	echo The current video format is : '!videoFormat!'.
	:listeFormatVideo
	echo.
	echo List of video formats supported by Youtube-dl
	echo.
	echo 1. 3gp
	echo 2. flv
	echo 3. mp4
	echo 4. ogg
	echo 5. webm ^(no conversion needed^)
	echo 6. avi
	echo 7. mkv
	echo.
	set /p "choixFormatVideo=Please select a video format : "

	if !choixFormatVideo!==1 (
		set videoFormat=3gp
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
REM Idem que :choixMenuAudio
			:choixMenuVideo
			echo.
			set /p "choixMenuVideo=Do you want to go back to the main menu or to download a file (m/d) ? "
			if !choixMenuVideo!==m (
				goto home
				) else if !choixMenuVideo!==d (
					if exist %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt" (
						goto choixUrlVideo
						) else (
							call :listeFormatVideo
							)
					) else (
						echo.
						echo Please select a valid option ^^!
						goto choixMenuVideo
						)
			exit /b
			) else (
				goto choixUrlVideo
				)
	) else if !choixFormatVideo!==2 (
		set videoFormat=flv
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
	) else if !choixFormatVideo!==3 (
		set videoFormat=mp4
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
 ) else if !choixFormatVideo!==4 (
		set videoFormat=ogg
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
 ) else if !choixFormatVideo!==5 (
		set videoFormat=webm
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
 ) else if !choixFormatVideo!==6 (
		set videoFormat=avi
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
 ) else if !choixFormatVideo!==7 (
		set videoFormat=mkv
		echo !videoFormat!> %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
		echo.
		echo You've choosen the !videoFormat! format.
		if !choix!==4 (
			call :choixMenuVideo
			) else (
				goto choixUrlVideo
				)
 ) else (
	 echo.
	 echo Please select a format in the list ^^!
	 goto listeFormatVideo
 )
 goto home
	exit /b
) else if !choix!==5 (
	if not exist %cd:~0,3%"%cd:~3,100%\variables\" (
		mkdir "variables"
	)
	if exist %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt" (
		set /p audioFolder= < %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
		echo.
		echo Audio files are currently saved in the '!audioFolder!' folder.
		)
		:changeAudioFolder
		echo.
		set /p "audioFolder=Please enter the path of a folder where to save your audio files : "
		if not exist !audioFolder! (
			:optionAudio
			echo.
			set /p "optionAudio=This folder doesn't seem to exist... Are you sure of your choice (y/n) ? "
			if !optionAudio!==y (
				echo !audioFolder!> %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
		 echo.
		 echo The '!audioFolder!' folder has been successfully selected ^^!
				goto choixUrlAudio
				) else if !optionAudio!==n (
					echo.
					echo Please enter a valid folder path...
					goto changeAudioFolder
					) else (
						echo.
						echo Please select a valid option ^^!
						goto optionAudio
						)
			) else if exist !audioFolder! (
				echo.
				echo !audioFolder!> %cd:~0,3%"%cd:~3,100%\variables\audioFolder.txt"
				echo The '!audioFolder!' folder has been successfully selected ^^!
				call :choixMenuAudio
				)
) else if !choix!==6 (
	if not exist %cd:~0,3%"%cd:~3,100%\variables\" (
		mkdir "variables"
	)
	if exist %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt" (
		set /p videoFolder=< %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt"
		echo.
		echo Video files are currently saved in the '!videoFolder!' folder.
		)
		:changeVideoFolder
		echo.
		set /p "videoFolder=Please enter the path of a folder where to save your video files : "
		if not exist !videoFolder! (
			:optionVideo
			echo.
			set /p "optionVideo=This folder doesn't seem to exist... Are you sure of your choice (y/n) ? "
			if !optionVideo!==y (
				echo !videoFolder!> %cd:~0,3%"%cd:~3,100%\variables\videoFolder.txt"
				echo.
				echo The '!videoFolder!' folder has been successfully selected ^^!
				goto choixUrlvideo
				) else if !optionVideo!==n (
					echo.
					echo Please enter a valid folder path...
					goto changeVideoFolder
					) else (
						echo.
						echo Please select a valid option ^^!
						goto optionVideo
						)
			)
			call :choixMenuVideo
) else if !choix!==7 (
	echo.
	echo Updating Youtube-dl...
	start /b /wait youtube-dl -U
	timeout /t 1 /nobreak > nul
	goto home
) else if !choix!==8 (
	echo.
	echo See you soon, %username% ^^!
	timeout /t 1 /nobreak > nul
	exit
) else (
	echo.
	echo Please select a valid option ^^!
	goto home
)


:choixFormatAudio
REM Si le format video a ete enregistre dans le fichier audioFormat, c'est qu'il existe et donc le format est lu par le script pour definir le format de sortie du fichier audio
REM Sinon, on appelle la liste des formats audio
if not exist %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt" (
	echo.
	call :listeFormatAudio
) else (
	set /p audioFormat=< %cd:~0,3%"%cd:~3,100%\variables\audioFormat.txt"
)
goto choixUrlAudio
exit /b


:choixUrlAudio
REM On demande a l'utilisateur d'entrer l'url d'un fichier audio
echo.
set /p "urlAudio=Please enter the URL of an audio file to download : "
goto audioProcessing

:audioProcessing
echo.
REM Si le format audio est "mp3", on ajoute des metadonnes, sinon non (formats non supportes)
if !audioFormat!==mp3 (
	start /b /wait %cd:~0,3%"%cd:~3,100%\youtube-dl.exe" -x --audio-format !audioFormat! -o "!audioFolder!\%%(title)s.%%(ext)s" !urlAudio! --youtube-skip-dash-manifest --embed-thumbnail --add-metadata
	) else (
		echo !audioFormat!
		start /b /wait %cd:~0,3%"%cd:~3,100%\youtube-dl.exe" -x --audio-format !audioFormat! -o "!audioFolder!\%%(title)s.%%(ext)s" !urlAudio! --youtube-skip-dash-manifest --embed-thumbnail
		)
echo.
timeout /t 2 /nobreak > nul
echo Audio file successfully downloaded ^^!
goto end


:choixFormatVideo
REM Si le format video a ete enregistre dans le fichier videoFormat, c'est qu'il existe et donc le format est lu par le script pour definir le format de sortie de la video
REM Sinon on appelle la liste des formats video
if not exist %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt" (
	echo.
	call :listeFormatVideo
) else (
	set /p videoFormat=< %cd:~0,3%"%cd:~3,100%\variables\videoFormat.txt"
)
goto choixUrlVideo
exit /b


:choixUrlVideo
REM On demande a l'utilisateur d'entrer l'url d'une video
echo.
set /p "urlVideo=Please enter the URL of a video file to download : "
goto videoProcessing

:videoProcessing
echo.
REM Si le format video est "webm", on telecharge simplement la video, sinon on demande sa conversion apres le telechargement
if !videoFormat!==webm (
	start /b /wait youtube-dl -o "!videoFolder!\%%(title)s.%%(ext)s" !urlVideo! --youtube-skip-dash-manifest --add-metadata
	) else (
		start /b /wait youtube-dl --recode-video !videoFormat! -o "!videoFolder!\%%(title)s.%%(ext)s" !urlVideo! --youtube-skip-dash-manifest --add-metadata
		)
echo.
timeout /t 2 /nobreak > nul
echo.
echo Video file successfully downloaded ^^!
goto end


:end
goto home

REM Arret de l'expansion retardee
endlocal
