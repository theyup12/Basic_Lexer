https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/

# Build a Lexer
# CPSC 323 - Compilers & Languages 

Team Members:
Andy Cao: dongyicao123@csu.fullerton.edu 

## Project Description
Build a Lexer. Lexical analysis is the process of reading in the stream of 
characters making up the source code of a program and dividing the input into 
tokens. Use the Flex (a fast lexer generator) to generate a lexer.

## Project Requirements
This project will run using Tuffix 2020 using Flex on Ubuntu Linux (Tuffix) and will be implemented using flex and C program.

## Project files: 
 * input_sourcecode.txt
 * output.txt
 * sample.l
 * readme.md 

## Run the Program
### 1. install Ubuntu or VM and install flex by typing below command on the Ubuntu Terminal:
    sudo apt-get update
    sudo apt-get install flex

### 2. go to the folder that contains the source code :
    example:  cd Users/Desktop/PA1

### 3. type the command below to run the program : 
    Step 1: lex sample.l
    Step 2: gcc lex.yy.c
    Step 3: ./a.out