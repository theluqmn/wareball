       IDENTIFICATION DIVISION.
       PROGRAM-ID. wareball-file-test.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INVENTORY-FILE ASSIGN TO "inventory.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD INVENTORY-FILE.
       01 TESTING-RECORD.
           05 ITEM-ID PIC X(20).
           05 ITEM-DESCRIPTION PIC X(64).
       
       WORKING-STORAGE SECTION.
       01 WS-EOF PIC X VALUE "N".

      *writing to the file
       PROCEDURE DIVISION.
       MOVE "ITEM0001" TO ITEM-ID.
       MOVE "Sample Item Description" TO ITEM-DESCRIPTION.

       OPEN EXTEND INVENTORY-FILE.
       WRITE TESTING-RECORD.
       CLOSE INVENTORY-FILE.

      *reading from the file
       OPEN INPUT INVENTORY-FILE.
       PERFORM UNTIL WS-EOF = "Y"
           READ INVENTORY-FILE
               AT END MOVE "Y" TO WS-EOF
               NOT AT END DISPLAY ITEM-ID " - " ITEM-DESCRIPTION
           END-READ
       END-PERFORM
       CLOSE INVENTORY-FILE.
       STOP RUN.
