# condaenvwrapper

`condaenvwrapper` is to conda what `virtualenvwrapper` is to Python's virtualenv. 

The Anaconda distribution of Python includes `conda`, a tool for creating virtual environments similar to Python's `virtualenv` module. You can create virtual environments using the Anaconda GUI or `conda` on the command line. 

The `virtualenvwrapper` tool provides commands that simplify virtualenv. `condaenvwrapper` provides approximately the same set of commands for `conda`. Not all `virtualenvwrapper` commands or options are implemented as yet.

## Installation

In your `.bash_profile` file, set `WORKON_HOME` to your `conda` environment directory, which is probably `${HOME}/anaconda/envs`. Then source `condaenvwrapper.sh`.

```
export WORKON_HOME=~/anaconda/envs
source ~/condaenvwrapper/condaenvwrapper.sh   
```

## Usage

`lsvirtualenv` - Display all existing conda environments.

`mkvirtualenv *name_of_env*` - Creates a new conda environment, automatically installing ipython and spyder-app (the Spyder IDE that comes with the Anaconda distribution).

`rmvirtualenv *name_of_env*` - Deletes a conda environment with the given name.

`cdvirtualenv` - Changes to the directory of the current conda environment.

`cdsitepackages` - Changes to the site-packages directory of the current conda environment.


