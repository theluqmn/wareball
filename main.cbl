      *this is a COBOL program to handle inventory management
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X(10).

       01 ITEM-DATA.
           05 ITEM-ID PIC X(20).
           05 ITEM-DESCRIPTION PIC X(64).
           05 ITEM-QUANTITY PIC 9(5).
           05 ITEM-PRICE PIC 9(5)V99.
       
       01 INVENTORY.
           05 ITEM-DATA OCCURS 100 TIMES.
               10 FILLER PIC X(20).
               10 FILLER PIC X(64).
               10 FILLER PIC 9(5).
               10 FILLER PIC 9(5)V99.

       PROCEDURE DIVISION.
       DISPLAY "------------------------------------------".
       DISPLAY "WAREBALL".
       DISPLAY "inventory done correctly".
       DISPLAY "run 'help' for list of available commands.".
       PERFORM MAIN-PROCEDURE.

      *processing the menu input to call functions
       MENU-PROCESS.
           IF MENU-INPUT = "help" THEN
               PERFORM MENU-HELP.
           IF MENU-INPUT = "quit" THEN
               PERFORM MAIN-END.
           IF MENU-INPUT = "add" THEN
               PERFORM OPERATION-ADD.
           IF MENU-INPUT = "update" THEN
               PERFORM OPERATION-UPDATE.
           IF MENU-INPUT = "delete" THEN
               PERFORM OPERATION-DELETE.
           IF MENU-INPUT = "report" THEN
               PERFORM OPERATION-REPORT.

      *display the menu
       MENU-DISPLAY.
           DISPLAY "------------------------------------------".
           ACCEPT MENU-INPUT.
           PERFORM MENU-PROCESS.
       
       MENU-HELP.
           DISPLAY "------------------------------------------".
           DISPLAY "LIST OF COMMANDS".
           DISPLAY "------------------------------------------".
           DISPLAY "[add]      add an item".
           DISPLAY "[update]   update an item's quantity".
           DISPLAY "[delete]   delete an item".
           DISPLAY "[report]   generate a report".
           DISPLAY "-".
           DISPLAY "[quit]     quit wareball".

      *operation to add new item
       OPERATION-ADD.
           DISPLAY "------------------------------------------".
           DISPLAY "ADD A NEW ITEM".
           DISPLAY "------------------------------------------".
           DISPLAY "(1/4) ID:".
           ACCEPT ITEM-ID.
           DISPLAY "(2/4) description:".
           ACCEPT ITEM-DESCRIPTION.
           DISPLAY "(3/4) quantity:".
           ACCEPT ITEM-QUANTITY.
           DISPLAY "(4/4) price:".
           ACCEPT ITEM-PRICE.

           DISPLAY " ".
           DISPLAY "item added successfully".
       
       OPERATION-UPDATE.
           DISPLAY "------------------------------------------".
           DISPLAY "UPDATE AN ITEM".
           DISPLAY "------------------------------------------".
           DISPLAY "(1/2) ID:".
           ACCEPT ITEM-ID.
           DISPLAY "(2/2) quantity:".
           ACCEPT ITEM-QUANTITY.

           DISPLAY " ".
           DISPLAY "item updated successfully".
       
       OPERATION-DELETE.
           DISPLAY "------------------------------------------".
           DISPLAY "DELETE AN ITEM".
           DISPLAY "------------------------------------------".
           DISPLAY "ID:".
           ACCEPT ITEM-ID.

           DISPLAY " ".
           DISPLAY "item deleted successfully".
       
       OPERATION-REPORT.
           DISPLAY "------------------------------------------".
           DISPLAY "GENERATE A NEW REPORT".
           DISPLAY "------------------------------------------".

      *main program loop
       MAIN-PROCEDURE.
           PERFORM MENU-DISPLAY UNTIL MENU-INPUT = "0".
       
       MAIN-END.
           DISPLAY "exiting WAREBALL..."
           STOP RUN.

       END PROGRAM WAREBALL.
