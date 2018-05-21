@echo off
title Conversion de fichiers avec ffmpeg - Script par Numerica Passion
echo :: Numerica Passion - http://numericapassion.online.fr ::
echo.
echo Merci d'utiliser mon script pour convertir vos fichiers !
echo.
echo Celui-ci restera tout le temps � disposition sur le blog.
echo.
echo Surveillez l'article, au cas o� il y aurait de nouvelles mises � jour de FFmpeg
echo qui am�liorerait la vitesse et les performances de conversion !
echo.
pause

:choix_format
echo --------------------------
echo        Informations
echo --------------------------
echo - 'infos' = Informations sur le fichier
echo.
echo --------------------------
echo          Autres
echo --------------------------
echo - 'man'		= Entrez vos propres options en ligne de commande (expert)
echo - 'quit'	= Quitter
echo.
echo --------------------------
echo       Formats audio      
echo --------------------------
echo - 'mp3'		= Audio MP3 (.mp3)
echo - 'wav'		= Audio WAV (.wav)
echo - 'flac'	= Audio Free Lossless Audio Codec (.flac)
echo - 'alac'	= Audio Apple Lossless Audio Codec (.alac)
echo - 'ogg'		= OGG Vorbis (.ogg)
echo - 'ac3'		= Dolby (.ac3)
echo - 'aac'		= Advanced Audio Coding (.aac)
echo - 'wma1'	= Windows Media Video 1 (.wma)
echo - 'wma2'	= Windows Media Video 2 (.wma)
echo - 'exta'	= Extraire la piste son du fichier
echo.
echo --------------------------
echo       Formats vid�o      
echo --------------------------
echo - 'x264'	= Vid�o x264 (AVC, .mp4), aussi bien pour le web que pour la HD
echo - 'x264m'	= Vid�o x264 (AVC, .mp4) pour appareils mobiles
echo - 'webm'	= Vid�o VP8 Google WebM (nouveau)
echo - 'xvid'	= Vid�o Xvid (.avi) (DivX-like, en open-source)
echo - 'mpg'		= Vid�o mpeg simple (.mpg)
echo - 'mpg2'	= Vid�o mpeg-2 (pour DVD)
echo - 'mp4'		= Vid�o mpeg-4 basique (.mp4)
echo - 'flv'		= Flash video, pour internet (.flv)
echo - 'wmv1'	= Windows Media Video 1 (.wmv)
echo - 'wmv2'	= Windows Media Video 2 (.wmv - meilleur que wmv1...?)
echo - 'extv'	= Extraire la piste vid�o du fichier
echo - 'vfw'		= Encapsuler un .avi x264vfw dans un conteneur perso en corrigeant le d�calage + AAC
echo.
echo Pour la suite, vers quel format voulez-vous convertir votre fichier ?
echo.
echo Remontez plus haut pour savoir quoi choisir.
echo Choisissez un format puis validez. (Nom entre apostrophes sans les apostrophes)
set /p choix="Format --> "
echo.

if %choix% EQU infos (
goto %choix%

) else if %choix% EQU exta (
goto %choix%

) else if %choix% EQU quit (
cls
echo Merci d'avoir utilis� ce script batch !
echo A bient�t sur Numerica Passion !
echo - http://numericapassion.online.fr
pause
exit

) else if %choix% EQU extv (
goto %choix%

) else if %choix% EQU mp3 (
goto %choix%

) else if %choix% EQU wav (
goto %choix%

) else if %choix% EQU flac (
goto %choix%

) else if %choix% EQU alac (
goto %choix%

) else if %choix% EQU ogg (
goto %choix%

) else if %choix% EQU ac3 (
goto %choix%

) else if %choix% EQU aac (
goto %choix%

) else if %choix% EQU wma1 (
goto %choix%

) else if %choix% EQU wma2 (
goto %choix%

) else if %choix% EQU man (
goto %choix%

) else if %choix% EQU x264 (
echo :: Conversion d'un fichier vid�o avec le codec x264.
goto modifier_resolution

) else if %choix% EQU x264m (
echo :: Conversion d'un fichier vid�o avec le codec x264 ^(pour appareils mobiles^).
goto modifier_resolution

) else if %choix% EQU xvid (
echo :: Conversion d'un fichier vid�o avec le codec xvid ^(DivX open source^).
goto modifier_resolution

) else if %choix% EQU mpg (
echo :: Conversion d'un fichier vid�o en MPEG1 ^(.mpg^).
goto modifier_resolution

) else if %choix% EQU mpg2 (
echo :: Conversion d'un fichier vid�o en MPEG2 ^(DVD^).
goto modifier_resolution

) else if %choix% EQU mp4 (
echo :: Conversion d'un fichier vid�o en MP4.
goto modifier_resolution

) else if %choix% EQU flv (
echo :: Conversion d'un fichier vid�o en FLV ^(Flash Video^).
goto modifier_resolution

) else if %choix% EQU wmv1 (
echo :: Conversion d'un fichier vid�o en Windows Media Video 1 ^(.wmv^).
goto modifier_resolution

) else if %choix% EQU wmv2 (
echo :: Conversion d'un fichier vid�o en Windows Media Video 2 ^(.wmv^).
goto modifier_resolution

) else if %choix% EQU webm (
echo :: Conversion d'un fichier vid�o en WebM ^(.webm^).
goto modifier_resolution

) else if %choix% EQU vfw (
echo :: Mux de pistes
goto %choix%

) else goto choix_format

