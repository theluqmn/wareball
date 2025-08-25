       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INVENTORY-FILE ASSIGN TO "inventory"
           ORGANISATION IS INDEXED
           ACCESS IS DYNAMIC
           RECORD KEY IS ITEM-ID
           FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD INVENTORY-FILE.
       01 INVENTORY-RECORD.
           05 ITEM-ID PIC X(10).
           05 ITEM-DESCRIPTION PIC X(20).
           05 ITEM-QUANTITY PIC 9(8).
           05 ITEM-PRICE PIC 9(5)V99.

       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X(10).
       01 FILE-STATUS PIC XX.
       01 WS-ITEM-ID PIC X(10).
       01 WS-ITEM-QUANTITY PIC 9(8).
       01 COUNTER PIC 9(3).

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
           ELSE IF MENU-INPUT = "setup" THEN
               PERFORM MENU-SETUP
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
           DISPLAY "> " WITH NO ADVANCING.
           ACCEPT MENU-INPUT.
           PERFORM MENU-PROCESS.
       
       MENU-SETUP.
           DISPLAY "------------------------------------------".
           DISPLAY "SETUP WAREBALL".
           DISPLAY " ".

           OPEN OUTPUT INVENTORY-FILE.
           CLOSE INVENTORY-FILE.
           DISPLAY "(1/1) inventory file created".
           DISPLAY "setup complete".

       MENU-HELP.
           DISPLAY "------------------------------------------".
           DISPLAY "LIST OF COMMANDS".
           DISPLAY " ".
           DISPLAY "[add]      add an item".
           DISPLAY "[update]   update an item's quantity".
           DISPLAY "[delete]   delete an item".
           DISPLAY "[report]   generate a report".
           DISPLAY "-".
           DISPLAY "[setup]    setup wareball".
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

           OPEN I-O INVENTORY-FILE.
           WRITE INVENTORY-RECORD.
           CLOSE INVENTORY-FILE.

           DISPLAY " ".
           DISPLAY "item added successfully".
       
       OPERATION-UPDATE.
           DISPLAY "------------------------------------------".
           DISPLAY "UPDATE AN ITEM".
           DISPLAY " ".
           DISPLAY "(1/2) ID:".
           ACCEPT ITEM-ID.
           DISPLAY "(2/2) quantity:".
           ACCEPT WS-ITEM-QUANTITY.

           DISPLAY " ".
           OPEN I-O INVENTORY-FILE.
           READ INVENTORY-FILE KEY IS ITEM-ID
               INVALID KEY
                   DISPLAY "Item not found."
               NOT INVALID KEY
                   MOVE WS-ITEM-QUANTITY TO ITEM-QUANTITY
                   REWRITE INVENTORY-RECORD
                   DISPLAY "Item updated successfully."
           END-READ.
           CLOSE INVENTORY-FILE.
       
       OPERATION-DELETE.
           DISPLAY "------------------------------------------".
           DISPLAY "DELETE AN ITEM".
           DISPLAY " ".
           DISPLAY "ID:".
           ACCEPT WS-ITEM-ID.

           OPEN I-O INVENTORY-FILE.
           DISPLAY " ".
           MOVE WS-ITEM-ID TO ITEM-ID.
           DELETE INVENTORY-FILE
               INVALID KEY DISPLAY "item not found"
               NOT INVALID KEY DISPLAY "item deleted successfully"
           END-DELETE.
           CLOSE INVENTORY-FILE.
       
       OPERATION-REPORT.
           DISPLAY "------------------------------------------".
           DISPLAY "INVENTORY REPORT".
           DISPLAY " ".

           DISPLAY 
           "NUM |"
           " ITEM ID    |"
           " DESCRIPTION          |"
           " QUANTITY |"
           " PRICE".
           DISPLAY "----|"
           "------------|"
           "----------------------|"
           "----------|"
           "----------".

           MOVE 0 TO COUNTER.

           OPEN INPUT INVENTORY-FILE
           PERFORM UNTIL FILE-STATUS NOT = '00'
               READ INVENTORY-FILE next
                   AT END MOVE '99' TO FILE-STATUS
               NOT AT END
                   ADD 1 TO COUNTER
                   DISPLAY
                   COUNTER " | "
                   ITEM-ID " | "
                   ITEM-DESCRIPTION " | "
                   ITEM-QUANTITY " | "
                   ITEM-PRICE
               END-READ
           END-PERFORM
           CLOSE INVENTORY-FILE.

           DISPLAY " ".
           DISPLAY "total: " COUNTER.

       MAIN-PROCEDURE.
           PERFORM MENU-DISPLAY UNTIL MENU-INPUT = "0".
       
       MAIN-EXIT.
           DISPLAY "[!] exiting WAREBALL..."
           STOP RUN.

       END PROGRAM WAREBALL.
