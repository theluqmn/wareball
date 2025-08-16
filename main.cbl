      *this is a COBOL program to handle inventory management
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X.

       PROCEDURE DIVISION.
       UI-MENU.
           DISPLAY "wareball".
           DISPLAY "[0] quit".
           ACCEPT MENU-INPUT.

       PERFORM UI-MENU UNTIL MENU-INPUT = 0.
       STOP RUN.
       
       END PROGRAM WAREBALL.