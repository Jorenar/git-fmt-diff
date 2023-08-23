`git fmt-diff`
==============

Show how lines you changed would look formatted

## Dependencies

* POSIX compatible shell (e.g. Bash)
* [Git](https://git-scm.com/)
* [Vim](https://www.vim.org/) _(optional)_ - for config-less filetype detection
* a formatter program of your choice

## Usage

See: [example usage scenario](scenario.md)

```
usage: git fmt-diff [<options>] [<commit>] [--] [<path>...]
   or: git fmt-diff [<options>] --cached [<commit>] [--] [<path>...]
   or: git fmt-diff [<options>] <commit>...<commit> [--] [<path>...]
   or: git fmt-diff [<options>] <blob> <blob>

options:
  -h               display this help and exit
  --cached         view the changes you staged for the next commit relative to
                   the named <commit> (which, if not provided, defaults to HEAD)
  --staged         a synonym of --cached
  --color          always show colors
  --no-color       turn off colored diff
  --config <file>  read config from specified file rather than $GIT_DIR/.git-fmt-diff
```

## Installation

1. Download [git-fmt-diff](https://raw.githubusercontent.com/Jorengarenar/git-fmt-diff/master/git-fmt-diff) file
2. Set it as executable: `$ chmod +x git-fmt-diff`
3. Put it into any direcory listed in `$PATH` variable

## Configuration

TODO
