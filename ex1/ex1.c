// or paz
// 311250708
// Created by or on 11/11/17.
//


/**
 * this function check if the system work with little endian or big endian
 * @return 1 it it is little and 0 otherwise
 */
int is_little_endian() {
    long x = 1;
    char *y = (char*)&x;

    if(*y == 1) {
        // it's little endian.
        return 1;
    }

    // it's big endian.
    return 0;
}

/**
 * this funcs take the lsb bit from y and replace it with the lsb bit of x
 * @param x unsigned long number
 * @param y unsigned long number
 * @return new unsigned long number which combine x and y.
 */
unsigned long merge_bytes(unsigned long x, unsigned long y) {
    // shift right. moves on byte right . last byte was removed.
    x = x >> 8;
    // put '00' on the last byte
    x = x << 8;
    //  took the first byte from y.
    y = y & 0xFF;
    return y|x;
}

/**
 * this func replace value at i place(index) with value band put it on x
 * @param x unsigned long
 * @param b unsigned char
 * @param i the index in x
 * @return x after replacement.
 */
unsigned long put_byte(unsigned long x, unsigned char b, int i) {
    // points to the beginning of the word.
    char *p = (char*)&x;
    if(is_little_endian()) {
        // moves the pointer to the i's byte.
        p=p+i;
        // change the value
        *p=b;
    }
        // big endian.
    else
    {
        int length = sizeof(x);
        //moves the pointer to the i place.
        p = p + (length-1) - i;
        //change the value.
        *p=b;
    }
    return x;
}
