NOTE: all code comments were made in Romanian due to the projects requirements

    PROJECT 1

Project 1 consists of choosing a minimum of 4 classes exemplifying an application, such as a video game store, Netflix, etc.
For all the classes, the incapsulation concept has to be respected. The project must contain comments.

  Requirements:
  - Build a mini-application that manages a small business, an agenda, a planification, etc.
  - The app must contain a minimum of 4 classes.
  - The choice of classes has to be logical, so each class should be related to each other.
  - Every class must contain a minimum of 4 variables, and in the project all of these types must be found: int/long, bool, char, char*, float, int*/float*, double, const, static (!no string, vector, set, list, etc. types allowed).
  - For at least 2 of the classes you must build Setters and Getters, and you must have setters/getters for all of the variable types mentioned above.
  - Each class must have:
      * Constructor with no parameters
      * Constructor with all parameters
      * Constructors (at least 2) with a few parameters
      * Copy-Constructor
      * Destructor
      * Overloaded = operator
      * Overloaded << and >> operators
      * Overloaded [] indexing operator
      * Operator ++ or -- (the 2 forms)
      * A minimum of 2 mathematical operators (+, -, *, or /) - comutativity must be respected
      * Operator cast (type conversion) implicit or explicit
      * A minimum of 1 conditional operator (<, <=, >, >=)
      * Operator == (optional: also !=)
  - Each class must have a functionality (ex. if we have an Agenda class, you can make a function that shows the dates you are free in August)
  - For 2 of the chosen classes the mathematical operators that allow operations between the 2 classes must exist. (ex. for class A and class B, we can overload the "+" operator so we can do A+B, A+A+B, A+B+A+B, ...)
  - The project must have an interactive menu that can at least allow the base operations (CRUD - Create Read Update Delete), but can also show the app functionalities.

NOTE: no input verifying must be done (including throwing and catching exceptions) - this means you can insert wrong data without it being verified, even if the app crashes because of that.

MY PROJECT: 
  - classes: adr refers to an address, client refers to a client (contains an address), fir refers to a type of yarn, produs refers to a product (contains a dynamic array of yarn IDs), comanda refers to an order (contains a client and a dynamic array for products IDs)
  - CRUD: addresses, clients, yarn, products, orders can all be added, modified, read, deleted
  - functionalities: you can verify if an address is valid, if a client is completely registered (all of his data is stored), if a color of a type of yarn is available; you can see a product's price after taxes apply, the price of the most expensive product from an order
  - menu: you move through the menu with the up/down arrows and enter, the menu being refreshed after every pressed key (if you press another key, nothing happens, excepting when you have to write data that needs to be stored)



        PROJECT 2

Project 2 consists of choosing a minimum of 5 classes exemplifying an application, such as a video game store, Netflix, etc.
For all the classes, the incapsulation concept has to be respected. The project must contain comments.

  Requirements:
  - Build a mini-application that manages a small business, an agenda, a planification, etc.
  - The app must contain a minimum of 5 classes.
  - The choice of classes has to be logical, so each class should be related to each other.
  - Each class must contain:
      * Constructor with no parameters
      * Constructor with all parameters
      * Copy-Constructor
      * Overloaded = operator
      * Destructor
      * Overloaded << and >> operators
  - Exemplify the virtualization concept
  - Exemplify the inheritance concept for a minimum of 3 chosen classes
  - Exemplify the polymorphism concept
  - The project must contain at least 1 abstract class/interface (the interface does not count for the 3-classes inheritance)
  - Use the necessary operators for the interactive menu
  - Each class must contain a functionality
  - Use at least 1 const method
  - At least 1 multiple inheritance must exist!
  - The project must have an interactive menu that can at least allow the base operations (CRUD - Create Read Update Delete), but can also show the app functionalities.
  - Optional: you can consider creating a diamond inheritance
     
NOTE: no input verifying must be done (including throwing and catching exceptions) - this means you can insert wrong data without it being verified, even if the app crashes because of that.

MY PROJECT:
  - classes: interface refers to the project's interface (with input, output, and 2 "global" functionalities - "global" meaning for the rest of the classes), Card refers to a bank account, CardEconomii refers to a savings account, CardDebit refers to a debit account, CardIncorporat refers to an incorporated account (savings & debit account), CardCredit refers to a credit account
  - CRUD: savings, debit, incorporated, and credid accounts can all be added, modified, read, deleted
  - functionalities: make transactions; verify an account's number; check the annual interest value for savings or incorporated accounts; check the bonus given to teens that work for debit or incorporated accounts; recalculate the savings ratio for incorporated accounts; recalculate the interest rate for the economies for incorporated accounts; save money for incorporated accounts; check yearly credit bill for credit accounts 
  - menu: you move through the menu with the up/down arrows and enter, the menu being refreshed after every pressed key (if you press another key, nothing happens, excepting when you have to write data that needs to be stored)


        PROJECT 3

Project 3 consists of choosing a minimum of 4 classes exemplifying an application, such as a video game store, Netflix, etc.
For all the classes, the incapsulation concept has to be respected. The project must contain comments.

  Requirements:
  - Build a mini-application that manages a small business, an agenda, a planification, etc.
  - The app must contain a minimum of 4 classes.
  - The choice of classes has to be logical, so each class should be related to each other.
  - Implement at least 1 vector, 1 set, 1 list, 1 map from STL to manage the app data
  - The app will contain a console menu where the user can navigate - Singleton type
  - The use of at least 1 template class
  - The use of at least 2 template methods
  - Exemplify the upcasting and downcasting concepts (static_cast, dynamic_cast)
  - Exemplify the inheritance concept up to a grandparent
  - Exemplify the HasA and IsA concepts
  - Each class must contain:
      * Constructor with no parameters
      * Constructor with all parameters
      * Copy-Constructor
      * Overloaded = operator
      * Destructor
      * Overloaded << and >> operators

NOTE: the project needs to treat all possible exceptions (at least 6 exceptions must be thrown, from which 3 have to be different) - this means you should be unable to insert wrong data and the app should not be able to crash. (wrong data = wrong values for the code variables types)

MY PROJECT:
  - classes: produs refers to a product, haina refers to a garment, bluza refers to a blouse, pantaloni refers to a pair of trousers, accesoriu refers to an accessory, cercei refers to a pair of earrings, lant refers to a necklace, template class colectie refers to a collection, inventar refers to the shop inventory (Singleton); excIntrodVal and excIntrodOpt refer to 2 types of custom exceptions
  - CRUD: blouses, trousers, earrings, and necklaces can all be added, modified, read, deleted
  - functionalities: you can add products to collections, see the whole shop inventory, see the collections, see the products names and prices
  - menu: this time, due to the very short time until the deadline, the menu is pretty rudimentary, refreshing from time to time, depending on the state the user is in




  
