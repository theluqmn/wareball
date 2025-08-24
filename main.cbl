       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       FILE SECTION.
       FD INVENTORY-DATA.
       01 ITEM-RECORD.
           05 ITEM-ID PIC X(20).
           05 ITEM-DESCRIPTION PIC X(64).
           05 ITEM-QUANTITY PIC 9(5).
           05 ITEM-PRICE PIC 9(5)V99.

       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X(10).

       PROCEDURE DIVISION.
       DISPLAY "------------------------------------------".
       DISPLAY "WAREBALL".
       DISPLAY " ".
       DISPLAY "inventory done correctly".
       DISPLAY "run 'help' for list of available commands.".
       PERFORM MAIN-PROCEDURE.

       MENU-PROCESS.
           IF MENU-INPUT = "help" THEN
               PERFORM MENU-HELP
           ELSE IF MENU-INPUT = "exit" THEN
               PERFORM MAIN-EXIT
           ELSE IF MENU-INPUT = "add" THEN
               PERFORM OPERATION-ADD
           ELSE IF MENU-INPUT = "update" THEN
               PERFORM OPERATION-UPDATE
           ELSE IF MENU-INPUT = "delete" THEN
               PERFORM OPERATION-DELETE
           ELSE IF MENU-INPUT = "report" THEN
               PERFORM OPERATION-REPORT
           ELSE
               DISPLAY "[!] unknown command entered."
           END-IF.

       MENU-DISPLAY.
           DISPLAY "------------------------------------------".
           ACCEPT MENU-INPUT.
           PERFORM MENU-PROCESS.
       
       MENU-HELP.
           DISPLAY "------------------------------------------".
           DISPLAY "LIST OF COMMANDS".
           DISPLAY " ".
           DISPLAY "[add]      add an item".
           DISPLAY "[update]   update an item's quantity".
           DISPLAY "[delete]   delete an item".
           DISPLAY "[report]   generate a report".
           DISPLAY "-".
           DISPLAY "[exit]     exit the wareball CLI".

       OPERATION-ADD.
           DISPLAY "------------------------------------------".
           DISPLAY "ADD A NEW ITEM".
           DISPLAY " ".
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
           DISPLAY " ".
           DISPLAY "(1/2) ID:".
           ACCEPT ITEM-ID.
           DISPLAY "(2/2) quantity:".
           ACCEPT ITEM-QUANTITY.

           DISPLAY " ".
           DISPLAY "item updated successfully".
       
       OPERATION-DELETE.
           DISPLAY "------------------------------------------".
           DISPLAY "DELETE AN ITEM".
           DISPLAY " ".
           DISPLAY "ID:".
           ACCEPT ITEM-ID.

           DISPLAY " ".
           DISPLAY "item deleted successfully".
       
       OPERATION-REPORT.
           DISPLAY "------------------------------------------".
           DISPLAY "GENERATE A NEW REPORT".
           DISPLAY " ".

       MAIN-PROCEDURE.
           PERFORM MENU-DISPLAY UNTIL MENU-INPUT = "0".
       
       MAIN-EXIT.
           DISPLAY "[!] exiting WAREBALL..."
           STOP RUN.

       END PROGRAM WAREBALL.
