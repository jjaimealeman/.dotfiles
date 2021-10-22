# Thu Oct 21 06:28:21 PM MDT 2021
# https://github.com/dideler/dotfiles/blob/master/.config/fish/functions/compress.fish

function compress -d "Compress a variety of image types"
  pngquant --skip-if-larger --speed=1 --ext .png --force **.png
  find . -name '*.jpg' -type f -print | xargs -I@ jpegtran -copy none -optimize -outfile @ @
end
