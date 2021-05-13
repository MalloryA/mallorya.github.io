---
layout: post
title:  "Exercise: What Is a Foreign Key?"
date:   2021-05-13 01:53:07 -0400
categories: exercise database
---
A database is a piece of software responsible for storing and retrieving data. There are several types of database; one very popular type is a “relational” database. I’ll explain what relational means after a brief example.

A relational database is made up of tables. You can think of a table as a spreadsheet where each row represents one “thing” (or “record”) and each column represents a piece of information that can be stored about that record. Here’s a simple table containing three animals:

Figure 1: The animal table.

| ID | Name | Type   |
|----|------|--------|
| 1  | Fox  | Mammal |
| 2  | Bear | Mammal |
| 3  | Owl  | Bird   |

The “ID” column is a handy way to refer back to that particular record in the table; it doesn’t change when other data in the record changes. Each record has a unique ID number within the table.

This table has a problem. The “type” column is going to lead to a lot of data being repeated over and over again. That data could be separated and put into its own table:

Figure 2: The animal type table.

| ID | Type name |
|----|-----------|
| 1  | Mammal    |
| 2  | Mammal    |
| 3  | Bird      |

Now that the animal types are in their own table, here’s an updated table for the animals:

Figure 3: The new animal table.

| ID | Name | Type ID |
|----|------|---------|
| 1  | Fox  | 1       |
| 2  | Bear | 1       |
| 3  | Owl  | 2       |

In the new animal table (figure 3) the “Fox” record has a “Type ID” of 1 referring to record 1 of the animal types table (figure 2). Therefore, record 1 of the animal types table has a “Type name” of “Mammal”.

The “Type ID” column is a foreign key. Because it refers to a key in a different table. One table referring to another table is a relation. That’s why these are called relational databases.

In a small example like this, the benefits are small. However, when used on a larger scale, this approach can save a lot of space in the database, and it also allows adding extra information about each animal type. For example a “description” field could be added explaining what is meant by a “mammal” or a “bird”.
