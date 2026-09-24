# College Management System – ER Diagram

## Assignment Question

Draw an ER diagram for a College Management System including the following entities:

* Student
* Course
* Faculty
* Department

## Relationships

Your ER diagram must include the following relationships:

1. One Department has many Students.
2. One Faculty handles many Courses.
3. Many Students can enroll in many Courses.

## Cardinalities

Clearly represent:

| Relationship         | Cardinality        |
| -------------------- | ------------------ |
| Department – Student | One-to-Many (1:M)  |
| Faculty – Course     | One-to-Many (1:M)  |
| Student – Course     | Many-to-Many (M:N) |

## One-to-One Relationship

The assignment asks you to mention one-to-one, one-to-many, and many-to-many relationships clearly.

For this particular College Management System, the specified relationships are:

* One-to-Many: Department → Student
* One-to-Many: Faculty → Course
* Many-to-Many: Student ↔ Course

No one-to-one relationship is specified among these four entities. Students should clearly mention this in `relationships.txt`.

## Submission Requirements

Submit the following files:

### 1. ER Diagram

Save your ER diagram as:

```text
diagram.png
```

The diagram should clearly show:

* Student
* Course
* Faculty
* Department
* Relationships
* Cardinalities

### 2. Relationship Description

Complete:

```text
relationships.txt
```

Use the required relationship descriptions.

## Example Relationship Description

```text
Department - Student: One-to-Many (1:M)
Faculty - Course: One-to-Many (1:M)
Student - Course: Many-to-Many (M:N)
One-to-One: Not specified for the given entities and relationships
```
