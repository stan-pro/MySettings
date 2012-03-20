" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

python << EOF
import os
import sys
import vim
for p in sys.path:
  # Add each directory in sys.path, if it exists.
  if os.path.isdir(p):
    # Command 'set' needs backslash befor each space.
    vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
