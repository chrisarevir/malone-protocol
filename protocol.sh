OUTDIR=~/.gwagon
IMG_URL=https://raw.githubusercontent.com/chrisarevir/malone-protocol/master/assets/image-2.jpg
IMG_OUT=~/.gwagon/background.jpg

unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# TODO: Figure out what to do if curl doesn't exist ^^;
# if hash curl 2>/dev/null; then
#   echo "Curl Exists!"
# fi

# TODO: Consider wget?

if [ ! -d "$OUTDIR" ]
then
  echo G Wagon, G Wagon, G Wagon, G Wagon
  mkdir "$OUTDIR"
fi

# Made the directory, now to get the image
echo  You\'re the sunflower
curl -o "$IMG_OUT" "$IMG_URL"

# osascript -e "tell application \"Finder\" to set desktop picture to \"$IMG_OUT\" as POSIX file"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$IMG_OUT\" as POSIX FILE"
