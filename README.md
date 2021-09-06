# I-SOCIAL-DB
**A Labeled Database of Images Collected from Websites and Social Media for Iris Recognition**

Demonstration scripts used to evaluate the I-SOCIAL-DB, described in the paper:

    R. Donida Labati, A. Genovese, V. Piuri, F. Scotti, and S. Vishwakarma,
    "I-SOCIAL-DB: A labeled database of images collected from websites and social media for iris recognition", 
    Image and Vision Computing, vol. 105, no. 104058, January, 2021, pp. 1-9. ISSN: 0262-8856.
    DOI: 10.1016/j.imavis.2020.104058
    
Paper:

https://www.sciencedirect.com/science/article/abs/pii/S0262885620301906?via%3Dihub

Project page:<br/>
[http://iebil.di.unimi.it/ISocialDB/index.html](http://iebil.di.unimi.it/ISocialDB/index.html)

Outline:<br/>
<img src="http://iebil.di.unimi.it/ISocialDB/imgs/outline.jpg" width="600px">

Citation:

    @Article {imavis20,
    author = {R. {Donida Labati} and A. Genovese and V. Piuri and F. Scotti and S. Vishwakarma},
    title = {I-SOCIAL-DB: A labeled database of images collected from websites and social media for iris recognition},
    journal = {Image and Vision Computing},
    volume = {105},
    number = {104058},
    pages = {1-9},
    month = {January},
    year = {2021},
    note = {0262-8856},}

Main files:<br/>
- plot_I_SOCIAL.m<br/>
  MATLAB script used to plot the iris, the segmentation mask, and the circles approximating the inner and outher iris boundaries. 
- convert_JP2_to_BMP.m<br/>
  MATLAB script used to convert iris images from the JPEG2000 format to the BMP format. 
- convert_JP2_to_BMP.py<br/>
  Python script used to convert iris images from the JPEG2000 format to the BMP format.
