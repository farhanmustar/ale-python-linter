# Ale Python Linter
A python linter plugin for [ dense-analysis/ale ](https://github.com/dense-analysis/ale/).
Ported from [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic).

- Simple python linter using the [`compile`](https://docs.python.org/3/library/functions.html#compile) function.
- Works on both python2 and python3.

## Configuration
By default this plugin will use ```python``` keyword to execute linter script.  
Therefore, to use this plugin we need to makesure python is executable by vim.

Execute this command in vim to check:
```vim
:echo executable('python')
```

Alternatively user can configure to use ```python2``` or ```python3``` keyword by adding this to ```.vimrc```:
```vim
let g:ale_python_python_executable = 'python2'
```
