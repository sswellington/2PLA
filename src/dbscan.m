function result = dbscan(im)

imagePerimeter = ((size(im,1) * size(im,2)) / 5) ^ (1/2);

[l, Am, Sp] = slic(im, imagePerimeter, 10, 1, 'median');

lc = spdbscan(l, Sp, Am, (6/200), 1);

result = ((drawregionboundaries(lc, im, [255 255 255])));
