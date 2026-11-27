# Python Assignment 1 – Data Structures: Strings & Tuples

## Overview

This assignment demonstrates Python string operations and tuple manipulation, including concatenation, indexing, slicing, built-in string methods, and tuple operations.

## Assignment Contents

### 1. String Concatenation
- Accept a name from the user using `input()`.
- Join `"Hello "` with the entered name using the `+` operator.
- Append `", welcome to Python programming"` to the result.

**Sample output**

```text
Enter your Name: Zara
Hello Zara
Hello Zara, welcome to Python programming
```

### 2. String Slicing and Indexing
Using the concatenated string from Question 1:
- Print the first character.
- Print the last character.
- Print the first five characters.
- Print the last eleven characters.
- Reverse the string using slicing.
- Extract the word `Python` using slicing.

**Sample output**

```text
First character: H
Last character: g
First 5 characters: Hello
Last 11 characters: programming
Reverse string: gnimmargorp nohtyP ot emoclew ,araZ olleH
Extracted word: Python
```

### 3. String Methods
Using `strM = "Python beginner tutorial."`:
- Convert the sentence to uppercase with `upper()`.
- Convert the sentence to lowercase with `lower()`.
- Capitalize the sentence with `capitalize()`.
- Count lowercase `t` characters with `count('t')`.
- Replace `Python` with `Data Analytics` using `replace()`.

**Sample output**

```text
Uppercase: PYTHON BEGINNER TUTORIAL.
Lowercase: python beginner tutorial.
Capitalize: Python beginner tutorial.
Count of 't': 3
After replacement: Data Analytics beginner tutorial.
```

### 4. Tuples – Creation, Modification and Access
Create the tuples `(10, 20, 30)` and `(40, 50, 60)`, then:
- Concatenate them and store the result in `t_combine`.
- Repeat `t_combine` three times.
- Access the third element.
- Access the first three elements.
- Access the last three elements.

**Sample output**

```text
Combined Tuple: (10, 20, 30, 40, 50, 60)
Repeated Tuple: (10, 20, 30, 40, 50, 60, 10, 20, 30, 40, 50, 60, 10, 20, 30, 40, 50, 60)
Third Element: 30
First Three Elements: (10, 20, 30)
Last Three Elements: (40, 50, 60)
```

## Concepts Practised

- User input and output using `input()` and `print()`
- String concatenation using `+`
- String indexing and slicing
- String reversal using `[::-1]`
- Built-in string methods: `upper()`, `lower()`, `capitalize()`, `count()`, and `replace()`
- Tuple creation, concatenation (`+`), repetition (`*`), indexing, and slicing

## How to Run

1. Open the `.ipynb` notebook in [Google Colab](https://drive.google.com/drive/folders/1hXvTGaHSJNsdjnM7IPuOXWwy337J5Oaq?usp=sharing) or Jupyter Notebook.
2. Run the code cells in order, starting with Question 1.
3. When prompted, enter a name (for example, `Zara`).
4. Confirm that the displayed outputs match the sample outputs above.

## Files

- `Python_Assignment_1_Data_Structures_Strings_&_Tuples.ipynb` – Jupyter Notebook containing the assignment questions, Python code, and executed outputs.
- `README.md` – Assignment overview, topics covered, sample outputs, and run instructions.

---

**Assignment:** Python Assignment 1 – Data Structures – Strings & Tuples  
**Module:** 4 – Data Analytics
