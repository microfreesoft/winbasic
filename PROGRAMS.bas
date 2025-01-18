'  © JM. :: Hecho en Ronda
'  Lanzador de Programas: FileMan, Leame, Editor (Con INPUT)

RANDOMIZE TIMER
SCREEN 0
CLS

' Configuración de la interfaz
PALETTE 7, 46
LOCATE 1, 44: PRINT ","
LOCATE 2, 15: PRINT " * * * SYSTEM WINBASIC * * * "
PRINT STRING$(80, "_")
PRINT " * *  Version 3.0  * * * * * * *  Copyright (c) 2025 Microfreesoft Software  * *  "
PRINT STRING$(80, "-")
PRINT " Elija una opción escribiendo el número correspondiente:"

COLOR 0, 7
PRINT " 1. Word    2. Tabz   3. Draw    4. Agenda    5. Salir   "
COLOR 7, 0

' Simulación de carga
FOR a = 0 TO INT(RND * 90) + 10
    LOCATE 19, 20: PRINT " Cargando sistema "; a; "% "
    FOR aa = 1 TO 1000: NEXT
NEXT

' Bucle principal
DO
    LOCATE 12, 15: PRINT "Seleccione una opción (1-5): ";
    INPUT opcion$

    SELECT CASE opcion$
        CASE "1"
            CLS
            LOCATE 10, 10: PRINT "Abriendo FileMan..."
            SLEEP 2
            SHELL "word"
            CLS

        CASE "2"
            CLS
            LOCATE 10, 10: PRINT "Abriendo Leame..."
            SLEEP 2
            SHELL "Tabz"
            CLS

        CASE "3"
            CLS
            LOCATE 10, 10: PRINT "Abriendo Editor..."
            SLEEP 2
            SHELL "draw"
            CLS
			
		CASE "4"
            CLS
            LOCATE 10, 10: PRINT "Abriendo Shell..."
            SLEEP 2
            SHELL "agenda"
            CLS
	

        CASE "5"
            CLS
            LOCATE 10, 10: PRINT "Saliendo ..."
            SLEEP 2
            EXIT DO

        CASE ELSE
            LOCATE 14, 15: COLOR 12: PRINT "Opción no válida. Intente de nuevo."
            COLOR 7
            SLEEP 1
    END SELECT
LOOP

' Mensaje final divertido
LOCATE 10, 1
PRINT , , "---------------------------------------"
PRINT , , "-           ";
COLOR 0, 7: PRINT " WinBasic ";
COLOR 7, 0: PRINT "           -"
PRINT , , "-                                     -"
PRINT , , "-           Programa finalizado       -"
PRINT , , "-¡Gracias por usar microfreesoft!     -"
PRINT , , "-                                     -"
PRINT , , "---------------------------------------"

FOR a = 1 TO 6
    SOUND 1000, .7
    SOUND 2100, 2
NEXT
