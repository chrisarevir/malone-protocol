case "${1}" in
  taylor*)
    background='taylor';;
  *)
    background='malone'
esac

echo "$background"

random_number=$((1 + RANDOM % 10))

echo "$random_number"