:: Infos
:infos
set /p input="Fichier --> "
cls
echo --------------------------------------------------------
"bin/ffmpeg" -i %input%
echo --------------------------------------------------------
pause
exit

:: Audio
:mp3
echo :: Conversion vers un fichier audio mp3.
echo.
set /p input="Fichier --> "
set output=%input%.mp3
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec libmp3lame -ab %bitrate% -vn %output%
echo --------------------------------------------------------
goto fin

:wav
echo :: Conversion vers un fichier audio wav.
echo.
set /p input="Fichier --> "
set output=%input%.wav
set /p frequence="- Fr�quence audio (22050, 44100...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -ac 2 -ar %frequence% -vn %output%
echo --------------------------------------------------------
goto fin

:flac
echo :: Conversion vers un fichier audio sans perte FLAC (Free Lossless Audio Codec).
echo.
set /p input="Fichier --> "
set output=%input%.flac
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f flac -acodec flac -vn %output%
echo --------------------------------------------------------
goto fin

:alac
echo :: Conversion vers un fichier audio sans perte Apple (Apple Lossless Audio Codec).
echo.
set /p input="Fichier --> "
set output=%input%.m4a
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec alac -vn %output%
echo --------------------------------------------------------
goto fin

:ogg
echo :: Conversion vers un fichier audio OGG Vorbis.
echo.
set /p input="Fichier --> "
set output=%input%.ogg
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec libvorbis -ab %bitrate% -ar 44100 -vn %output%
echo --------------------------------------------------------
goto fin

:ac3
echo :: Conversion vers un fichier audio Dolby.
echo.
set /p input="Fichier --> "
set output=%input%.ac3
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
set /p canaux="- Nombre de canaux (1 = mono - 2 = st�r�o - 6 = 5.1...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec ac3 -ab %bitrate% -ac %canaux% -vn %output%
echo --------------------------------------------------------
goto fin

:aac
echo :: Conversion vers un fichier audio AAC ^(Advanced Audio Coding^).
echo.
set /p input="Fichier --> "
set output=%input%.aac
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec libfaac -ab %bitrate% -vn %output%
echo --------------------------------------------------------
goto fin

:wma1
echo :: Conversion vers un fichier audio WMA1 ^(Windows Media Audio^).
echo.
set /p input="Fichier --> "
set output=%input%.wma
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec wmav1 -ab %bitrate% -vn %output%
echo --------------------------------------------------------
goto fin

:wma2
echo :: Conversion vers un fichier audio WMA2 ^(Windows Media Audio^).
echo.
set /p input="Fichier --> "
set output=%input%.wma
set /p bitrate="- Bitrate du fichier (constant - 128000/128k, 320000/320k...) --> "
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec wmav2 -ab %bitrate% -vn %output%
echo --------------------------------------------------------
goto fin

:: Extraction
:exta
echo :: Extraction de la piste son du fichier uniquement.
echo.
set /p input="Fichier --> "
echo - Extension/conteneur du fichier final (passez par les infos du fichier si vous ne savez pas).
set /p ext="Extension --> "
set output=%input%.%ext%
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -acodec copy -vn %output%
echo --------------------------------------------------------
goto fin

:extv
echo :: Extraction de la piste son du fichier uniquement.
echo.
set /p input="Fichier --> "
echo - Extension/conteneur du fichier final (passez par les infos du fichier si vous ne savez pas).
set /p ext="Extension --> "
set output=%input%.%ext%
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec copy -an %output%
echo --------------------------------------------------------
goto fin

:: Vid�os
:modifier_resolution
echo.
set /p modifier_resolution="- Modifier la r�solution vid�o ? (o/n) --> "
if %modifier_resolution% EQU o (
goto set_resolution

) else if %modifier_resolution% EQU n (
goto desentrelacement

) else goto modifier_resolution

:set_resolution
set /p resolution="- Largeur x hauteur (---x---) --> "
set s=-s %resolution%
goto desentrelacement

:: D�sentrelacement
:desentrelacement
echo.
set /p deinterlace="- D�sentrelacer ? (o/n) --> "
if %deinterlace% EQU o (
set desentrelacer="-deinterlace"

) else if %modifier_resolution% EQU n (
goto %choix%

) else goto deinterlace

:x264
set /p input="Fichier --> "
set /p g="Images-cl�s : (pour d�finir le taux de compression - 250 si vous ne savez pas) --> "
set /a g_min=%g% / 10
set /p crf="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output_intermediaire=%input%_tmp.mp4
set output=%input%.mp4
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f mp4 -vcodec libx264 %s% -crf %crf% -fpre "presets/libx264-custom.ffpreset" %desentrelacer% -g %g% -keyint_min %g_min% -acodec libfaac -ab 128000 %output_intermediaire%
"bin/qt-faststart" %output_intermediaire% %output%
del %output_intermediaire%
echo --------------------------------------------------------
goto fin

