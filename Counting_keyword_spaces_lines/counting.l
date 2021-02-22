%{ 
#include <stdio.h> 
int lc=1, sc=0, tc=0, ch=0, kw=0,mch=0; 
%}

%% 
int|char|bool|float|void|for|do|while|if|else|return|void {++kw;}
\n lc++; //line counter 
\t tc++; //space counter 
"//".*"\n" ch++;     //characters counter 
"/*".*[\n]*.*"*/" mch++;
%%
int yywrap() {
    return 1;
}
  
int main() 
{ 
    char fname[100]="message.txt";
    yyin = fopen(fname,"r");

    yylex();

    printf("\nNo. of keywords=%d\n", kw);
    printf("\nNo. of lines=%d", lc);   
    printf("\nNo. of spaces=%d", stc); 
    printf("\nNo. of comment=%d", ch); 
    printf("\nNo. of multiline comment=%d", mch); 
    return 0;
} 