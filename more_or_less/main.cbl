000001 IDENTIFICATION DIVISION.
000002 PROGRAM-ID. MOREORLESS.
000003 DATE-WRITTEN. 08/07/24 14:44.
000004 AUTHOR. MIBI88.
000005 ENVIRONMENT DIVISION.
000006 CONFIGURATION SECTION.
000007 SOURCE-COMPUTER. GNUCOBOL.
000008 OBJECT-COMPUTER. GNUCOBOL.
000009
000010 DATA DIVISION.
000011 WORKING-STORAGE SECTION.
000012 01 NUM PIC 9(3).
000013 01 EXPECTED PIC 9(3).
000014 01 SEED PIC 9(3) VALUE 492.
000015 01 TRIESLEFT PIC 99 VALUE 10.
000016 PROCEDURE DIVISION.
000017
000018 MAIN.
000019 DISPLAY "= MORE OR LESS =".
000020 PERFORM RANDINT.
000021 PERFORM UNTIL (NUM = EXPECTED) OR (TRIESLEFT = 0)
000022 PERFORM LOOP
000023 END-PERFORM.
000024 IF TRIESLEFT > 0
000025 DISPLAY "YOU WIN!"
000026 ELSE
000027 DISPLAY "GAME OVER!".
000028 STOP RUN.
000029*IN GAME.
000030 LOOP.
000031 DISPLAY "Tries left: ", TRIESLEFT.
000032 DISPLAY "Enter a number.".
000033 ACCEPT NUM FROM CONSOLE.
000034 IF (NUM < EXPECTED) AND (TRIESLEFT > 1)
000035 DISPLAY "TRY A BIGGER NUMBER.".
000036 IF (NUM > EXPECTED) AND (TRIESLEFT > 1)
000037 DISPLAY "TRY A SMALLER NUMBER.".
000038 SUBTRACT 1 FROM TRIESLEFT.
000039 GO-BACK.
000040*GENERATE A RANDOM NUMBER.
000041 RANDINT.
000042 CALL "srand" USING SEED.
000043 CALL "rand".
000044 MOVE RETURN-CODE TO EXPECTED.
000045 GO-BACK.
