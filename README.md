# Cricket Camp Management

This is a Cricket Camp Management data and application project, build from the perspective of the data it consumes, processes and stores. 
The first phase of the project dealt with the definition of the mini-world, and the software requirements specification. 
This was converted into an entity-relation model in the second phase, while was translated into a relational model and normalised upto the 3rd normal form in the third phase. 
In the fourth phase, the database schema was used to build a basic command-line application.

## data.sql


It contains the overall database in the form of tables.
Tables:
1. participants
2. coaches
3. staff
4. administration
5. schedule
6. 4 tables for participant's marks in various fields
7. transportation
8. Equipments
9. canteen
10. progress card
11. progress
12. contact number of participants, admin, coaches,staff etc. are in seperate table


## .py file
- It contains an add function that can add/ insert new data for administration or new equipments.

- It contains an update function that can update new data i.e. specific entities for administration or new equipments.

- It contains an delete function that can delete data for administration or new equipments that withdraw and break/become out of use respectively.

- It contains an view marks function that shows Total marks of a particular student provided his participant id. (Aggregate)

- It contains an view height and age function that shows height and age of students with a particular weight threshold.(Projection and Selection)
