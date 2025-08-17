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
           IF MENU-INPUT = "1"
               DISPLAY "1".
               DISPLAY "(1/4) enter ID:".
               ACCEPT ITEM-ID.

      *display the menu
       MENU-DISPLAY.
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

      *main program loop
       MAIN-PROCEDURE.
           PERFORM MENU-DISPLAY UNTIL MENU-INPUT = "0".
           MOVE "O" TO MENU-INPUT.
           DISPLAY "exiting WAREBALL..."
           STOP RUN.

       END PROGRAM WAREBALL.
