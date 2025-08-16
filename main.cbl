      *this is a COBOL program to handle inventory management
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WAREBALL.
       AUTHOR. theluqmn.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MENU-INPUT PIC X.

       PROCEDURE DIVISION.
      *processing the menu input to call functions
       MENU-PROCESS.
           IF MENU-INPUT = "1" THEN
               DISPLAY "1".

      *display the menu
       MENU-DISPLAY.
           DISPLAY "WAREBALL".
           DISPLAY "inventory done correctly".
           DISPLAY "".
           DISPLAY "[0] quit program".
           ACCEPT MENU-INPUT.
           PERFORM MENU-PROCESS.

      *main program loop
       PERFORM MENU-DISPLAY UNTIL MENU-INPUT = 0.
       DISPLAY "exiting WAREBALL..."
       STOP RUN.
       
       END PROGRAM WAREBALL.