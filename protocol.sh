case "${1}" in
  taylor*)
    background='taylor'
    number=$((1 + RANDOM % 2))
    ;;
  *)
    background='malone'
    number=$((1 + RANDOM % 5))
esac

OUTDIR=~/.gwagon
IMG_URL="https://raw.githubusercontent.com/chrisarevir/malone-protocol/master/assets/$background-$number.jpg"
IMG_OUT=~/.gwagon/background.jpg

# echo $IMG_URL

unameOut="$(uname -s)" 

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

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
