# Wrapper functions for Conda.
# They make conda work like virtualenvwrapper.

# Creates a new conda environment.
function mkvirtualenv {
  if [ -z $1 ]; then
    echo "usage: mkvirtualenv <envname> [package1 ... ]"
  else
    conda create -n $1 ipython spyder-app  
  fi
}

# Lists all conda environments.
function lsvirtualenv {
  if [ -z ${WORKON_HOME} ]; then
    echo "WORKON_HOME is not set."
  else
    for f in `ls ${WORKON_HOME}`; do
      echo $f
    done
  fi
}

# Deletes a conda environment.
# args: envname
function rmvirtualenv {
  if [ -z $1 ]; then
    echo "usage: rmvirtualenv <envname>"
  else
    if [ -z ${WORKON_HOME} ]; then
      echo "WORKON_HOME is not set."
    else
      rm -r ${WORKON_HOME}/$1
    fi
  fi
}

# Switches to a conda environment.
# args: envname
function workon  {
  source activate $1
}

# Exits the current conda environment.
function deactivate {
  source deactivate
}
