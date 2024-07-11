000001 IDENTIFICATION DIVISION.
000002 PROGRAM-ID. OPENGLTEST.
000003 DATE-WRITTEN. 08/07/24 14:44.
000004 AUTHOR. MIBI88.
000005 ENVIRONMENT DIVISION.
000006 CONFIGURATION SECTION.
000007 SOURCE-COMPUTER. GNUCOBOL.
000008 OBJECT-COMPUTER. GNUCOBOL.
000009
000010 DATA DIVISION.
000011 WORKING-STORAGE SECTION.
000012 01 SDL.
000013 02 QUIT PIC 9.
000014 02 KEYDOWN PIC 9(4).
000015 01 SEED PIC 9(3) VALUE 492.
000016
000017 PROCEDURE DIVISION.
000018
000019 MAIN.
000020 PERFORM CREATEWINDOW.
000021 PERFORM UNTIL QUIT <> 0
000022 PERFORM LOOP
000023 END-PERFORM.
000024 STOP RUN.
000025*MAIN LOOP.
000026 LOOP.
000027 CALL "cobGlBegin".
000028 CALL "cobGlVertex3v3" USING +000.000 +000.500 +000.000.
000029 CALL "cobGlColor3v3" USING +001.000 +000.000 +000.000.
000030 CALL "cobGlVertex3v3" USING -000.500 -000.500 +000.000.
000031 CALL "cobGlColor3v3" USING +000.000 +001.000 +000.000.
000032 CALL "cobGlVertex3v3" USING +000.500 -000.500 +000.000.
000033 CALL "cobGlColor3v3" USING +000.000 +000.000 +001.000.
000034 CALL "glEnd".
000035 PERFORM WITH TEST AFTER UNTIL KEYDOWN = 0
000036 PERFORM GETKEY
000037 END-PERFORM.
000038 PERFORM ENDCHECK.
000039*CHECK IF THE USER TRIES TO QUIT.
000040 ENDCHECK.
000041 CALL "quit".
000042 MOVE RETURN-CODE TO QUIT.
000043*CREATE A WINDOW
000044 CREATEWINDOW.
000045 CALL "open_window".
000046*GET THE CURRENTLY PRESSED KEY.
000047 GETKEY.
000048 CALL "get_next_key"
000049 MOVE RETURN-CODE TO KEYDOWN.