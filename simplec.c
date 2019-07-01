#include <stdio.h>

int main()
{

	int   a;
  	char  buffer[10];
 	char  index = 1;
	int x = 20;

  	buffer[10]    = 1;    /* Vulnerability:   Aray index out of bound                     */
  	buffer[a]     = 'a';  /* Vulnerability:   Array index ist used before limits check    */
  	buffer[index] = '1';  /* Code smell:      'char' type used as array index             */

	
	printf("Access to an uninitialized value\n");
  	if (1 == a)           /* Bug:             Access to an uninitialized value            */
  	{
     		printf("a = 1");
	}

	printf("empty code blocks generate violations \n");
	a = 0;
	if (x != 42)
	{ /* empty code blocks generate violations */
	}

	printf("Before X = [%d]\n", x);
	x /= a;           /* Bug:             Division by zero */
	printf("After X = [%d]\n", x);
	printf("Call simplec done !!\n");
	
	return(0);
}
