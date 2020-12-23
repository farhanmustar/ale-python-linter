" Author: Farhan Mustar <farhanmustar@gmail.com>
" Description: python for python files

call ale#Set('python_python_executable', 'python')
call ale#Set('python_python_options', '')
call ale#Set('python_python_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('python_python_change_directory', 'project')
call ale#Set('python_python_auto_pipenv', 0)

let s:base_path = expand('<sfile>:p:h', 1)
let s:script_path = ale#path#GetAbsPath(s:base_path, 'script.py')
function! ale_linters#python#python#GetExecutable(buffer) abort
  " TODO: should we change to has executable?? then how to switch to python2 or python3. configurable keyword..
  return ale#python#FindExecutable(a:buffer, 'python', ['python']) && !empty(glob(s:abs))
endfunction

function! ale_linters#python#python#GetCommand(buffer) abort
  return 'python '.s:script_path.' %s'
endfunction

call ale#linter#Define('python', {
\   'name': 'python',
\   'executable': function('ale_linters#python#python#GetExecutable'),
\   'command': function('ale_linters#python#python#GetCommand'),
\   'callback': 'ale#handlers#unix#HandleAsError',
\})
