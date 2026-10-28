# Usage: paste-url <file>
#
# Prints a https://topaz.github.io/paste/ link for <file>, copies it to the
# clipboard and opens it in the browser. The site has no backend: it reads
# LZMA-compressed, base64-encoded text straight from the URL fragment, so
# nothing is uploaded anywhere. Wrapped by flake.nix, which supplies xz and
# coreutils (base64, tr).

if [ "$#" -ne 1 ]; then
  echo "usage: paste-url <file>" >&2
  exit 1
fi

url="https://topaz.github.io/paste/#$(xz --format=lzma -6 -c "$1" | base64 | tr -d '\n')"
printf '%s\n' "$url"

if command -v pbcopy >/dev/null; then
  printf '%s' "$url" | pbcopy
elif command -v wl-copy >/dev/null; then
  printf '%s' "$url" | wl-copy
elif command -v xsel >/dev/null; then
  printf '%s' "$url" | xsel -b
fi

if command -v open >/dev/null; then
  open "$url"
elif command -v xdg-open >/dev/null; then
  xdg-open "$url"
fi
