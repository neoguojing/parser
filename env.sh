conda update -n base conda
conda create -n cv python=3.7 package
conda activate cv
conda deactivate

pip install virtualenv
virtualenv --no-site-packages cv_env
cv_env/Scripts/activate
cv_env/Scripts/deactivate