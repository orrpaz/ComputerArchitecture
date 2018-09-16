#include <stdio.h>

void Sharpen(pixel *src) {

    register int i;
    register int j;
    register int dim = m;
    register int calcIndex = 0;
    register int size = dim - 1;
    pixel current_pixel, p1,p2,p3;
    register int ii;
    register int calculateIndexRuturn = 0;
    register int red;
    register int green;
    register int blue;
    register pixel *dst = (pixel *) (image->data);

    for (i = 1; i < size; ++i) {
        calcIndex += dim;
        ii = i - 1;

        for (j = 1; j < size; ++j) {
            red = 0, green = 0, blue = 0;

            calculateIndexRuturn = (ii) * (dim) + (j - 1);
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];


            red += (((int) p1.red)* (-1)) + (((int) p2.red)* (-1)) + (((int) p3.red)* (-1));
            green += (((int) p1.green)* (-1)) + ((((int) p2.green)* (-1)) + (((int) p3.green)* (-1));
            blue += (((int) p1.blue)* (-1)) + (((int) p2.blue)* (-1)) + (((int) p3.blue)* (-1));


            calculateIndexRuturn += dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += (((int) p1.red)* (-1)) + (((int) p2.red)* (9)) + (((int) p3.red)* (-1));
            green += (((int) p1.green)* (-1)) + ((((int) p2.green)* (9)) + (((int) p3.green)* (-1));
            blue += (((int) p1.blue)* (-1)) + (((int) p2.blue)* (9)) + (((int) p3.blue)* (-1));

            calculateIndexRuturn += dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += (((int) p1.red)* (-1)) + (((int) p2.red)* (-1)) + (((int) p3.red)* (-1));
            green += (((int) p1.green)* (-1)) + ((((int) p2.green)* (-1)) + (((int) p3.green)* (-1));
            blue += (((int) p1.blue)* (-1)) + (((int) p2.blue)* (-1)) + (((int) p3.blue)* (-1));

            // cut each pixel's color values to match the range [0,255]
            current_pixel.red = (min(max(red, 0), 255));
            current_pixel.green = (min(max(green, 0), 255));
            current_pixel.blue = (min(max(blue, 0), 255));
            dst[calcIndex + j] = current_pixel;
        }
    }
}