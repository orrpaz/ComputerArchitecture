#include <stdio.h>
#include "pstring.h"

int main() {

	Pstring p1;
	Pstring p2;
	int len;
	int opt;
	char oldchar = 'e';
	char newchar = 'f';

	// initialize first pstring
	scanf("%d", &len);
	scanf("%s", p1.str);
	p1.len = len;
	printf("%s",p1.str);
	for (int i=0;i<=p1.len;i++) {
		if(p1.str[i] == oldchar) {
			p1.str[i] = newchar;
		 }
	}
	printf("%s",p1.str);
	// initialize second pstring
	//scanf("%d", &len);
	//scanf("%s", p2.str);
	//p2.len = len;

	// select which function to run
	//scanf("%d", &opt);
	//run_func(opt, &p1, &p2);

	return 0;
}
