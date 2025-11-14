# project4
Arbitrary Precision Calculator (APC)
The Arbitrary Precision Calculator (APC) is a C-based tool designed to handle mathematical operations on very large integers — far beyond the limits of standard C data types. Instead of storing numbers in normal integer variables, APC represents each number as a doubly linked list, where every node holds a single digit. This unique approach allows the program to perform arithmetic operations like addition, subtraction, multiplication, and division with perfect accuracy, no matter how big the numbers get.
Overview
APC reads large numbers as strings and then converts them into linked lists, storing one digit per node. Arithmetic is done digit by digit — just like how you’d solve problems manually on paper.
Makefile
The Makefile simplifies the compilation process. Here's what each part does:
• CC = gcc — Uses the GCC compiler to build the program.
• CFLAGS = -Wall -Werror -g — Enables warnings, treats them as errors, and adds debug symbols.
• OBJ — Lists all object files created during compilation.
• TARGET = calc — Defines the name of the final executable.
Core Operations
Addition
Addition starts from the least significant digits (the end of each list). A carry value is maintained for sums over 9. The result digits are added to the front of the result list until all digits and carries are processed.
Subtraction
Before subtraction, the program checks which number is larger to handle negative results properly. It subtracts digit by digit from the least significant side, using a borrow if needed, and removes any unnecessary leading zeros at the end.
Multiplication
Multiplication is handled using nested loops: each digit of one number is multiplied by each digit of the other. Zeros are added for place values, carries are tracked carefully, and all partial results are added together to get the final product.
Division
For division, APC checks for division by zero first. It builds the dividend step by step, determines each quotient digit through repeated subtraction of the divisor, and finally provides both quotient and remainder results.
Header File (apc.h)
The header file includes all necessary libraries (stdio.h, stdlib.h, string.h, ctype.h) and defines key constants such as SUCCESS = 0 and FAILURE = -1. It also declares the Dlist structure used for the linked list representation and lists all function prototypes for utilities and arithmetic operations.
Utility Functions (common.c)
This file includes helper functions used across the project, such as:
• convert_to_list — Converts a string into a doubly linked list of digits.
• find_bigger — Compares two numbers and returns the larger one.
• insert_at_first / insert_at_last — Add digits at the start or end of a list.
• compare_lists — Compares two lists digit by digit.
• print_list — Prints the number properly, including the sign.
• delete_list — Frees the memory occupied by a linked list.
Driver Program (main.c)
The main program accepts command-line inputs: two large numbers and an arithmetic operator (+ , - , x , /). It converts the numbers into linked lists, manages positive/negative signs, and then calls the appropriate function to perform the calculation. For division, it displays both quotient and remainder. Memory is cleaned up after each operation.
Summary
In essence, APC mimics long-hand arithmetic — breaking down numbers into individual digits and performing operations step by step. By relying on linked lists, it completely avoids overflow issues and can handle integers of virtually unlimited size.

output:
Addition
./calc 123 + 123  
Result: 246  

./calc -123 + -123  
Result: -246  

./calc -123 + 123  
Result: 0  

./calc 123 + -123  
Result: 0

Subtraction
./calc 123 - 123  
Result: 0  

./calc 123 - -123  
Result: 246  

./calc -123 - 123  
Result: -246  

./calc -123 - -123  
Result: 0

Multiplication
./calc 12 x 12  
Result: 144  

./calc 12 x -12  
Result: -144  

./calc -12 x 12  
Result: -144  

./calc -12 x -12  
Result: 144  

./calc -12 x 0  
Result: 0

Division
./calc 123 / 10  
Quotient: 12  
Remainder: 3  

./calc 123 / -10  
Quotient: -12  
Remainder: 3  

./calc -123 / -10  
Quotient: 12  
Remainder: -3  

./calc -123 / 10  
Quotient: -12  
Remainder: -3  

./calc 12 / 12  
Quotient: 1  
Remainder: 0  

./calc 12 / -12  
Quotient: -1  
Remainder: 0  

./calc -12 / -12  
Quotient: 1  
Remainder: 0  

./calc -12 / 12  
Quotient: -1  
Remainder: 0  

./calc -12 / 0  
Error: Division by zero not allowed.
