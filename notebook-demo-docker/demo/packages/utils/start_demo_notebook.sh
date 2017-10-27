set -e
bash ~/utils/start_demo.sh

source activate gdf_dl 
cd ~/pygdf
# add pygdf to path
conda develop .
cd ~/notebooks
jupyter notebook --ip=*
