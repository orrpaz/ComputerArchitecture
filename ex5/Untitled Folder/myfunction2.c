//311250708 or paz

typedef struct {
    unsigned char red;
    unsigned char green;
    unsigned char blue;
} pixel;


/* Compute min and max of two register integers, respectively */
#define min(a, b) ((a < b ? a : b))
#define max(a, b) ((a > b ? a : b))


// this method responssible to make the picture more blur 
void Blur(pixel *src) {

//register it's a hint to the compiler that the variable will be heavily used and recommend it be kept in a processor register if possible.
    register int i;
    register int j;
    register int dim = m;
    register int calcIndex = 0;
    register int size = dim - 1;
    register int ii;
    register int calculateIndexRuturn = 0;
    // replace struct to register int.
    register int red;
    register int green;
    register int blue;
    register pixel *dst = (pixel *) (image->data);
    pixel current_pixel, p1,p2,p3;

    for (i = 1; i < size; ++i) {
        calcIndex += dim;
        ii = i - 1;

        for (j = 1; j < size; ++j) {
            red = 0, green = 0, blue = 0;

            // calc.
            calculateIndexRuturn = (ii) * (dim) + (j-1);
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += ((int) p1.red);
            red += ((int) p2.red);
            red += ((int) p3.red);
            green += ((int) p1.green);
            green += ((int) p2.green);
            green += ((int) p3.green);
            blue += ((int) p1.blue);
            blue += ((int) p2.blue);
            blue += ((int) p3.blue);


            // add dim to calculateIndexRuturn 
            calculateIndexRuturn +=dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += ((int) p1.red);
            red += ((int) p2.red);
            red += ((int) p3.red);
            green += ((int) p1.green);
            green += ((int) p2.green);
            green += ((int) p3.green);
            blue += ((int) p1.blue);
            blue += ((int) p2.blue);
            blue += ((int) p3.blue);

            // add dim to calculateIndexRuturn 
            calculateIndexRuturn +=dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += ((int) p1.red);
            red += ((int) p2.red);
            red += ((int) p3.red);
            green += ((int) p1.green);
            green += ((int) p2.green);
            green += ((int) p3.green);
            blue += ((int) p1.blue);
            blue += ((int) p2.blue);
            blue += ((int) p3.blue);

            current_pixel.red = red / 9;
            current_pixel.green = green / 9;
            current_pixel.blue = blue / 9;
            dst[calcIndex + j] = current_pixel;
        }

    }

}

// this method responssible to make the picture more Sharp 
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

            red += ((int) p1.red) * (1);
            red += ((int) p2.red) * (1);
            red += ((int) p3.red) * (1);
            green += ((int) p1.green) * (1);
            green += ((int) p2.green) * (1);
            green += ((int) p3.green) * (1);
            blue += ((int) p1.blue) * (1);
            blue += ((int) p2.blue) * (1);
            blue += ((int) p3.blue) * (1);

            calculateIndexRuturn += dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += ((int) p1.red) * (1);
            green += ((int) p1.green) * (1);
            blue += ((int) p1.blue) * (1);
            red += ((int) p2.red) * (-9);
            green += ((int) p2.green) * (-9);
            blue += ((int) p2.blue) * (1);
            red += ((int) p3.red) * (1);
            green += ((int) p3.green) * (1);
            blue += ((int) p3.blue) * (1);

            calculateIndexRuturn += dim;
            p1 = src[calculateIndexRuturn];
            p2 = src[calculateIndexRuturn + 1];
            p3 = src[calculateIndexRuturn + 2];

            red += ((int) p1.red) * (1);
            green += ((int) p1.green) * (1);
            blue += ((int) p1.blue) * (1);
            red += ((int) p2.red) * (1);
            green += ((int) p2.green) * (1);
            blue += ((int) p2.blue) * (1);
            red += ((int) p3.red) * (1);
            green += ((int) p3.green) * (1);
            blue += ((int) p3.blue) * (1);

            // truncate each pixel's color values to match the range [0,255]
            current_pixel.red = (min(max(red, 0), 255));
            current_pixel.green = (min(max(green, 0), 255));
            current_pixel.blue = (min(max(blue, 0), 255));
            dst[calcIndex + j] = current_pixel;
        }

    }
}


void copyPixels(pixel* dst) {

    pixel *src = (pixel*)(image->data);
    register int nLocal = n;
    register int mLocal = m;
    register int row;
    register int col;
    register int rowMulN = nLocal*mLocal;
    register int row_mul_n_minus_col =0;
    for (row = mLocal ; row > 0 ; --row) {
        for (col = nLocal ; col > 0 ; --col) {
            row_mul_n_minus_col = rowMulN-col;
            dst[row_mul_n_minus_col]= src[row_mul_n_minus_col];
        }
        rowMulN-=nLocal;
    }
}



void myfunction(Image *image, char *srcImgpName, char *blurRsltImgName, char *sharpRsltImgName) {

    register int nLocal = n;
    register int mLocal = m;
    pixel *pixelsImg = malloc((nLocal * mLocal) * sizeof(pixel));

    copyPixels(pixelsImg);

    Blur(pixelsImg);

    // write result image to file
    writeBMP(image, srcImgpName, blurRsltImgName);

    // sharpen the resulting image

    copyPixels(pixelsImg);

    Sharpen(pixelsImg);


    // write result image to file
    writeBMP(image, srcImgpName, sharpRsltImgName);

    free(pixelsImg);
}