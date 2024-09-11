NOTE: except the .sql files, all the other ones are written completely in Romanian due to the assignment rules

The "Project.pdf" file contains the entire project, explained step-by-step, in Romanian, meaning that if a Romanian speaker wants to read the code/project, they can do it easily by accessing this file.

    For the English speakers:

The table names are in Romanian, so this is their translation: (format: [RO] = [EN] )
  - ADRESA = ADDRESS
  - CLIENT = CLIENT
  - COMANDA = ORDER
  - FEEDBACK = FEEDBACK
  - PRODUS = PRODUCT
  - COLECTIE = COLLECTION
  - ANGAJAT = EMPLOYEE
  - CROITOR = SEWER
  - DESIGNER = DESIGNER
  - TIPAR = PATTERN
  - MATERIAL = MATERIAL
  - FURNIZOR = SUPPLIER

Note: due to the large number of column names, it is best to refer mainly to the "ERD.pdf" diagram, considering that "conceptual_diagram.pdf" contains all of the column names in romanian (39 columns excepting the primary and foreign keys)

    REQUIREMENTS:

Perform the design, implementation and procedural exploitation of a relational database, following the steps below:

1. Description of the actual model, its utility and operating rules.
2. Presentation of the constraints (restrictions, rules) imposed on the model.
3. Description of the entities, including specifying the primary key.
4. Description of relationships, including specification of their cardinality.
5. Description of attributes, including data type and possible constraints, default values, possible attribute values.
6. Creation of the entity-relationship diagram corresponding to the description in points 3-5.
7. Creation of the conceptual diagram corresponding to the entity-relationship diagram designed in point 6. The obtained conceptual diagram must contain at least 7 tables (not including sub-entities), of which at least one is an associative table.
8. Enumeration of the relational schemes corresponding to the conceptual diagram designed in point 7.
9. Perform normalization up to normal form 3 (NF1-NF3).
10. Creating a sequence that will be used in inserting records into the tables (point 11).
11. Creating tables in SQL and inserting consistent data into each of them (minimum 5 records in each non-associative table; minimum 10 records in associative tables; maximum 30 records in each table).
12. Formulate in natural language and implement 5 complex SQL requests that will use, in their entirety, the following elements: 
    a) synchronized subrequests involving at least 3 tables
    b) unsynchronized subrequests in the FROM clause
    c) data groupings, group functions, filtering at group level with unsynchronized subrequests (in the HAVING clause) involving at least 3 tables (within the same request)
    d) orders and the use of the NVL and DECODE functions (within the same request)
    e) the use of at least 2 functions on character strings, 2 functions on calendar dates, at least one CASE expression
    f) use of at least 1 request block (WITH clause)
    Note: A request will contain several elements from those listed above, so that the 5 requests include them all.
14. Implement 3 update and delete data operations using subqueries.
15. Creating a complex view. Give an example of a permitted LMD operation on that view and an example of a disallowed LMD operation.
16. Formulate in natural language and implement in SQL: a request that uses the outer-join operation on at least 4 tables, a request that uses the division operation and a request that implements top-n analysis.
    Note: The 3 applications are different from the applications in exercise 12.
