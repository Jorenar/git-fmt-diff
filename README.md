`git fmt-diff`
==============

You inherited a huge codebase with thousands of commits?  
And it's an ugly mess? Now you cannot just reformat all those files?  
But you want to have future changes adhering to some sane style?  
Well, your formatter surely has some Git integration... it doesn't?  
In that case, you are in the right place!  

`git fmt-diff` shows how you could reformat just the lines touched in git commits;  
similarly to tools like [git-clang-format](https://clang.llvm.org/docs/ClangFormat.html#git-integration), but formatter agnostic.

## Dependencies

* POSIX compatible shell (e.g. [Dash](http://gondor.apana.org.au/~herbert/dash/), [Bash](https://www.gnu.org/software/bash/))
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
  -h                   display this help and exit
  --cached             view the changes you staged for the next commit relative
                       to the named <commit> (which defaults to HEAD)
  --staged             a synonym of --cached
  --color              always show colors
  --no-color           turn off colored diff
  --warn-risky-stderr  redirects warning about potential unsolicited changes in suggestions to stderr;
                       option not recommended as the warning blocks dangerous 'git apply'
```

## Installation

1. Download [git-fmt-diff](https://raw.githubusercontent.com/Jorengarenar/git-fmt-diff/master/git-fmt-diff) file
2. Set it as executable: `$ chmod +x git-fmt-diff`
3. Put it into any directory listed in `$PATH` variable

## Configuration

Configuration follows the rest of Git configuration, example `~/.gitconfig`:
```gitconfig
# ... [user], [init] etc. ...

[fmt-diff]
    formatter-c = uncrustify -l C -c .uncrustify.cfg
    map-cpp = *.ipp, *.pp
    ignore = site-packages/*, *.sh

[fmt-diff "=python"]
    ignore = true

[fmt-diff "=go"]
    formatter = gofmt

[fmt-diff "tests/*"]
    ignore = true

[fmt-diff "extern/*"]
    ignore = true

[fmt-diff "extern/lib/*.c"]
    ignore = false
    formatter = astyle --indent=tab

[fmt-diff "extern/cpp_lib/*.h"]
    ignore = false
    filetype = cpp

# ... [alias], [include] etc. ...
```

* `[fmt-diff]` - general section
  * `formatter-filetype` - formatter command for files with type `filetype`
  * `map-filetype` - comma separated list of glob patterns to map files to `filetype`
  * `ignore` - comma separated list of globs to ignore
* `[fmt-diff "=filetype"]` - configuration for `filetype`
  * `formatter` - format command for this filetype
  * `ignore` - ignore formatting for this filetype (values: `true` or `false`)
* `[fmt-diff "path/to/*/smt/*"]` - configuration for files under glob
  * `filetype` - map files matching glob to this filetype
  * `formatter` - format command for files matching this glob
  * `ignore` - ignore formatting for files matching glob (values: `true` or `false`)

Your formatter command needs to read from stdio and write to stdout.  
That implies command needing to be filename agnostic!
