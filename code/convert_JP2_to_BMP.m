%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script converts the iris images of I-SOCIAL-DB from JP2 to BMP.
% Please modify the following variables:
%  - dirIrisJP2 = directory containing JP2 files;
%  - dirIrisBMP = directory in which the script will save BMP files;
% Authors: Ruggero Donida Labati, Angelo Genovese, Vincenzo Piuri,
% Fabio Scotti, and Sarvesh Vishwakarma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dirIrisJP2 = './I-SOCIAL-DB (online)/ocular_images/';
dirIrisBMP = './I-SOCIAL-DB (online)/ocular_images_BMP/';
mkdir(dirIrisBMP);

filesIris = dir([dirIrisJP2 '*.jp2']);

for i = 1 : numel(filesIris)
    
    fprintf(1, [filesIris(i).name '\n']);
    
    im = imread([dirIrisJP2 filesIris(i).name]);
    [C, ind] = strsplit(filesIris(i).name, '.');
    filename_BMP = [C{1} '.bmp'];
    imwrite(im, [dirIrisBMP filename_BMP]);
    
end %for i