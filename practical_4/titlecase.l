%{
#include <stdio.h>

// Function to convert a character to uppercase
char to_upper(char c) {
    if (c >= 'a' && c <= 'z') {
        return c + 32;  // Convert lowercase to uppercase
    }
    return c;  // Return unchanged if it's already uppercase or not a letter
}

// Function to convert a character to lowercase
char to_lower(char c) {
    if (c >= 'A' && c <= 'Z') {
        return c - 32;  // Convert uppercase to lowercase
    }
    return c;  // Return unchanged if it's already lowercase or not a letter
}

// Function to convert a word to title case
void title_case(char *str) {
    int i = 0;
    int isFirstChar = 1;  // Flag to track the first character in the word

    while (str[i]) {
        if (isFirstChar) {
            str[i] = to_upper(str[i]);  // Convert first character to uppercase
            isFirstChar = 0;  // Set flag to false after the first character
        } else {
            str[i] = to_lower(str[i]);  // Convert subsequent characters to lowercase
        }
        i++;
    }

    // Output the title-cased word
    printf("%s", str);
}
%}

%%

[a-zA-Z]+ { title_case(yytext); }  // Match words consisting of alphabetic characters

.|\n { putchar(yytext[0]); }  // Print any non-word characters (spaces, punctuation, etc.) as-is

%%

int main() {
    yylex();  // Start the lexical analysis
    return 0;
}
