#!/bin/bash

set -u

echo "=========================================="
echo " COLLEGE MANAGEMENT ER DIAGRAM AUTOGRADING"
echo "=========================================="

# Find relationships.txt

REL_FILE=$(find . -type f -name "relationships.txt" | head -n 1)

if [ -z "$REL_FILE" ]; then
echo "FAIL: relationships.txt not found."
exit 1
fi

echo "PASS: relationships.txt found."
echo "File: $REL_FILE"

# Convert to lowercase for easier checking

CONTENT=$(tr '[:upper:]' '[:lower:]' < "$REL_FILE")

# Check Student

if ! echo "$CONTENT" | grep -q "student"; then
echo "FAIL: Student entity not mentioned."
exit 1
fi

echo "PASS: Student found."

# Check Course

if ! echo "$CONTENT" | grep -q "course"; then
echo "FAIL: Course entity not mentioned."
exit 1
fi

echo "PASS: Course found."

# Check Faculty

if ! echo "$CONTENT" | grep -q "faculty"; then
echo "FAIL: Faculty entity not mentioned."
exit 1
fi

echo "PASS: Faculty found."

# Check Department

if ! echo "$CONTENT" | grep -q "department"; then
echo "FAIL: Department entity not mentioned."
exit 1
fi

echo "PASS: Department found."

# Check Department-Student 1:M

if ! echo "$CONTENT" | grep -Eq "department.*student.*(one-to-many|1:m)" &&
! echo "$CONTENT" | grep -Eq "student.*department.*(one-to-many|1:m)"; then
echo "FAIL: Department-Student One-to-Many relationship not found."
exit 1
fi

echo "PASS: Department-Student 1:M found."

# Check Faculty-Course 1:M

if ! echo "$CONTENT" | grep -Eq "faculty.*course.*(one-to-many|1:m)" &&
! echo "$CONTENT" | grep -Eq "course.*faculty.*(one-to-many|1:m)"; then
echo "FAIL: Faculty-Course One-to-Many relationship not found."
exit 1
fi

echo "PASS: Faculty-Course 1:M found."

# Check Student-Course M:N

if ! echo "$CONTENT" | grep -Eq "student.*course.*(many-to-many|m:n)" &&
! echo "$CONTENT" | grep -Eq "course.*student.*(many-to-many|m:n)"; then
echo "FAIL: Student-Course Many-to-Many relationship not found."
exit 1
fi

echo "PASS: Student-Course M:N found."

# Check One-to-One mention

if ! echo "$CONTENT" | grep -Eq "one-to-one|1:1"; then
echo "FAIL: One-to-One relationship information not mentioned."
exit 1
fi

echo "PASS: One-to-One relationship information found."

# Find diagram file

DIAGRAM_FILE=$(find . -type f \(\
    -iname "diagram.png" -o \
    -iname "diagram.jpg" -o \
    -iname "diagram.jpeg" -o \
    -iname "diagram.pdf" \
   \) | head -n 1)

if [ -z "$DIAGRAM_FILE" ]; then
echo "FAIL: ER diagram file not found."
echo "Submit diagram.png, diagram.jpg, diagram.jpeg, or diagram.pdf."
exit 1
fi

echo "PASS: ER diagram file found:"
echo "$DIAGRAM_FILE"

echo "=========================================="
echo " ALL AUTOGRADING CHECKS PASSED"
echo "=========================================="

exit 0
