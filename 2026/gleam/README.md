# Everybody Codes 2026 in Gleam :star: :sparkles:

## Quickstart

Everything runs from this directory. Each quest is one module in `src/` with a `main` function, so `gleam run -m <quest>` runs it. Inputs are shared between languages and live in `../inputs/<quest>/`, with one file per part (`in1.txt`, `in2.txt`, `in3.txt`) plus `ex.txt` for the example.

```shell
$ gleam run -m d1 -- 1 ../inputs/d1/in1.txt
```

Tests live in `test/<quest>_test.gleam` and usually check the example input.

```shell
$ gleam test
```

Start a file watcher and re-run a specific quest and part. For Fish shell.

```shell
$ set quest "d1"; set part 1; fd -e gleam -e txt --no-ignore . .. | entr -c -s "gleam run -m $quest -- $part ../inputs/$quest/in$part.txt"
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
[LANGUAGE: Gleam]

N lines with `tokei` when formatting with `gleam format`.

- [GitHub Repository](https://github.com/cideM/everybody_codes)
- [Topaz Paste]()
```