:x264m
set /p input="Fichier --> "
set /p g="Images-cl�s : (pour d�finir le taux de compression - 250 si vous ne savez pas) --> "
set /a g_min=%g% / 10
set /p crf="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output_intermediaire=%input%_tmp.mp4
set output=%input%.mp4
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f mp4 -vcodec libx264 %s% -crf %crf% -fpre "presets/libx264-custom.ffpreset" -level 30 %desentrelacer% -g %g% -keyint_min %g_min% -acodec libfaac -ab 128000 %output_intermediaire%
"bin/qt-faststart" %output_intermediaire% %output%
del %output_intermediaire%
echo --------------------------------------------------------
goto fin

:webm
set /p input="Fichier --> "
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output=%input%.webm
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec libvpx %s% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g 25 -keyint_min 25 -acodec libvorbis -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:mp4
set /p input="Fichier --> "
set /p r="- Fr�quence d'images par seconde --> "
set /p g="- Images-cl�s : (pour d�finir le taux de compression - 250 si vous ne savez pas) --> "
set /a g_min=%g% / 10
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output_intermediaire=%input%_tmp.mp4
set output=%input%.mp4
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f mp4 -vcodec mpeg4 -r %r% %s% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g %g% -keyint_min %g_min% -acodec libfaac -ab 128000 -ar 44100 %output_intermediaire%
"bin/qt-faststart" %output_intermediaire% %output%
del %output_intermediaire%
echo --------------------------------------------------------
goto fin

:xvid
set /p input="Fichier --> "
set /p aspect="- Aspect de la vid�o (16:9 | 4:3 | largeur:hauteur) --> "
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output=%input%.avi
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f avi -vcodec libxvid -aspect %aspect% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g 25 -keyint_min 25 -acodec libmp3lame -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:flv
set /p input="Fichier --> "
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set /p g="- Images-cl�s : (pour d�finir le taux de compression - 250 si vous ne savez pas) --> "
set /a g_min=%g% / 10
set output=%input%.flv
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -f flv -vcodec flv %s% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g %g% -keyint_min %g_min% -acodec libfaac -ab 128000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:mpg
set /p input="Fichier --> "
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output=%input%.mpg
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec mpeg1video %s% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g 25 -keyint_min 25 -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:mpg2
set /p input="Fichier --> "
set /p qscale="- Qualit� vid�o de 1 � 51 (1 = excellente, 51 = tr�s mauvaise) --> "
set output=%input%.mpg
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec mpeg2video %s% -qscale %qscale% -qmin 1 -qmax 51 %desentrelacer% -g 25 -keyint_min 25 -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:wmv1
set /p input="Fichier --> "
set /p bitrate="- Bitrate vid�o (ex : 1500k...) --> "
set output=%input%.wmv
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec wmv1 %s% -b %bitrate% %desentrelacer% -g 25 -keyint_min 25 -acodec wmav1 -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:wmv2
set /p input="Fichier --> "
set /p bitrate="- Bitrate vid�o (ex : 1500k...) --> "
set output=%input%.wmv
echo --------------------------------------------------------
"bin/ffmpeg" -i %input% -vcodec wmv2 %s% -b %bitrate% %desentrelacer% -g 25 -keyint_min 25 -acodec wmav2 -ab 160000 -ar 44100 %output%
echo --------------------------------------------------------
goto fin

:vfw
set /p video="Fichier vid�o --> "
set /p audio="Fichier audio --> "
set aac=%audio%.aac
echo --------------------------------------------------------
"bin/ffmpeg" -i %audio% -acodec libfaac -ar 44100 -ab 128000 %aac%
"bin/MP4Box" -add %video% -add %aac% %audio%.mp4
del %aac%
echo --------------------------------------------------------
goto fin

:: Manuel
:man
echo :: Conversion manuelle
echo.
echo - Note : le fichier de d�p�t n'est PLUS pris en compte.
echo Vous devrez sp�cifier la source ^(-i "C:\input.avi"^) et le fichier converti
echo ^("C:\output.avi" � la fin de la ligne de commande^).
echo.
set /p cli=""bin/ffmpeg" "
echo --------------------------------------------------------
"bin/ffmpeg" %cli%
echo --------------------------------------------------------
goto fin

:: Fin
:fin
pause
echo.
echo :: Op�ration termin�e ! ::
echo Le fichier converti se trouve dans le m�me dossier que le fichier d'origine.
echo.
echo Vous pouvez remonter pour jeter un coup d'oeil sur les r�glages utilis�s.
echo.
echo Merci d'avoir utilis� ce script de conversion !
echo N'h�sitez pas � le partager autour de vous !
echo.
echo Surveillez l'article relatant "bin/ffmpeg" sur le blog, au cas o�
echo il y aurait de nouvelles mises � jour qui pourraient
echo am�liorer la vitesse et les performances de conversion !
echo.
echo Script batch �crit et disponible sur Numerica Passion
echo - http://numericapassion.online.fr
echo.
pause
exit