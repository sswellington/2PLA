function result = pla(image)

im = ann(image);
im = mathematicalMorphology(image, im);
im = dbscan(im);

result = im;