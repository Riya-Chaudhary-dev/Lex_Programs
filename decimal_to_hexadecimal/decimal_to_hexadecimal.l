
%{ 
	#include<stdio.h> 
    extern FILE *yyin;

	int num, r, digit=0, count, pcount=0, i; 
	char a[30]; 
%} 

DIGIT [0-9] 
%% 

{DIGIT}+ { num=atoi(yytext); 

		while(num!=0) 
		{
			r=num%16; 
			digit='0'+r; 
			if(digit>'9') 
			digit+=7; 
			a[count++]=digit; 
			num=num/16; 
		} 

		for(i=count-1;i>=pcount;--i) 
				printf("%c", a[i]); 
				pcount=count; 
		} 
%% 

int yywrap(){
    return 1;
} 

int main(int argc, char *argv[]) {
    FILE *fp=fopen(argv[1],"r");
    yyin=fp;
    yylex();
	fclose(fp);    
    return 0 ;
}
