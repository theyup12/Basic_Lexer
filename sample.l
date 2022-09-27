
/*** Definition Section has one variable
which can be accessed inside yylex() 
and main() ***/

/* count and place to save data*/
%{
      #include <math.h>
      // int function_count = 0;
      int operators_count = 0;
      int punctuation_count = 0;
      int key_count = 0;
      int count = 0;
      int num_count = 0;
      int real_count = 0;
      int l = 0;
      int separator_count = 0;                   
      char operators[10][100];
      char punctuations[10][100];
      char identifier[10][100];
      int num[10];
      float real[10];
      char keywords[20][100];
      // unordered_set<char> operators;
      char separator[10][100];
      // char functions[20][100];
      char strings[20][100];
%}
  
/* all the pattern*/
/***([a-zA-Z_][a-zA-Z0-9_]*)/[" "][(] {
      strcpy(functions[function_count], yytext);
      function_count++;
}***/

%%
"for"|"while"|"if"|"else"|"int"|"char"|"do"|"cout"|"return"|"main" {
      strcpy(keywords[key_count], yytext);
      key_count++;
}

([a-zA-Z][0-9])+|[a-zA-Z_]* {
      strcpy(identifier[count], yytext); 
      count++;
}
"+"|"-"|"*"|" / "|"="|"<"|">"|"=="|"<="|">="|"<<" { 
    strcpy(operators[operators_count], yytext); 
    operators_count++; 
}
("//").*" "* {}
["](.*)["] {strcpy(strings[l], yytext); l++;}
[-0-9]([0-9])* {
      num[num_count]=atoi(yytext);
      num_count++;       
}
[-0-9]+"."[0-9]* {
      real[real_count]=atof(yytext);
      real_count++; 
      }
("return")([a-zA-Z0-9])*[;] {
      return 0;
}
; {
      strcpy(punctuations[punctuation_count], yytext);
      punctuation_count++;}
"("|")"|"{"|"}"|"["|"]" {
      strcpy(separator[separator_count], yytext);
      separator_count++;
}
%%
/*** Code Section prints the number of
capital letter present in the given input***/
void display(char ch[][100], int size){
      
      printf("%11s", " ");
      if(size == 0){
            printf("\n");
      }
      for(int i = 0; i < size; i++){
            printf("%s", ch[i]);
            if(i == size - 1){
                  printf("\n");
            }else{
                  printf(", ");
            }
      }
}
void displayToFile(FILE *out, char ch[][100], int size){
      fprintf(out, "%11s", " ");
      if(size == 0){
            fprintf(out, "\n");
      }
      for(int i = 0; i < size; i++){
            fprintf(out, "%s", ch[i]);
            if(i == size - 1){
                  fprintf(out, "\n");
            }else{
                  fprintf(out, ", ");
            }
      }
}
void displayNumToFile(FILE *out, int num[], int size){
      fprintf(out, "%11s", " ");
      if(size == 0){
            fprintf(out, "\n");
      }
      for(int i = 0; i < size; i++){
            fprintf(out, "%d", num[i]);
            if(i == size - 1){
                  fprintf(out, "\n");
            }else{
                  fprintf(out, ", ");
            }
      }
}
void displayNum(int num[], int size){
      printf("%11s", " ");
      if(size == 0){
            printf("\n");
      }
      for(int i = 0; i < size; i++){
            printf("%d", num[i]);
            if(i == size - 1){
                  printf("\n");
            }else{
                  printf(", ");
            }
      }
}
void displayfloat(float num[], int size){
      printf("%11s", " ");
      if(size == 0){
            printf("\n");
      }
      for(int i = 0; i < size; i++){
            printf("%f", num[i]);
            if(i == size - 1){
                  printf("\n");
            }else{
                  printf(", ");
            }
      }
}
void displayfloatToFile(FILE *out, float num[], int size){
      fprintf(out, "%11s", " ");
      if(size == 0){
            fprintf(out, "\n");
      }
      for(int i = 0; i < size; i++){
            fprintf(out, "%f", num[i]);
            if(i == size - 1){
                  fprintf(out, "\n");
            }else{
                  fprintf(out, ", ");
            }
      }
}
int yywrap(){}
int main(){
  
//open and read the file
FILE *fp;
char filename[] = "input_sourcecode.txt";
fp = fopen(filename,"r");
yyin = fp;
yylex();
//print output
printf("\ntoken                  lexeme\n");
printf("-----------------------------\n");
printf("keyword: ");
display(keywords, key_count);
printf("separator: ");
display(separator, separator_count);
printf("identifier: ");
display(identifier, count);
printf("operator: ");
display(operators, operators_count);
printf("Integer: ");
displayNum(num, num_count);
printf("real: ");
displayfloat(real, real_count);
printf("punctuation: ");
display(punctuations, punctuation_count);
printf("Strings: ");
display(strings, l);

// open file and write output into the output.txt
FILE *out_file = fopen("output.txt", "w");
fprintf(out_file, "token                  lexeme\n");
fprintf(out_file, "-----------------------------\n");
fprintf(out_file, "keyword: ");
displayToFile(out_file, keywords, key_count);
fprintf(out_file, "separator: ");
displayToFile(out_file, separator, separator_count);
fprintf(out_file, "identifier: ");
displayToFile(out_file, identifier, count);
fprintf(out_file, "operator: ");
displayToFile(out_file, operators, operators_count);
fprintf(out_file, "Integer: ");
displayNumToFile(out_file, num, num_count);
fprintf(out_file, "real: ");
displayfloatToFile(out_file, real, real_count);
fprintf(out_file, "punctuation: ");
displayToFile(out_file, punctuations, punctuation_count);
fprintf(out_file, "Strings: ");
displayToFile(out_file, strings, l);
fclose(fp);
fclose(out_file);
return 0;
}