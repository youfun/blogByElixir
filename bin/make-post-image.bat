set "ID=%1"
set "TITLE=%2"

mkdir .\priv\static\images\blog 2>nul

magick ".\priv\static\images\pattern-wide.png" ^
  ( -background none -fill white -size 320x -font .\assets\static\fonts\FiraCode-SemiBold.ttf ^
     label:"bernheisel.com" ^
  ) -gravity southeast -geometry +40+20 -compose over -composite ^
  ( -background none -fill white -size 900x381 -font .\assets\static\fonts\Inter-SemiBold.otf ^
     -size 900x381 caption:"%TITLE%" ^
  ) -gravity northeast -geometry +40+0 -compose over -composite ^
  ".\assets\static\images\blog\%ID%.png"