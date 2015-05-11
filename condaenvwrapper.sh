# Wrapper functions for Conda.
# They make conda work like virtualenvwrapper.

# If _CONDA_DIR is not set, either set it to WORKON_HOME or a default value.
# Once this file has been sourced, changing WORKON_HOME won't change _CONDA_DIR.
if [ -z ${_CONDA_DIR} ]; then
  # If no WORKON_HOME is set, set it to the default Anaconda environments directory.
  if [ -z ${WORKON_HOME} ]; then
    export _CONDA_DIR=${HOME}/anaconda/envs 
  else
    export _CONDA_DIR=${WORKON_HOME}
  fi
fi

# Creates a new conda environment.
# TODO: Support requirements files.
function mkvirtualenv {
  if [ -z $1 ]; then
    echo "usage: mkvirtualenv <envname> [package1 ... ]"
  else
    conda create -n $1 ipython spyder-app  
  fi
}

# Lists all conda environments.
function lsvirtualenv {
  ls -1 ${_CONDA_DIR}
}

# Deletes a conda environment.
# args: envname
function rmvirtualenv {
  if [ -z $1 ]; then
    echo "usage: rmvirtualenv <envname>"
  else
    # If we're still in the conda env that is to be removed, exit the environment first.
    if [ "${current_env}" == "$1" ]; then
      deactivate
    fi
    # Remove the environment's directory.
    rm -r ${_CONDA_DIR}/$1
  fi
}

# cd into the conda environment's directory.
function cdvirtualenv {
  if [ -z ${_CURRENT_CONDA_ENV} ]; then
    echo "No conda environtment is active."
  else
    cd ${_CONDA_DIR}/${_CURRENT_CONDA_ENV}
  fi
}

# cd into the conda environment's site-packages directory.
# TODO: Determine active Python version.
function cdsitepackages {
  if [ -z ${_CURRENT_CONDA_ENV} ]; then
    echo "No conda environment is active."
  else
    cd ${_CONDA_DIR}/${_CURRENT_CONDA_ENV}/lib/python*/site-packages
  fi
}

# Switches to a conda environment.
# args: envname
function workon  {
  if [ -z $1 ]; then
    lsvirtualenv
  else
    if [ -d ${_CONDA_DIR}/$1 ]; then
      source activate $1
      export _CURRENT_CONDA_ENV=$1
    else
      echo "$1 does not exist."
    fi
  fi
}

# Exits the current conda environment.
function deactivate {
  source deactivate
  export _CURRENT_CONDA_ENV=""
}
