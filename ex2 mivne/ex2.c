/*
 *  Or Paz
 *  311250708
*/

#include <stdio.h>
#include <memory.h>

typedef void (*functionPtr)(char*,char*);
typedef enum specialChar {
    eNone = 0x0,
    eWin = 0x000d000a,
    eMac = 0x000d,
    eLinux = 0x000a

} specialChar;
/**
 * this func copy file from source to destantion.
 * @param src - source file.
 * @param dst - destantion file.
 */
void copyWithoutFlags (FILE* src, FILE* dst);
/**
 * this func copy file from source to destantion but we want to save destantion file in another os.
 * @param src - source file.
 * @param dst - destantion file.
 * @param os1 - the os that src file was create - part of argument.
 * @param os2 - the os that dst file was create - part of argument.
 * @param pFunc - pointer to function (swap, keep or dump)
 */
void copyBetweenOS(FILE* src, FILE* dst, char* osSrc, char* osDst , functionPtr pFunc);
/**
 * this function check the os was inserted and return the new line encoding that belong to os.
 * @param osSrc - the os that src file was create
 * @param osDst - the os that dst file was create
 * @param src - source file.
 * @param dst - destantion file.
 */
void checkSpecial(char* osSrc,char* osDst, specialChar* src, specialChar* dst);
/**
 * this func swap between 2 argument by adress.
 * @param a - argument type char*
 * @param b - argument type char*
 */
void swap(char* a, char* b);
/**
 * this func check how much os args insert.
 * @param argv -parameters
 * @return the number of os args.
 */
int CheckOsArgValid(char* argv[]);
/**
 * this func check how much files args insert.
 * @param argv -parameters
 * @return the number of files args.
 */
int CheckFilesArgValid(char* argv[]);

/**
 * do noting. for '-keep' insertion.
 * @param a - argument type char*
 * @param b - argument type char*
 */
void keep(char* a, char* b);
/**
 * do noting. for mission 2 .
 * @param a - argument type char*
 * @param b - argument type char*
 */
void dump(char* a, char* b);
/**
 * this func check if the source file was written in little endian or big
 * @param s - char* s (array of 2)
 * @return return 1 if is little and 0 if is it big.
 */
int is_file_little_endian(char* s);



int CheckFilesArgValid(char* argv[])
{
    int count = 0;
    char *p1=NULL, *p2=NULL;
    if(argv[1] && argv[2]) {
        // search '.' in args
        p1 = strstr(argv[1], ".");
        p2 = strstr(argv[2], ".");
    }
    if(p1 && p2)
    {
        count = 2;
    }
    return count;
}

int CheckOsArgValid(char* argv[]) {
    int count = 0;
    if (argv[3] != NULL) {
        // count the os that insert
        count += !strcmp(argv[3], "-win");
        count += !strcmp(argv[3], "-mac");
        count += !strcmp(argv[3], "-unix");
    }
    if (argv[4] != NULL) {
        count += !strcmp(argv[4], "-win");
        count += !strcmp(argv[4], "-mac");
        count += !strcmp(argv[4], "-unix");
    }
    return count;
}

void swap(char* a, char* b)
{
    char temp = *a;
    *a = *b;
    *b = temp;
}

void keep(char* a, char* b)
{
    return;
}

void dump(char* a, char* b)
{

    return;
}

int is_file_little_endian(char* s) {

    if(s[1] == -1)
    {
        return 0;
    }
    return 1;
}

void checkSpecial(char* osSrc,char* osDst, specialChar* src, specialChar* dst) {
    // check which symbol of os was insert.
    if (!strcmp(osSrc, "-win")) {
        *src = eWin;
    }
    else if (!strcmp(osSrc, "-mac")) {
        *src = eMac;
    }
    else if (!strcmp(osSrc, "-unix")) {
        *src = eLinux;
    }
    // check which symbol of os we want to convert.
    if (!strcmp(osDst, "-win")) {
        *dst = eWin;
    }
    else if (!strcmp(osDst, "-mac")) {
        *dst = eMac;

    }
    else if (!strcmp(osDst, "-unix")) {
        *dst = eLinux;

    }
}


void copyWithoutFlags(FILE* src, FILE* dst) {
    char buffer[2];
    size_t bytes;
    // regular copy.
    while( 0 < (bytes=fread(buffer, sizeof(char), 2, src))) {
        fwrite(buffer, sizeof(char), bytes, dst);
    }
}
//int islitel( char* buffer, int *isendline, src, dst)
//{
//    int retval = 0;
//    if( (buffer[0] == 0x0a || buffer[0] == 0x0d) && buffer[1] == 0x0  )
//    {
//        retval = 1;
//    }
//    else if()
//}

