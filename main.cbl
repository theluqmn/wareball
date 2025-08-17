      *this is a COBOL program to handle inventory management
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X.

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
       PERFORM MAIN-PROCEDURE.

      *processing the menu input to call functions
       MENU-PROCESS.
           IF MENU-INPUT = "0" THEN
               PERFORM MAIN-END.
           IF MENU-INPUT = "1" THEN
               PERFORM OPERATION-ADD.

      *display the menu
       MENU-DISPLAY.
           DISPLAY "------------------------".
           DISPLAY "WAREBALL".
           DISPLAY "inventory done correctly".
           DISPLAY "------------------------".
           DISPLAY "[1] add item".
           DISPLAY "[2] update item".
           DISPLAY "[3] delete item".
           DISPLAY "[4] generate report".
           DISPLAY "-".
           DISPLAY "[0] quit program".
           DISPLAY " ".
           ACCEPT MENU-INPUT.
           PERFORM MENU-PROCESS.

      *operation to add new item
       OPERATION-ADD.
           DISPLAY "------------------------".
           DISPLAY "ADD A NEW ITEM".
           DISPLAY "------------------------".
           DISPLAY "(1/4) ID:".
           ACCEPT ITEM-ID.
           DISPLAY "(2/4) description:".
           ACCEPT ITEM-DESCRIPTION.
           DISPLAY "(3/4) quantity:".
           ACCEPT ITEM-QUANTITY.
           DISPLAY "(4/4) price:".
           ACCEPT ITEM-PRICE.
       
       OPERATION-UPDATE.
           DISPLAY "------------------------".
           DISPLAY "UPDATE AN ITEM".
           DISPLAY "------------------------".
       
       OPERATION-DELETE.
           DISPLAY "------------------------".
           DISPLAY "DELETE AN ITEM".
           DISPLAY "------------------------".
       
       OPERATION-REPORT.
           DISPLAY "------------------------".
           DISPLAY "GENERATE A NEW REPORT".
           DISPLAY "------------------------".

      *main program loop
       MAIN-PROCEDURE.
           PERFORM MENU-DISPLAY UNTIL MENU-INPUT = "0".
       
       MAIN-END.
           DISPLAY "exiting WAREBALL..."
           STOP RUN.

       END PROGRAM WAREBALL.
