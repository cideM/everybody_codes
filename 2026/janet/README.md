# Everybody Codes 2026 in Janet :keyboard: :sparkles:

## Quickstart

Everything runs from the repository root. Each quest is a script in `<quest>/main.janet` that takes the part as its only argument and reads the input from stdin. Inputs are shared between languages and live in `2026/inputs/<quest>/`, with one file per part (`in1.txt`, `in2.txt`, `in3.txt`) plus `ex.txt` for the example.

```shell
$ janet 2026/janet/d1/main.janet 1 < 2026/inputs/d1/in1.txt
```

Start a file watcher and re-run a specific quest and part. For Fish shell.

```shell
$ set quest "d1"; set part 1; fd -e janet -e txt --no-ignore | entr -c -s "janet 2026/janet/$quest/main.janet $part < 2026/inputs/$quest/in$part.txt"
```

With a LISP-y language like Janet, the recommended approach is to connect your editor to a REPL and interactively run the code. [Spork](https://github.com/janet-lang/spork) comes from the Nix flake, so no `jpm` is needed.

```shell
$ janet-netrepl
```

## Progress (1/20)

|     | Done   | Solution Comment |
| --- | ------ | ---------------- |
| 1   | :bell: |                  |
| 2   | :zzz:  |                  |
| 3   | :zzz:  |                  |
| 4   | :zzz:  |                  |
| 5   | :zzz:  |                  |
| 6   | :zzz:  |                  |
| 7   | :zzz:  |                  |
| 8   | :zzz:  |                  |
| 9   | :zzz:  |                  |
| 10  | :zzz:  |                  |
| 11  | :zzz:  |                  |
| 12  | :zzz:  |                  |
| 13  | :zzz:  |                  |
| 14  | :zzz:  |                  |
| 15  | :zzz:  |                  |
| 16  | :zzz:  |                  |
| 17  | :zzz:  |                  |
| 18  | :zzz:  |                  |
| 19  | :zzz:  |                  |
| 20  | :zzz:  |                  |

## Reddit Comment Template

See the [root README](../../README.md) for how to make a paste link.

```text
[LANGUAGE: Janet]

N lines with `tokei` when formatting with `janet-format` (from Spork).

- [GitHub Repository](https://github.com/cideM/everybody_codes)
- [Topaz Paste]()
```