void copyBetweenOS(FILE* src, FILE* dst,char* osSrc, char* osDst, functionPtr pFunc) {
    char buffer[2];
    char temp[2];
    size_t bytes;
//    size_t endFile=0;
    specialChar src1 = eNone;
    specialChar dst1 = eNone;
    checkSpecial(osSrc, osDst, &src1, &dst1);
//    while (!endline){
//        bytes = fread(buffer, sizeof(char), 2, src);
//        endline = isendline(buffer);
//        if(!endline)
//        {
//            pFunc(&buffer[0], &buffer[1]);
//            fwrite(buffer, sizeof(char), bytes, dst);
//        }
//}

    bytes = fread(buffer, sizeof(char), 2, src);
    if (!is_file_little_endian(buffer))
    {
        // big endian.
        pFunc(&buffer[0],&buffer[1]);
        fwrite(buffer, sizeof(char), bytes, dst);
        while (fread(buffer, sizeof(char), bytes, src)) {
//            if()
            if (src1 != dst1) {
                // if the first argument of os is -win
                if( (buffer[0] == 0x0a || buffer[0] == 0x0d) && buffer[1] == 0x0  )
                {

                }
                if (src1 == eWin) {
                    if (buffer[1] == 0x0d) {
                        fread(temp, sizeof(char), bytes, src);
                        // we want dont lose the previous char therefore we save in temp.
                        if (temp[1] == 0x0a) {
                            buffer[0] = 0;
                            buffer[1] = dst1;
                        } else {
                            /* pointer to function . in mission 2 enter 'dump' function
                             in mission 3 we insert swap/keep function */
                            pFunc(&buffer[0], &buffer[1]);
                            fwrite(buffer, sizeof(char), bytes, dst);
                            buffer[0] = temp[0];
                            buffer[1] = temp[1];
                        }
                    }
                    pFunc(&buffer[0], &buffer[1]);
                    fwrite(buffer, sizeof(char), bytes, dst);
                    // if the second argument of os is -win

                } else if (dst1 == eWin) {
                    // write the encoding new line to file.
                    if (buffer[1] == eMac || buffer[1] == eLinux) {
                        buffer[1] = 0x0d;
                        buffer[0] = 0x00;
                        pFunc(&buffer[0], &buffer[1]);
                        fwrite(buffer, sizeof(char), bytes, dst);
                        buffer[1] = 0x0a;
                        buffer[0] = 0x00;
                        pFunc(&buffer[0], &buffer[1]);
                        fwrite(buffer, sizeof(char), bytes, dst);

                    } else {
                        pFunc(&buffer[0], &buffer[1]);
                        fwrite(buffer, sizeof(char), bytes, dst);
                    }
                    // if dst OS isn't windows
                } else {
                    if (buffer[1] == src1) {
                        buffer[0] = 0;
                        buffer[1] = dst1;
                    }
                    pFunc(&buffer[0], &buffer[1]);
                    fwrite(buffer, sizeof(char), bytes, dst);
                }
            }
                // if src is equal to dst (same OS)
            else
            {
                pFunc(&buffer[0], &buffer[1]);
                fwrite(buffer, sizeof(char), bytes, dst);
            }
        }

    }
        // little endian
    else
    {
        pFunc(&buffer[0],&buffer[1]);
        fwrite(buffer, sizeof(char), bytes, dst);
        while (fread(buffer, sizeof(char), bytes, src))
        {
            if(src1 != dst1) {
                // if the first argument of os is -win
                if (src1 == eWin) {
                    if (buffer[0] == 0x0d) {
                        fread(temp, sizeof(char), bytes, src);
                        // we want dont lose the previous char therefore we save in temp.
                        if (temp[0] == 0x0a) {
                            buffer[1] = 0x00;
                            buffer[0] = dst1;
                        } else {
                            pFunc(&buffer[0], &buffer[1]);
                            fwrite(buffer, sizeof(char), bytes, dst);
                            buffer[0] = temp[0];
                            buffer[1] = temp[1];
                        }
                    }
                    pFunc(&buffer[0], &buffer[1]);
                    fwrite(buffer, sizeof(char), bytes, dst);
                    // if the second argument of os is -win

                } else if (dst1 == eWin) {
                    // write the encoding new line to file.

                    if (buffer[0] == eMac || buffer[0] == eLinux) {
                        buffer[0] = 0x0d;
                        buffer[1] = 0x00;
                        pFunc(&buffer[0], &buffer[1]);
                        fwrite(buffer, sizeof(char), bytes, dst);
                        buffer[0] = 0x0a;
                        buffer[1] = 0x00;
                        pFunc(&buffer[0], &buffer[1]);

                        fwrite(buffer, sizeof(char), bytes, dst);

                    } else {
                        pFunc(&buffer[0], &buffer[1]);

                        fwrite(buffer, sizeof(char), bytes, dst);
                    }
                }
                    // if dst OS isn't windows
                else
                {
                    if (buffer[0] == src1) {
                        buffer[1] = 0;
                        buffer[0] = dst1;
                    }
                    pFunc(&buffer[0], &buffer[1]);

                    fwrite(buffer, sizeof(char), bytes, dst);
                }
            }
                // if src is equal to dst (same OS)
            else
            {
                pFunc(&buffer[0], &buffer[1]);
                fwrite(buffer, sizeof(char), bytes, dst);
            }
        }
    }
}




int main(int argc, char *argv[]) {
    FILE *src = NULL;
    FILE *dst = NULL;
    functionPtr pFunc;
    int osCount = CheckOsArgValid(argv);
    int filesCount = CheckFilesArgValid(argv);

    if (filesCount == 2) {
        src = fopen(argv[1], "rb");
        if (src == NULL) {
            return 0;
        }
        //open dst
        dst = fopen(argv[2], "wb");
        if (dst == NULL) {
            return 0;
        }
        switch (argc) {
            //mission1
            case 3:
                copyWithoutFlags(src, dst);
                break;
            case 5:
                // mission 2.
                if (osCount == 2) {
                     pFunc = &dump;
                    if (strcmp(argv[3], argv[4]) == 0) {
                        copyWithoutFlags(src, dst);
                    } else {
                        copyBetweenOS(src, dst, argv[3], argv[4], dump);
                    }
                    break;
                    case 6:
                        // mission 3
                    {
                        pFunc = &dump;
                        if (!strcmp(argv[5], "-keep")) {
                            pFunc = &keep;
                        } else if (!strcmp(argv[5], "-swap")) {
                            pFunc = &swap;
                        }
                            copyBetweenOS(src, dst, argv[3], argv[4], pFunc);
                       }
                        break;
                    }
                    default:
                        break;

                }
                fclose(src);
                fclose(dst);
                return 0;
        }
    }



