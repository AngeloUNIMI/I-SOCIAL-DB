# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# This script converts the iris images of I-SOCIAL-DB from JP2 to BMP.
# Please modify the following variables:
#  - dirIrisJP2 = directory containing JP2 files;
#  - dirIrisBMP = directory in which the script will save BMP files;
# Authors: Ruggero Donida Labati, Angelo Genovese, Vincenzo Piuri,
# Fabio Scotti, and Sarvesh Vishwakarma
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# if the jpeg2k decoder is not installed, follow the instructions:
# https://stackoverflow.com/questions/44782612/pillow-and-jpeg2000-decoder-jpeg2k-not-available
# run (in python) the following commands:
# import imageio
# imageio.plugins.freeimage.download()
# run (in a conda/pip shell) the following commands:
# pip uninstall pillow
# pip install pillow


import imageio
imageio.plugins.freeimage.download()
import os
from PIL import Image

dirIrisJP2 = './I-SOCIAL-DB (online)/ocular_images/'
dirIrisBMP = './I-SOCIAL-DB (online)/ocular_images_BMP/'
if not(os.path.exists(dirIrisBMP)):
    os.makedirs(dirIrisBMP)

for filename in os.listdir(dirIrisJP2):
    print(filename)
    im = Image.open(os.path.join(dirIrisJP2, filename))
    filename_BMP = os.path.join(dirIrisBMP, filename.replace('.jp2', '.bmp'))
    im.save(filename_BMP)
    
