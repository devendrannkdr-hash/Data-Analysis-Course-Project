# Python Assignment 2 -- Data Structures: List, Dictionary, Set & Conditional Statements

## Overview

This assignment demonstrates Python data structures and conditional
statements. It covers list creation and modification, list indexing and
slicing, dictionary operations, set operations, and performance
classification using `if`, `elif`, and `else`.

## Assignment Contents

### 1. List Creation

Create: - `age_list` with five integer elements:
`[24, 25, 26, 27, 28]` - `name_list` with five string elements:
`["Arun", "Bala", "Charan", "Divya", "Kavin"]`

**Sample output**

``` text
Age List: [24, 25, 26, 27, 28]
Name List: ['Arun', 'Bala', 'Charan', 'Divya', 'Kavin']
```

### 2. List Operations / Modifications

Perform the following operations: - Append `"Yazhini"` to `name_list`. -
Insert `30` at index `2` in `age_list`. - Remove `"Yazhini"` from
`name_list`. - Pop the last element from `age_list`. - Extend `age_list`
with `[29, 30, 26]`. - Sort `age_list` in descending order. - Find the
maximum, minimum, and sum of the ages.

**Sample output**

``` text
After Append: ['Arun', 'Bala', 'Charan', 'Divya', 'Kavin', 'Yazhini']
After Insert: [24, 25, 30, 26, 27, 28]
After Remove: ['Arun', 'Bala', 'Charan', 'Divya', 'Kavin']
After Pop: [24, 25, 30, 26, 27]
After Extend: [24, 25, 30, 26, 27, 29, 30, 26]
After Sorting: [30, 30, 29, 27, 26, 26, 25, 24]
Maximum Age: 30
Minimum Age: 24
Sum of All Ages: 217
```

### 3. Accessing List Elements

Using `name_list`: - Print the first element. - Print the last
element. - Print elements from index `2` to index `4`. - Print the list
in reverse order.

**Sample output**

``` text
First Element: Arun
Last Element: Kavin
Elements from Index 2 to 4: ['Charan', 'Divya', 'Kavin']
Reversed List: ['Kavin', 'Divya', 'Charan', 'Bala', 'Arun']
```

### 4. Dictionary -- Creation, Modification and Access

Create `student_marks` with five students and their marks (on a scale
from 0 to 100). The notebook uses these entries: - Arun: 85 - Bala: 78 -
Charan: 92 - Divya: 88 - Kavin: 75

Then: - Access and print Charan's mark. - Add Janani with a mark of
`80`. - Update Bala's mark to `82`. - Display all dictionary keys,
values, and key-value pairs using `keys()`, `values()`, and `items()`.

**Sample output**

``` text
Student Marks: {'Arun': 85, 'Bala': 78, 'Charan': 92, 'Divya': 88, 'Kavin': 75}
Charan's Mark: 92
After Adding Janani: {'Arun': 85, 'Bala': 78, 'Charan': 92, 'Divya': 88, 'Kavin': 75, 'Janani': 80}
After Updating Bala: {'Arun': 85, 'Bala': 82, 'Charan': 92, 'Divya': 88, 'Kavin': 75, 'Janani': 80}
```

The notebook also prints the dictionary's keys, values, and items.

### 5. Sets -- Operations

Perform the following operations: - Create `my_set` from
`['a', 'e', 'i', 'o', 'u', 'a', 'a', 'i']`. - Analyse the output. -
Attempt `my_set[4] = 's'` and explain the error. - Create
`set1 = {1, 3, 5, 7, 9}` and `set2 = {2, 3, 5, 8, 10}`. - Print the
union and intersection of the two sets.

**Sample output**

``` text
My Set: {'a', 'i', 'u', 'o', 'e'}
Error: 'set' object does not support item assignment
Explanation: Sets are unordered and do not support indexing.
Set 1: {1, 3, 5, 7, 9}
Set 2: {2, 3, 5, 8, 10}
Union: {1, 2, 3, 5, 7, 8, 9, 10}
Intersection: {3, 5}
```

**Note:** Set element display order can vary between Python runs. Sets
automatically remove duplicate values and do not support indexing or
item assignment.

### 6. Operators & Conditional Statements (`if`, `elif`, `else`)

Create a performance category program that: - Prompts the user to enter
a score from `0` to `10`, inclusive. - Prints **Above Average** when the
score is greater than `7`. - Prints **Average** when the score is
between `4` and `7`, inclusive. - Prints **Below Average** when the
score is less than `4`. - Displays an encouraging message for each
category.

The notebook also checks and reports a score outside the valid range.

**Sample output**

``` text
Enter your score (0 to 10): 7
Average: Good effort! Keep practicing, there's room for improvement.
```

**Google folder link : [Google Colab](https://drive.google.com/drive/folders/1hXvTGaHSJNsdjnM7IPuOXWwy337J5Oaq?usp=sharing)**
## Concepts Practised

-   List creation, `append()`, `insert()`, `remove()`, `pop()`,
    `extend()`, and `sort()`
-   List indexing, slicing, and reversing
-   Built-in functions: `max()`, `min()`, and `sum()`
-   Dictionary creation, access, addition, and updating
-   Dictionary methods: `keys()`, `values()`, and `items()`
-   Set creation, duplicate removal, union, and intersection
-   Set ordering and item-assignment behaviour
-   Conditional statements using `if`, `elif`, and `else`
-   User input using `input()` and output using `print()`

## How to Run

1.  Open the `.ipynb` notebook in [Google
    Colab](https://colab.research.google.com/) or Jupyter Notebook.
2.  Run the cells in order, starting from Question 1.
3.  When prompted in Question 6, enter a score between `0` and `10`.
4.  Compare the displayed results with the sample outputs in this
    README.

## Files

-   `Python_Assignment_2_Data_Structures_List,_Dictionary,_Set_&_Conditional_Statements.ipynb`
    -- Notebook containing the assignment questions, Python code, and
    executed outputs.
-   `README.md` -- Assignment overview, topics covered, sample outputs,
    and run instructions.

------------------------------------------------------------------------

**Assignment:** Python Assignment 2 -- Data Structures: List,
Dictionary, Set & Conditional Statements\
**Module:** 4 -- Data Analytics
