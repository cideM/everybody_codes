# Everybody Codes :sparkles:

Solutions for [Everybody Codes](https://everybody.codes), organised by year and then by language.

```
2026/
  inputs/<quest>/   puzzle inputs, shared by all languages (git-ignored)
  gleam/            one Gleam project for the whole year, one module per quest
  janet/            one Janet script per quest
flake.nix           dev shell with every toolchain, enter it with `direnv allow`
```

Each year gets a fresh project per language, so old years keep building no matter how the toolchains move on. Every language directory has its own README with the commands to run and test a quest:

- [2026/gleam](2026/gleam/README.md)
- [2026/janet](2026/janet/README.md)

## Inputs

Inputs are not committed. Store them as `2026/inputs/<quest>/in<part>.txt`, one file per part, plus `ex.txt` for the example from the quest description.

## Make Reddit Code Snippet

For longer code snippets, generate a https://topaz.github.io/paste/ link. The `paste-url` script prints the link, copies it to the clipboard and opens it in the browser:

```shell
$ paste-url 2026/janet/d1/main.janet
```

Outside the dev shell: `nix run .#paste-url -- 2026/janet/d1/main.janet`.

If it's short enough, do this:

```
$ cat code | sed 's/^/    /' | xsel -b
$ cat code | sed 's/^/    /' | pbcopy
```

To copy snippets from code directly, select it and then run:

```
:'<,'>w !sed 's/^/    /' | pbcopy
```

## Disable Copilot

Add `set exrc` to your Neovim configuration, then `echo 'let g:copilot_enabled=v:false' > .nvimrc`, open the file and `:trust` it.
