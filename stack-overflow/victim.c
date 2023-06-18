#include <stdio.h>
#include <stdlib.h>

void getbuf() {
	char buf[12];
	gets(buf);
}

void target() {
	printf("Successful attack!\n");
	exit(0);
}

int main() {
	getbuf();
	printf("Attack failed!\n");
	return 0;
}