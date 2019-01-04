% Developer: Wellington S. Silva
% Fluminense Northwest Institute, 
% Fluminense Federal University, Brazil

function result = mathematicalMorphology(imOrigin, imSegmented)

backup = imSegmented;

imSegmented = monochromatic(imSegmented);
imSegmented = median(imSegmented);
imSegmented = binary(imSegmented);

perimeter = round((size(imSegmented,1) + size(imSegmented,2)) * 0.02);
se =  strel('square',perimeter);
mask = imopen(imclose(imSegmented,se),se);

clear se;
clear perimeter;

imSegmented = restoration(backup, imOrigin, mask);

clear mask;
clear imOrigin;

result = imSegmented;

%% monochromatic
function result = monochromatic (image)

lineSize = size(image,1);
columnSize = size(image,2);

for i = 1 : lineSize
    for j = 1 : columnSize
        
        temp(i,j) = ( image(i,j,1)/3 + image(i,j,2)/3 + image(i,j,3)/3 ); 
    end
end

clear lineSize;
clear columnSize;

result = temp;

%% binary
function result = binary (image)

lineSize = size(image,1);
columnSize = size(image,2);

histogram = imhist(image);
threshold = (otsuthresh(histogram));

clear histogram;

for i = 1 : lineSize
    for j = 1 : columnSize
        
        if ( image(i,j) > threshold)
            
            bin(i,j) = uint8(255);
            
        else
            
            bin(i,j) = uint8(0);
            
        end
    end
end

clear lineSize;
clear columnSize;

result = bin;

%% median
function[result]= median(im)
 
lineSize = size(im,1);
columnSize = size(im,2);

swap = im;

for i = 2 : lineSize-1
    for j = 2 : columnSize-1
        
        p = 1;
        
         for x = -1 : 1
            for y = -1 : 1
                
                vector(p)=im(i+x,j+y);
                p=p+1;
            end                 
         end
         
         orderly = sort(vector);
         swap(i,j) = orderly(5);
    end
end

clear lineSize;
clear columnSize;
clear orderly;
clear vector;
clear p;

result = swap;

%% restoration
function result = restoration(im, origin, mask)

lineSize = size(mask,1);
columnSize = size(mask,2);

for i = 1 : lineSize
    for j = 1 : columnSize
        if ( (mask(i,j) == 255) )
            if  ( (im(i,j,1) == 0) && (im(i,j,2) == 0) && (im(i,j,3) == 0))
                
                im(i,j,1) = origin(i,j,1);
                im(i,j,2) = origin(i,j,2);
                im(i,j,3) = origin(i,j,3);
            end
        end
    end
end

clear lineSize;
clear columnSize;

result = im;
